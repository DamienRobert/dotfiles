#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::RustCargo < Handler::Generic
			def get_packager
				find_executable("cargo")
			end
			def setup_packager
				@cargo_dir=@userpkgdir+"cargo"
			end

			def list_packages(mode: :native, **opts)
				super do
					pkgs=[]
					SH.run_simple("#{@packager} install --list", chomp: :lines).each do |l|
						l.match(/^(\S+)/) do |m|
							pkgs << m[1]
						end
					end
					pkgs
				end
			end

			def bootstrap(*args, **kw)
				"curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y"
			end

			def install(*args, **kw)
				super do |pkgs,o|
					"#{@packager} install #{o} #{pkgs}"
				end
			end

			def uninstall(*args, **kw)
				super do |pkgs, o|
					"#{@packager} uninstall #{o} #{pkgs}"
				end
			end

			def clean_cache(*args)
				super do
					"rm -rf #{(@cargo_dir+"registry").shellescape}"
					# run `cargo install non_existing_package` to recrate a minimal
					# registry for `cargo install-update`
				end
			end

			def update(*args, **kw)
				super do |pkgs,o|
					if (rustup=find_executable("rustup"))
						"#{rustup} update"
					end
					if find_executable("cargo-install-update")
						"#{@packager} install-update #{o} -a"
					end
				end
			end

			def check_update(*args)
				super do |o|
					if (rustup=find_executable("rustup"))
						"#{rustup} check"
					end
					if find_executable("cargo-install-update")
						"#{@packager} install-update #{o} -la"
					end
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::Go.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
