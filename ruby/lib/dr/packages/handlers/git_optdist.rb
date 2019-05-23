#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::GitOptdist < Handler::Generic
			#extend self
			attr_reader :git_optdir
			def gitexe=(exe)
				@git=Pathname.new(exe)
			end
			def gitexe
				@git
			end
			def git_optdir=(path)
				@git_optdir=Pathname.new(path)
			end

			def get_packager
				__FILE__
			end

			def github(repo)
				# note: the .git at end is facultory
				"https://github.com/"+repo
			end
			def inria(repo, scm: :git)
				case scm
				when :git
					"https://scm.gforge.inria.fr/anonscm/git/#{repo}/#{repo}"
				when :gitlab
          "https://gitlab.inria.fr/#{repo}.git"
				when :svn
					"https://scm.gforge.inria.fr/anonscm/svn/#{repo}"
				end
			end

			def initialize(**opts)
				super
				self.gitexe=SH::Utils.find_executable(opts[:git]||"git")
				self.git_optdir= opts[:optdir] ? Pathname.new(opts[:optdir]) : Pathname.home+"opt/dist"
				@db=git_repos
			end

			def git_repos
				{
					:'git-manpages' => github("gitster/git-manpages"),
					:'git-htmldoc' => github("gitster/git-htmldocs"),

					:pari => "http://pari.math.u-bordeaux.fr/git/pari.git",
					:'cado-nfs' => inria("cado-nfs"),

					:mpfr => inria("mpfr", scm: :svn),
					:mpc => inria("mpc"),
					:mpfrcx => inria("mpfrcx"),
					:cme => inria("cme"),
					:cmh => inria("cmh"),
					:ecm => inria("ecm", scm: :svn),
					# :'pari-gnump' => inria("pari-gnump"),
					:'paritwine' => inria("enge/paritwine", scm: :gitlab),

					:'arch-abs' => "git://projects.archlinux.org/svntogit/packages.git",
					:devtools => "git://projects.archlinux.org/devtools.git",
					:'arch-install-scripts' => "git://projects.archlinux.org/arch-install-scripts.git",
					:archiso => 'git://projects.archlinux.org/archiso.git',
					:mkinitcpio => 'git://projects.archlinux.org/mkinitcpio.git',
					:namcap => 'git://projects.archlinux.org/namcap.git',
					:netctl => 'git://projects.archlinux.org/netctl.git',
					:pacman => 'git://projects.archlinux.org/pacman.git',
					:srcpac => 'git://projects.archlinux.org/srcpac.git',
				}
			end

			def git_url(repo)
				repo=repo.to_s
				@db.fetch(repo.to_sym) do
					# not a key
					if repo.include?(':') #assume this is already an url
						repo
					elsif repo.include?('/')
						github(repo)
					else
						github("#{repo}/#{repo}")
						# this scheme works for git, rubygems, ruby, rubinius, systemd...
					end
						
				end
			end

			def get_url(*repos, **_opts)
				repos.each do |repo| puts git_url(repo) end
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
						@git_optdir&.each_child&.map {|x| x.basename.to_s}
					rescue Errno::ENOENT
						[]
					end
				end
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} --install #{o} #{pkgs}"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} --uninstall #{o} #{pkgs}"
				end
			end
				

			def update(*args)
				super do
					"gitfolders -l optdist update -a"
				end
			end

			def do_uninstall(*packages,**_opts)
				packages_list=packages.map {|p| p.respond_to?(:to_a) ? p.to_a : p}.flatten.uniq
				packages_list.map do |d|
					dir=@git_optdir+d
					dir.rmtree
				end
			end

			def do_install(*packages,**_opts)
				packages_list=packages.map {|p| p.respond_to?(:to_a) ? p.to_a : p}.flatten.uniq
				@git_optdir.mkpath
				Dir.chdir(@git_optdir) do
					packages_list.map do |pkg|
						repo=git_url(pkg)
						#repo=@git_install[pkg.to_sym] or (warn "repo: #{pkg} not found"; next)
						repodir=Pathname.new(repo).basename.to_s.tap{|d| d.slice!(/\.git$/)}
						puts "## #{repo}"
						if repo.match(/^svn:/) #svn clone
							SH.sh!([@git, 'svn', 'clone', '--prefix=svn/', '--stdlayout', repo])
							Dir.chdir(repodir) do
								SH.sh!("#{@git} branch -m master svn")
								SH.sh!("#{@git} gc --aggressive")
							end
						else
							SH.sh!([@git.to_s, 'clone', repo])
							Dir.chdir(repodir) do
								SH.sh!("#{@git} gc --aggressive")
								if pkg==:git
									SH.sh! "#{@git} remote add mailnotes 'git://github.com/trast/git.git'"
									#this is already in my user .gitconfig
									#git config remote.mailnotes.fetch 'refs/heads/notes/*:refs/notes/*'
								end
							end
						end
					end
				end
			end

			def self.process_args(*actions, **opts)
				super do |optparse, opts|
					optparse.banner = "Install/Remove git repositories"
					optparse.on("--optdir=dir", "path to install to") do |v|
						opts[:optdir]=v
					end
					optparse.on("--git=exe", "git executable") do |v|
						opts[:git]=v
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
					optparse.on("--repo", "list repo url") do |v|
						opts[:action]=lambda do |*args,**opts|
							instance=self.new(**opts)
							repos=args.map do |arg|
								instance.git_url(arg)
							end
							puts repos
						end
					end
				end
			end

		end
	end
end

if __FILE__ == $0
	DR::Packages::Handler::GitOptdist.process_args(*ARGV)
end
