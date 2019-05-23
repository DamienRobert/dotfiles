#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::Nodejs < Handler::Generic
			def initialize(*args)
				super
				@graph_type=:manual
			end

			def get_packager
				find_executable("npm")
			end
			def setup_packager
				@node_modules=@userpkgdir+"npm/lib/node_modules"
			end

			# This is buggy, npm list -g shows:
			#  │ ├─┬ postcss-selector-parser@2.2.3
			#  │ │ ├── flatten@1.0.2
			#  but 'flatten' does not appear in `npm view -g postcss-selector-parser dependencies`
			def package_dependency(pkg)
				require 'yaml'
				return (YAML.load(%x/#{@packager} view -g #{File.basename(pkg)} dependencies/) || {}).keys
			end

			def parse_packages(list)
				super do |pkg|
					next if pkg == @node_modules.to_s
					# pkg.match(/#{@node_modules}\/(.*)$/) { |m| m[1].gsub('node_modules/','').sub('@.*$','') }
					Pathname.new(pkg).basename.to_s
				end
			end

			def list_depth(depth=0)
				d = depth ? "--depth=#{depth}" : ""
				parse_packages(output_list("#{@packager} list -g --parseable #{d}"))
			end
			def list_all_packages(*args)
				list_depth(nil)
			end
			def list_packages(*args)
				super do
					list_depth(nil)
				end
			end
			def list_top(*args)
				super do
					list_depth
				end
			end

			def bootstrap(*args)
					"N_PREFIX=#{@userpkgdir+"nodejs"} curl -L https://git.io/n-install | bash"
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} install #{o} -g #{pkgs};"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} uninstall #{o} -g #{pkgs};"
				end
			end

			#npm complains when the NPMHOME/lib folder does not exist during updates
			def check_folder
				unless @packager.nil?
					%x/#{@packager} config list/.match(/^prefix\s*=\s*"(.*)"/) do |m|
						prefix=Pathname.new(m[1])
						return (prefix+"lib").directory?
					end
				end
				true
			end

			def update(*args)
				super do |o|
					if check_folder
						pkgs=output_list("#{@packager} outdated -g --parseable --depth=0")
						"#{@packager} update #{o} -g;" unless pkgs.empty?
					end
				end
			end
			def check_update(*args)
				super do |o|
					check_folder && "#{@packager} outdated #{o} -g"
				end
			end

			def search(*args)
				super do |*args, o|
					"#{@packager} search #{o} #{args.shelljoin}"
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::Nodejs.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
