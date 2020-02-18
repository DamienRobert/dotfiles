#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::Yarn < Handler::Generic
			def initialize(*args, **kw)
				super
				@graph_type=:manual
			end

			def get_packager
				find_executable("yarn")
			end
			def setup_packager
				@yarn_global=@userpkgdir+"yarn/global"
			end

			def list_packages(*args)
				require 'yaml'
				super do
					yarnfile=@yarn_global+"package.json"
					if yarnfile.readable?
						YAML.load_file(@yarn_global+"package.json")["dependencies"].keys
					else
						{}
					end
				end
			end

			def bootstrap(*args)
				"npm install -g yarn"
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} global add #{o} #{pkgs};"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} global remove #{o} #{pkgs};"
				end
			end

			def update(*args, **kw)
				# See https://github.com/yarnpkg/yarn/issues/5001
				# yarn global add some-package would add a carret-range, something like ^1.0.0 so if a 2.0.0 comes out, yarn global upgrade would not upgrade to that because it doesn't fit the range. You would specify the --latest/-L flag to ignore the semver range and get the latest as tagged in the registry.
				super do |o|
					"#{@packager} global upgrade -L;"
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::Yarn.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
