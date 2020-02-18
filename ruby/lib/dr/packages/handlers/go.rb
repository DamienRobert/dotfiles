#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::Go < Handler::Generic
			def get_packager
				find_executable("go")
			end
			def setup_packager
				@go_dir=@userpkgdir+"go"
			end

			# installed: true, restrict the deps to installed packages
			def go_deps(installed: true)
				# @full_graph and return @full_graph
				r=SH.run_simple("#{@packager} list --json all")
				# this is not valid json, sigh, it is a list of {...}{...}{...}
				r="[#{r.gsub(/^}$/,'},')}{}]"
				require 'json'
				json=JSON.parse(r)
				full_graph={}; graph={}
				gosrc=(@go_dir+"src/").to_s
				json[0...-1].each do |pkg|
					next unless (dir=pkg["Dir"]).start_with?(gosrc) #system package
					if (target=pkg["Target"])
						next unless Pathname.new(target).exist? if installed #non installed package
					end
					name=dir.slice(gosrc.length...dir.length)
					deps=pkg["Deps"]
					full_graph[name]=deps||[] #here the deps could refer to system packages or non installed packages
				end
				full_graph.each do |name, deps|
					graph[name]=deps & full_graph.keys
				end
				graph
			end

			def full_graph
				@full_graph||=Graph.new(go_deps, **{})
			end

			def install(*args)
				super do |pkgs,o|
					# we get the sub pkgs too, because when updating, `go get -u all`
					# will install them anyway
					## "#{@packager} get -v #{o} #{pkgs.shellsplit.map {|pkg| "#{pkg}/..."}.shelljoin}"
					# Update: we now call `update` with our list of installed packages rather than all of them, so no need to install the subpackages
					"#{@packager} get -v #{o} #{pkgs}"
				end
			end

			def uninstall(*args)
				super do |pkgs, o|
					# https://stackoverflow.com/questions/13792254/removing-packages-installed-with-go-get
					"#{@packager} clean -i #{o} #{pkgs.shellsplit.map {|pkg| "#{pkg}/..."}.shelljoin} && rm -rf #{pkgs.shellsplit.map {|pkg| @go_dir+'src'+pkg}.shelljoin}"
				end
			end

			def clean(**_opts)
				all_deps=Graph.new(go_deps(installed: false))
				needed = all_deps.descendants(*list_packages)
				unneeded=all_deps.names-needed.map(&:name)
				uninstall(*unneeded, recursive: false)
			end

			def update(*args, **kw)
				super do |o, **opts|
					l=list_packages
					"#{@packager} get -v -u #{o} #{l.shelljoin}" unless l.empty?
				end
			end
			# def update_or_check(*args)
			# 	# update is the default
			# 	check_update(*args)
			# end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::Go.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
