#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::Appimage < Handler::Generic
			#extend self
			attr_reader :appimage_optdir

			def curlexe=(exe)
				@curl=Pathname.new(exe)
			end
			def curlexe
				@curl
			end

			def appimage_optdir=(path)
				@appimage_optdir=Pathname.new(path)
			end

			def get_packager
				__FILE__
			end

			def initialize(**opts)
				super
				self.curlexe=SH::Utils.find_executable(opts[:curl]||"curl")
				self.appimage_optdir= opts[:optdir] ? Pathname.new(opts[:optdir]) : Pathname.home+"opt/pkgmgr/appimages"
				@db=appimages
			end

			def appimages
				{
					bitwarden: "https://vault.bitwarden.com/download/?app=desktop&platform=linux"
				}
			end

			def list_repos(*repos)
				repos=@db.keys if repos.empty?
				@db.values_at(*repos)
			end
			def show_repos(*repos, **_opts)
				puts list_repos(*repos.map(&:to_sym))
			end

			def list_packages(**opts)
				super do
					begin
						@appimage_optdir&.each_child&.map {|x| x.basename.to_s}
					rescue Errno::ENOENT
						[]
					end
				end
			end

			def install(*args,**opts)
				super do |pkgs,o|
					"#{@packager} --install #{o} #{pkgs}"
				end
			end
			def uninstall(*args,**opts)
				super do |pkgs,o|
					"#{@packager} --uninstall #{o} #{pkgs}"
				end
			end
				

			# not possible
			# def update(*args)
			# end

			def do_uninstall(*packages,**_opts)
				packages_list=packages.map {|p| p.respond_to?(:to_a) ? p.to_a : p}.flatten.uniq
				packages_list.map do |f|
					file=@appimage_optdir+f
					file.rm
				end
			end

			def do_install(*packages,**_opts)
				packages_list=packages.map {|p| p.respond_to?(:to_a) ? p.to_a : p}.flatten.uniq
				@appimage_optdir.mkpath
				Dir.chdir(@appimage_optdir) do
					packages_list.map do |pkg|
						image=@db[pkg.to_sym]
						SH.sh!([@curl, '-O', '-L', image].shelljoin)
						@appimage_optdir&.each_child do |x|
							x.chmod(0755)
						end
					end
				end
			end

			def self.process_args(*actions, **opts)
				super do |optparse, opts|
					optparse.banner = "Install/Remove appimages files"
					optparse.on("--optdir=dir", "path to install to") do |v|
						opts[:optdir]=v
					end
					optparse.on("--install", "Do install") do |v|
						opts[:action]=lambda do |*args,**opts|
							self.new(**opts).do_install(*args)
						end
					end
					optparse.on("--uninstall", "Do uninstall") do |v|
						opts[:action]=lambda do |*args,**opts|
							self.new(**opts).do_uninstall(*args)
						end
					end
					optparse.on("--list", "Show all our custom appimages url") do |v|
						opts[:action]=lambda do |*args,**opts|
							self.new(**opts).show_repos(*args)
						end
					end
				end
			end

		end
	end
end

if __FILE__ == $0
	DR::Packages::Handler::Appimage.process_args(*ARGV)
end
