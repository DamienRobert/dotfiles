#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0

require 'set'
require 'dr/sh'
require 'dr/packages/process_helper'
require 'dr/packages/graphs'

module DR

	#how to install/remove packages
	module Packages
		module Handler
			# ./handlers.rb will call graphs.rb which calls handlers.rb so we get
			# a warning for this constant
			PackageHandlerError=Class.new(RuntimeError) # unless const_defined?(:PackageHandlerError)
			extend ProcessActions
			def self.process_actions(*_orig_actions,**orig_opts)
				super do |computers,*actions, **opts|
					types=opts.delete(:types)
					raise PackageHandlerError.new("No package types given") unless types
					computers.each do |computer|
						types.each do |type|
							puts "# #{computer} (#{type}) => #{actions} #{opts}" unless orig_opts[:verbose]==false
							self.handle(type, computer: computer, **opts).process(*actions,**opts)
						end
					end
				end
			end
			def self.handle(ptype, **opts)
				require "dr/packages/handlers/#{ptype}"
				Handler.const_get(Utils.to_camel_case(ptype.to_s).to_sym).new(**opts)
			rescue LoadError #the handler does not exist
				Handler::Generic.new(wrap: ptype, **opts)
			end
		end

		#to subclass:
		#get_packager, setup_packager, bootstrap, install, uninstall, update,
		#check_update, update_or_check, clean, change_mode
		class Handler::Generic
			extend ProcessActions
			#generate a process method which dispatch the passed arguments to the actions
			self.define_default_process(default: :show_infos)
			def self.process_actions(*actions,**orig_opts)
				return super if block_given? #allow subclasses do define their own actions
				# Handler::Generic will be subclassed in foo.rb, which will define
				# Handler::Foo => we infer the type 'foo' from the filename
				type= Pathname.new($0).basename.sub('.rb', '').to_s.to_sym
				super do |computers, *actions, **opts|
					computers.each do |computer|
						puts "# #{computer} (#{type}) => #{actions} #{opts}" unless orig_opts[:verbose]==false
						Handler.handle(type, computer: computer, **opts).process(*actions,**opts)
					end
				end
			end

			include PkgGraph
			#include SH::Utils
			def find_executable(*args)
				SH.find_executable(*args)
			end
			def output_list(*args)
				SH.output_list(*args)
			end

			def initialize(**opts)
				@opts=opts
				@computer=Computer.computer(opts[:computer])
				@sudo=@computer[:user][:sudo] || "sudo"
				@userpkgdir=Pathname.home+"opt/pkgmgr"
				@packager=opts[:packager] || get_packager
				warn "No packager found for #{self.class_infos}" if @packager.nil?
				setup_packager
				@graph_type=:both #:manual, :deps, :both
			end

			def class_infos
				c=self.class.to_s
				# when using Handler::Generic to wrap a non existing handler, we
				# want to know its real name
				c+="(#{@opts[:wrap]})" if @opts[:wrap]
				c
			end

			def get_packager
				#to subclass
			end
			def setup_packager
				#to subclass
			end

			def show_infos(groups: nil,**opts)
				DR::Utils.pretty_print(infos(groups: groups, **opts), pretty: opts[:pretty])
			end
			def show_top(**_opts)
				puts list_top
			end
			def show_all(**_opts)
				puts list_packages
			end
			def show_graph(**_opts)
				out=Object.new
				def out.<<(s)
					STDOUT << s.chomp+"\n"
				end
				graph.dump(out: out, **_opts)
			end

			private def common_options(**opts)
				o=[]
				o=yield if block_given?
				o.shelljoin
			end

			def bootstrap(**opts)
				if block_given?
					eval_shell(yield,**opts)
				else
					nil #not supported
				end
			end

			def install(*packages,needed: [], **opts)
				unless packages.empty? or @packager.nil? or !block_given?
					recursive=opts[:recursive] || :down
					mode=opts[:install_mode] || @install_type || :manual 
					# here it does not makes much sense to have a :deps dependency
					# since they will probably be automatically installed
					# Moreover since the packages we pass are probably not in the
					# graphs; we need to add them back
					packages_str=(packages+dependency_packages(packages.uniq, needed: needed, recursive: recursive, mode: mode)).uniq.shelljoin
					o=common_options(**opts)
					eval_shell(yield(packages_str, o),**opts) unless packages_str.empty?
				end
			end

			def dependency_packages(packages, needed:[], recursive: false, mode: @graph_type)
				pkg_graph=graph(graph_mode: mode) if recursive && mode
				case recursive
				when :up; packages=pkg_graph.ancestors(*packages)
				when :down; packages=pkg_graph.unneeded_descendants(*packages,needed: needed)
				when :itself.to_proc #test for true...
					packages=pkg_graph.ancestors(*packages)
					packages=pkg_graph.unneeded_descendants(*packages,needed: needed)
				end
				packages.map(&:to_s).uniq
			end

			def uninstall(*packages,needed:[],**opts)
				unless packages.empty? or @packager.nil? or !block_given?
					recursive=opts.fetch(:recursive, true)
					mode=opts.fetch(:uninstall_mode, @uninstall_type || @graph_type || :both)
					packages_str=dependency_packages(packages.uniq, needed: needed, recursive: recursive, mode: mode).shelljoin
					o=common_options(**opts)
					eval_shell(yield(packages_str, o),**opts) unless packages_str.empty?
				end
			end

			#if possible set mode to manual/explicit or automatic/dependency
			def change_mode(*packages, mode: :manual,**opts)
				unless packages.empty? or @packager.nil?
					case mode
					when :manual,:explicit
						mode=:manual
					when :auto,:automatic,:dependency,:dep
						mode=:automatic
					else
						warn 'Unknown mode, fallback to automatic'
						mode=:automatic
					end
					packages_str=packages.uniq.shelljoin
					o=common_options(**opts)
					eval_shell(yield(packages_str, mode, o),**opts) if block_given?
				end
			end

			def update(**opts)
				unless @packager.nil?
					o=common_options(**opts)
					eval_shell(yield(o),**opts) if block_given?
				end
			end
			def check_update(**opts)
				unless @packager.nil?
					o=common_options(**opts)
					eval_shell(yield(o),**opts) if block_given?
				end
			end
			#sometime updating inconditionnally is annoying (like if we need to
			#compile stuff); update_or_check automatically calls update or
			#check_update according to which is 'usually' better
			def update_or_check(**opts, &b)
				update(**opts)
			end

			def clean(**opts)
				unless @packager.nil?
					o=common_options(**opts)
					eval_shell(yield(o),**opts) if block_given?
				end
			end

			def clean_cache(**opts)
				unless @packager.nil?
					o=common_options(**opts)
					eval_shell(yield(o),**opts) if block_given?
				end
			end

			def search(*args, **opts)
				unless @packager.nil?
					o=common_options(**opts)
					eval_shell(yield(*args, o),**opts) if block_given?
				end
			end

			private def eval_shell(r,**opts)
				shell=@opts.merge(opts).fetch(:shell,"")
				SH.eval_shell(r, shell: shell)
			end
		end
	end
end

=begin Exemple d'handler
module DR
	module Packages
		class Handler::Dummy < Handler::Generic
			def initialize(*args) # not needed unless to modify @graph_type
				super
				@graph_type=:both # default; use :manual if we handle list_top natively
			end

			def get_packager
				SH.find_executable("dummy")
			end
			def setup_packager
				nil
			end

			def bootstrap(**opts)
				super do |**opts|
					"bootstrap command"
				end
			end

			def parse_packages(list)
				super do |pkg|
					# strip version numbers
					pkg.match(/^(.*)\s+\(.*\)$/) {|m| m[1].downcase}
				end
			end
			def list_packages(*args)
				super do
					parse_packages(output_list("#{@packager} list"))
				end
			end
			# if supported by @packager
			def list_top(*args)
				super do
					parse_packages(output_list("#{@packager} top"))
				end
			end
			# eventually if the way to have the packages already give the deps:
			# list_packages and package_dependency use this if it is defined
			# since all other functions use these functions they will all use
			# full_graph
			# def full_graph
			# 	Graph.new(full_deps)
			# end

			def package_dependencies(pkgs)
				{deps} # by default use package_dependency
			end
			# or define this (but this will be slower since this will be called
			# for each package)
			def package_dependency(pkg)
				return []
			end

			def manual_deps
				{} #default
			end

			private def common_options(**opts)
				["--foo", "-b"]
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} #{o} install #{pkgs}"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} #{o} uninstall #{pkgs}"
				end
			end

			def change_mode(*args)
				super do |pkgs, mode, o|
					"#{@packager} #{o} change_mode #{mode} #{pkgs}"
				end
			end

			def update(*args)
				super do |o|
					"#{@packager} #{o} update"
				end
			end
			def check_update(*args)
				super do |o|
					"#{@packager} #{o} check_update"
				end
			end
			def update_or_check(*args)
				# update is the default
				check_update(*args)
			end

			def clean(*args)
				super do |o|
					"#{@packager} #{o} clean"
				end
			end

			def search(*args)
				super do |*args, o|
					"#{@packager} #{o} search #{args.shelljoin}"
				end
			end
		end

	end
end
=end

if __FILE__ == $0
	#Ex: $0 -t ruby_gem infos
	DR::Packages::Handler.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean clean_cache change_mode
end
