#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::OcamlOpam < Handler::Generic
			def get_packager
				find_executable("opam")
			end
			def bootstrap(**opts)
				super do |**opts|
					"sh <(curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh) && opam init"
				end
			end

			# explicit: true, restrict to explicitely installed packages
			def opam_list(explicit: true)
        command="#{@packager} list --columns=name"
        command+=" --roots" if explicit
				r=SH.run_simple(command, chomp: :line)
				r[2..]
			end

			def full_graph
				@full_graph||=Graph.new(*opam_list)
			end
			def manual_deps
				{"unison" => "lablgtk"} #this is an opt dependency, but is needed for the gtk version
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} install #{o} #{pkgs}"
				end
			end

			def uninstall(*args)
				super do |pkgs, o|
					"#{@packager} remove #{o} #{pkgs}"
				end
			end

			def clean_cache(**_opts)
				super do |o|
					"#{@packager} #{o} clean"
				end
			end

			def update(*args, **kw)
				super do |o, **opts|
					"#{@packager} update && #{@packager} upgrade"
				end
			end

			def check_update
				super do |o, **opts|
					"#{@packager} update && #{@packager} upgrade --check"
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
	DR::Packages::Handler::OcamlOpam.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
