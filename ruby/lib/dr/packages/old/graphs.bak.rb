#!/usr/bin/env ruby
require 'dr/base/graph'
require 'dr/sh'

module DR

	module Packages
		autoload :GitOptDist, 'dr/packages/git_optdist'
		class PkgGraph
			module Helpers
				include SH::Utils
				def init_type(ptype:nil)
					@ptype=ptype.to_sym
					homepath=Pathname.home
					@userpkgdir=homepath+"opt/pkgmgr"
					case @ptype
					when :nodejs
						@node_modules=@userpkgdir+"npm/lib/node_modules"
					when :perl_cpan
						@cpan_dir=homepath+"opt/pkgmgr/perl5/lib/perl5"
					when :arch_abs, :arch_aur
						@pacman=find_executable("pacman")
					end
					@packager=get_packager
				end

				def get_packager
					homepath=Pathname.home
					packager=case @ptype
						when :arch_abs
							find_executable("powerpill") or find_executable("pacman")
						when :arch_aur
							find_executable("pacaur")
						when :ruby_gem
							find_executable("gem")
						when :python_pip2
							find_executable("pip2")
						when :python_pip3
							find_executable("pip3")
						when :nodejs
							find_executable("npm")
						when :perl_cpan
							find_executable("cpanm")
						when :git_optdist
							homepath+"mine/ruby/lib/config/package_gitoptdist.rb"
						end
					warn "No packager found for #{@ptype}" if packager.nil?
					return packager
				end

				#TODO: call for several packages at once otherwise pip show take a
				#lot of time
				#return the dependencies of one package
				def package_dependency(pkg)
					return [] unless @packager
					case @ptype
					when :python_pip2, :python_pip3
						%x/#{@packager} show #{pkg}/.match(/^Requires: (.*)/) do |m|
							return m[1].split(', ').map(&:downcase)
						end
					when :ruby_gem
						return GemGraph.get_deps(GemGraph.spec_from_gemname(pkg)).map {|s| s.name}
					when :arch_abs, :arch_aur
						%x/#{@pacman} -Qi #{pkg}/.match(/^Depends On\s*: (.*)/) do |m|
							#strip version information
							return m=="None" ? [] : m[1].split.map {|name| name.sub(/[<>=]+.*$/,'') }
						end
					when :nodejs
						require 'yaml'
						return (YAML.load(%x/#{@packager} view -g #{File.basename(pkg)} dependencies/) || {}).keys.flat_map do |dep|
							dep
							#parse_packages(output_list("#{@packager} list -g --parseable #{dep}"))
						end
						#to see the dependencies of coffee/childprocess
						#we need to call 'npm view -g childprocess dependencies"
						#we get 'utility'; but the package name is 'coffee/utility'
						#to see that we need to call 'npm list --parseable -g utility'...
					end
					return []
				end

				#from a list l return a graph of packages with their dependencies in l
				#mode: :auto => only use package_dependency
				#mode: :manual => only use manual_deps
				#mode: :both => :auto+:manual
				def graph_dependencies(l, mode: :both)
					manual_deps=Hash.new([])
					case @ptype
					when :python_pip2, :python_pip3
						#these are installed when bootstrapping pip but do not appear
						#in the Require: field. I think they may be safely removed
						#after installation of pip?
						manual_deps.merge!({'pip' => %w(wheel setuptools)})
					when :perl_cpan
						#these deps are no longer needed (Module::Build is included in perl5.10, and cpanm now use an http api)
						#manual_deps.merge!({'App::cpanminus' => %w(CPAN::Meta Module::Build), 'WebService::MusicBrainz' => [ "Class::Accessor", "XML::LibXML", "XML::NamespaceSupport", "XML::SAX" ], })
					end
					r={}
					l.each do |pkg|
						children=[]
						children |= package_dependency(pkg) if mode != :manual
						children |= manual_deps[pkg] if mode != :auto
						children=children.sort.uniq.select {|child| l.include?(child)}
						r[pkg]=children
					end
					return Graph.new(r)
				end

				#helper for list_packages
				def parse_packages(list)
					list.map do |pkg|
						case @ptype
						when :perl_cpan
							pkg.gsub(/^#{@cpan_dir}\//,'').gsub(/^.*-thread-multi\//,'').gsub(/\.pm$/,'').gsub('/','::')
						when :nodejs
							pkg.match(/#{@node_modules}\/(.*)$/) { |m| m[1].gsub('node_modules/','') }
						when :python_pip2, :python_pip3
							pkg.match(/^(.*)\s+\(.*\)$/) {|m| m[1].downcase}
						end
					end.compact.uniq
				end
				#list installed packages
				def list_packages(**opts)
					return [] unless @packager
					case @ptype
					when :arch_abs
						return output_list("#{@pacman} -Qqn")
					when :arch_aur
						return output_list("#{@pacman} -Qqm")
					when :ruby_gem
						return Set.new(GemGraph.local_gems.map(&:to_s))
					when :python_pip2, :python_pip3
						return parse_packages(output_list("#{@packager} list --format=legacy --user"))
					when :nodejs
						# return parse_packages(output_list("#{@packager} list -g --parseable"))
						return list_top(**opts)
					when :perl_cpan
						return parse_packages(Dir.glob(@cpan_dir+"**/*.pm"))
					when :git_optdist
						return GitOptDist.list_packages(**opts)
					end
					return []
				end
				def list_top(**opts)
					return nil unless @packager
					top=case @ptype
					when :arch_abs
						output_list("#{@pacman} -Qqttn")
					when :arch_aur
						output_list("#{@pacman} -Qqttm")
					when :ruby_gem
						GemGraph.top_gems
					when :python_pip2, :python_pip3, :git_optdist
						list_packages
					when :perl_cpan
						parse_packages(Dir.glob(@cpan_dir+"*/*.pm")+Dir.glob(@cpan_dir+"*-thread-multi/*/*.pm"))
					when :nodejs
						parse_packages(output_list("#{@packager} list -g --parseable --depth=0"))
						#npm list -g --parseable bugs out with '--depth 0' on older npm versions so I needed to call manually:
						#parse_packages(Dir.glob(@node_modules+"*"))
					else
						[]
					end
					#remove extra 'top' dependencies
					#even for packages already handled by graphs, this allow to add
					#manual dependencies
					mode=:manual
					mode=:both if [:python_pip2, :python_pip3].include?(@ptype)
					graph_dependencies(top, mode:mode).roots.map(&:to_s)
				end
				def list_unused(**opts)
					case @ptype
					when :arch_abs
						@pacman and return output_list("#{@pacman} -Qqdttn")
					when :arch_aur
						@pacman and return output_list("#{@pacman} -Qqdttm")
					end
					return nil #nil means we don't support 'unused'
				end
				#list the packages contained in groups
				def list_groups(groups,**opts)
					gpkgs={}
					return gpkgs if groups.nil?
					case @ptype
					when :arch_abs
						groups.each do |i|
							@pacman and gpkgs[i]=output_list("#{@pacman} -Sqg #{i.to_s}")
						end
					end
					return gpkgs
				end

				def graph
					@graph||=
					case @ptype
					when :ruby_gem
						GemGraph.graph
					else
						graph_dependencies(list_packages)
					end
				end
				def infos(groups: nil,**opts)
					#used by handler.rb
					{all: list_packages, top: list_top, unused: list_unused, groups: list_groups(groups)}
				end
			end

			include Helpers
			
			def initialize(ptype)
				init_type(ptype: ptype)
			end
		end

		module GemGraph
			extend self
			#gems bundled with ruby
			def bundled_gems
				dir=Pathname.new(Gem.default_path.last)+"specifications"
				return (dir.children + (dir+"default").children).map do |file|
					next if file.directory?
					m=file.basename.to_s.match(/^(.*)-(.*)\.gemspec/)
					next m[1] if m
				end.compact.uniq.sort
			end

			#Ex: spec_from_gemname("pry 0.10.4", version: true)
			def spec_from_gemname(name, version: false)
				Gem::Specification.find {|s| gem_name(s, version: version)==name}
			end

			#From: http://stackoverflow.com/questions/5177634/list-of-installed-gems
			#list of gems name
			def local_gems
				#Gem::Specification.group_by {|g| g.name.downcase} is a hash of name => specifications because Gem::Specification.to_a is a list of gem specification
				Gem::Specification.group_by {|g| g.name.downcase}.keys
			end
			#hash of {gem names => [Gem specification for version]}
			def local_gems_spec
				Gem::Specification.sort_by{ |g| [g.name.downcase, g.version] }.group_by{ |g| g.name }
			end
			#Array of gem specifications for latest version
			def latest_gems_spec
				local_gems_spec.map {|k,v| v.last}
			end
			#Array of all gem specifications
			def all_gems_spec
				local_gems_spec.values.flatten
			end

			#Used by PkgGraph#package_dependency
			#spec.dependencies[0] is a Gem::Dependency.new on which we can call to_spec
			def get_deps(spec, dev: false)
				return (spec.dependencies.map do |gem|
					next if gem.type == :development and !dev
					begin
						gem.to_spec #return the activated gem dep
					rescue Gem::LoadError => e
						puts "Missing Gem #{e.name} (#{e.requirement})"
					end
				end).compact
			end

			def dependency_node(spec, version: false, dev: false, attributes: {}, gem_graph: nil)
				gem_graph=Graph.new unless gem_graph
				n = gem_graph.new_node(gem_name(spec, version: version), **attributes)
				spec.dependencies.each do |dependency|
					next if dependency.type == :development and !dev
					begin
						if version
							ispecs=dependency.to_specs #return all possible gem deps
						else
							ispecs=[dependency.to_spec] #return the activated gem dep
						end
						ispecs.each do |ispec|
							n.add_child(dependency_node(ispec, version: version, dev: dev, gem_graph: gem_graph, attributes: {type: dependency.type}))
						end
					rescue Gem::LoadError
					# The Gem is not available locally. This sucks.
						dependency = gem_graph.add_node(dependency.name, attributes: {missing: true, type: dependency.type})
						n.add_child(dependency)
					end
				end
				return n
			end
			def dependency_graph(spec_list, version: false, dev: false)
				gem_graph=Graph.new
				spec_list.each do |spec|
					dependency_node(spec, version: version, dev: dev, gem_graph: gem_graph)
				end
				gem_graph
			end
			def graph
				dependency_graph(latest_gems_spec)
			end
			def top_gems(bundled: false)
				roots=graph.roots.map(&:to_s)
				if bundled
					return roots
				else
					return roots - bundled_gems
				end
			end

			def gem_name(spec, version: false)
				if version then
					return "#{spec.name} #{spec.version}"
				else
					return spec.name
				end
			end
		end
	end
end

if __FILE__ == $0
	#=> call #graph
	#to see #infos use handler.rb#show_infos
	require "optparse"
	require 'pp'
	opts={types: ["gem"], show_attr: false}
	optparse = OptionParser.new do |opt|
		opt.banner = "Show local packages installed as a graph"
		opt.on("--[no-]top", "Show top packages") { |v| opts[:top]=v }
		opt.on("--mode=MODE", [:graph, :list, :dot], "Print mode (graph/list/dot)") { |v| opts[:mode]=v }
		opt.on("--[no-]version", "[GEM] Add version information") { |v| opts[:version]=v }
		opt.on("--[no-]dev", "[GEM] Add development gems") { |v| opts[:dev]=v }
		opt.on("--[no-]attr", "[GEM] Show gem types") { |v| opts[:show_attr]=v }
		opt.on("--[no-]all", "[GEM] Show all gems version") do |v|
			opts[:all]=v
			opts[:version]=v
		end
		opt.on("-t", "--types=package_types", Array, "packages types") do |v|
			opts[:types]=v
		end
		#Visualize the graph:
		# zathura =(./gems.helper.rb --mode=dot | dot -Tpdf)
	end
	optparse.parse!
	opts[:types].each do |type|
		if opts[:top]
			puts DR::Packages::PkgGraph.new(type).list_top
		else
			#the type is 'ruby_gem', but with 'gem' we provide more options
			if type=="gem"
				list=opts[:all] ? DR::Packages::GemGraph.all_gems_spec : DR::Packages::GemGraph.latest_gems_spec
				graph=DR::Packages::GemGraph.dependency_graph(list, version: opts[:version], dev: opts[:dev])
			else
				graph=DR::Packages::PkgGraph.new(type).graph
			end
			puts graph.dump(**opts)
		end
	end
end
