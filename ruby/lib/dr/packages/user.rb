#!/usr/bin/env ruby
# vim: fdm=marker

$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0

require 'dr/packages/resolver'

module DR
	module Packages
		class User < Resolver
			def self.all_types
				[:ruby_gems, :python_pip3, :nodejs, :perl_cpan, :git_optdist, :yarn, :go, :rust_cargo, :ocaml_opam]
			end
		GEMS={ #{{{
			#gems that were previously bundled with ruby
			old_bundled: %w(did_you_mean rdoc irb), #test-unit
			core: %w(erubi awesome_print),
			commands: %w(rake gli cmdparse),
			doc: %w(yard),
			pry: %w(pry pry-doc pry-editline
				pry-byebug pry-rescue pry-self),
			pry_extra: %w(hirb),
			tests: %w(minitest minitest-reporters),
			ext: %w(activesupport),
			extra: %w(neovim bibtex-ruby rb-inotify libnotify), #gtk2
				#neovim is for neovim ruby bindings
				#bibtex-ruby is used by cv.rb (note that it requires latex-decode which is used by depot_texte.rb),
				#rb-inotify: inotify wrapper used by checkmail.rb 
				#libnotify uses ffi bindings for notify and is used by mpd_notify.rb
			gems: %w(bundler gem-man ore rubygems-tasks),
			git: %w(git_remote_branch),
			github: %w(gist ghi travis-lint),
			mail: %w(mail maildir mail_extract),
			media: %w(exifr ruby-mpd),
			pdf: %w(hexapdf), #prawn
			shell: %w(ru),
			time: %w(tzinfo chronic chronic_duration), #tzinfo is for activesupport
			http: %w(faraday faraday-cookie_jar mime-types), #used by depot_texte. #httparty?
			ssh: %w(sshkit airbrussh ed25519 bcrypt_pbkdf), #airbrussh is for prettier sshkit output, ed25519 and bcrypt_pbkdf to suppoert ed25519 keys
			uri: %w(addressable),
			template: %w(kramdown rouge asciidoctor),
			web: %w(nokogiri webgen sass scss_lint sassc),
			webserver: %w(thin),
			websites: %w(redd), #reddit wrapper, used by save_posts.rb
			yaml: %w(yaml_command),
		} 

		#gems that I don't use but I may one time and I want to easily have
		#access to them. Will be in extra_ok
		GEMS_EXTRA={
			concurrent: %w(concurrent-ruby hamster),
			db: %w(sequel sqlite3),
			docs: %w(rdoc yardstick), #yardstick verify doc coverage
			commands: %w(thor methadone slop boson boson-more),
			extra: %w(gir_ffi), #  gir_ffi was for future volume_daemon.rb to use the libnotify bindings (cf examples/libnotify.rb), in practice might as well use 'libnotify' wrapper
			# gtk: %w(gtk2 gtk3), #gtk2 is used by checmail.rb (incomplete), should switch to gtk3 anyway
			tests: %w(maxitest rspec simplecov mocha aruba rubocop codeclimate-test-reporter),
			#aruba: cucumber extension for testing command lines app
			#codeclimate-test-reporter (depends on simplecov) => upload simplecov results to code climate
			deploy: %w(capistrano mina),
			extensions: %w(facets spruz casting),
			github: %w(octokit),
			mail: %w(nntp-client), #nntp-client was to post to forum but I wrote my own class in nntp_post; 'mime-types' was used by 'mail' but they switched to 'mini_mime'
			misc: %w(bitcoin vimdb),
			text: %w(highline paint term-ansicolor unicode), #paint,term-ansicolors are for colors
			notebook: %w(iruby cztop), #cztop is a czmq ruby wrapper, more recent than ffi_rzmq and rbczmq; needed by iruby
			notebook_extra: %w(gnuplot rubyvis nyaplot),
			rails: %w(rails pry-rails),
			webserver: %w(sinatra),
			# devops: %w(chef chef-dk berkshelf chef-provisioning-ssh test-kitchen knife-solo knife-zero), #+ itamae?
			devops: %w(itamae hocho),
			web: %w(oga cani rubydns), #oga: nokogiri in ruby; cani: caniuse database
			webgen_extra: %w(webgen-templates-bundle webgen-zurb_foundation-bundle webgen-font_awesome-bundle), #webgen templates
			#For webgen website: builder coderay maruku rdiscount haml RedCloth
			css: %w(compass),
			template: %w(erubis tilt),
			git: %w(git), #libgit2?
			docx: %w(caracal docx),
}
		#}}}

		PIP2=%w() #hungarian
		PIP3={
			python: %w(flake8 pytest), #flake8: linter
			medias: %w(gallery-get praw hachoir urwid), #praw: for ~usr/dist/export-saved-reddit, urwid is for hachoir-urwid
			html: %w(html5validator urlscan)}

		PIP3_EXTRA={ automation: %w(homeassistant home-assistantcli home-assistant-frontend samsungctl), 
			extra: %w(howdoi), # percol (replaced by fzf), howdoi -> hors in rust
		}
			# samsungctl: https://github.com/Ape/samsungctl
	  	# stapler (not maintened anymore)
			# Remote control Samsung televisions via a TCP/IP connection

		NPM={ password: %(@bitwarden/cli)}

		# cf scripts/tools.d for more details
		NPM_LINT={
			devextra: %w(browserslist), #this is a dependency of a lot of the packages below
			es6: %w(@babel/cli @babel/core @babel/preset-env @babel/plugin-syntax-dynamic-import core-js babel-minify),
			#@babel/polyfill: Provides polyfills necessary for a full ES2015+ environment. Replaced by core-js and regenerator runtime
			#@babel/plugin-syntax-dynamic-import: allow parsing of import
			#babel-minify: cli for its dependency 'babel-preset-minify'
			#  babel-preset-minify: for .babelrc: presets: ['minify']
			## babel-loader: for webpack
			lint: %w(eslint eslint-config-airbnb-base eslint-plugin-import
				stylelint stylelint-config-standard stylelint-config-recommended stylelint-scss stylelint-order stylelint-no-unsupported-browser-features),
				## htmllint-cli html5-lint
				#eslint-plugin-import: to lint es2015+ import syntax
				#stylelint-scss: to parse .scss
				#stylelint-order stylelint-no-unsupported-browser-features: stylelint plugins; stylelint-no-unsupportedd-browser-features depends on doiuse
				#  doiuse: lint commandline/postcss plugin against caniuse
			css: %w(postcss-cli autoprefixer cssnano colorguard postcss-normalize postcss-preset-env),
				#cssnano: css minifier
			html: %w(html-minifier),
		}
		NPM_EXTRA=NPM_LINT.merge({
		  doc: %w(tldr), # tealdeer from rust, tldr from arch
			dev: %w(webpack),
			text: %w(emoj emoji-finder),
		})

    CPAN=%w()
		CPAN_EXTRA={core: %w(App::cpanminus),
					media: %w(MusicBrainz::DiscID WebService::MusicBrainz) #for abcde
				}

    GIT=%w()
		GIT_EXTRA={git: %w(git),
				:'git-doc' => %w(git-manpages git-htmldocs),
				:systemd => %w(systemd),
				:formal => %w(pari cmh cado-nfs cme mpc ecm mpfr pari-gnump),}

		GO={text: %w(github.com/bellecp/fast-p github.com/edi9999/path-extractor/path-extractor https://github.com/arp242/uni)}
		#git: %w(github.com/apenwarr/git-subtrac)

		# Packages to install via cargo
		# These are all available natively on arch
		CARGO={ cli: %w(hyperfine exa lsd), }
		#, cargo: %w(cargo-update)} # cargo-update is added automatically if the pkg list is non empty
		CARGO_EXTRA={ ruby: %w(rbspy), }

		# For my pkgbuilds, so I have them in my personal db
		CARGO_TOOLS={
			cargo: %w(cargo-cache cargo-tree cargo-update),
			core: %w(bingrep cw runiq),
			doc: %w(tealdeer),
			files: %w(amber broot lolcate-rs rm-improved tree-rs xcompress xcp),
			disk: %w(diskus tin-summer dupe-krill dua-cli dirstat-rs du-dust dutree spruce),
			utils: %w(genact ttdl hors), #howto-cli (does not compile)
			monitoring: %w(battop hyperfine mprober procs strace-analyzer process_viewer bandwhich),
			text: %w(fastmod gig ruplacer sd tabwriter-bin xv ripgrep_all diffr mdcat), #typeracer
			data: %w(jql xsv fst-bin),
			fs: %w(hunter),
			git: %w(git-find git-global),
			ssh: %w(slink),
			shell: %w(starship),
			system: %(topgrade b3sum),
		}

		CARGO_TOOLS_BIN={
			cargo: CARGO_TOOLS[:cargo].map do |pkg|
				case pkg
				when "cargo-update"
					["cargo-install-update", "cargo-install-update-config"]
				else
					pkg[/(.*)-bin/,1] || pkg
				end
			end,
			cli: CARGO_TOOLS.reject {|k,_v| k==:cargo}.values.flatten.map do |pkg|
				case pkg
				when "hunter"
					[pkg, "preview-gen"]
				when "amber"
					%w(ambr ambs)
				when "ripgrep_all"
					%w(rga rga-preproc)
				when "dirstat-rs"
					"ds"
				when "dua-cli"
					"dua"
				when "du-dust"
					"dust"
				when "rm-improved"
					"rip"
				when "tealdeer"
					"tldr"
				when "lolcate-rs"
					"lolcate"
				when "tin-summer"
					"sn"
				else
					pkg[/(.*)-bin/,1] || pkg
				end
			end.flatten.compact.sort
		}

		#packages that are awailable on arch (or my aur repo)
		ARCHLINUX={
			yarn: %w(babel-cli eslint tldr @bitwarden/cli), #aur: bitwarden-cli-bin
			go: GO.values.flatten,
			python_pip3: %w(flake8 urlscan praw urwid pytest), #python-{urwid,praw,pytest}
			rust_cargo: %w(rbspy hyperfine exa lsd),
			ruby_gems: %w(ghi gist),
		}

			def packages_setup
			  @packages={}
				lists={ ruby_gems: :GEMS, python_pip2: :PIP2, python_pip3: :PIP3, yarn: :NPM, perl_cpan: :CPAN, git_optdist: :GIT, go: :GO, rust_cargo: :CARGO}
				lists.each do |ptype, const|
				  @packages[ptype]={pkgs: self.class.const_get(const)}
				  if self.class.const_defined?(:"#{const}_EXTRA")
					  @packages[ptype][:extra_ok]=self.class.const_get(:"#{const}_EXTRA")
					end
				end

				minimal=[:core, :commands, :doc, :pry, :tests]
				light=minimal+[:ext, :time, :web]
				standard=:all
				full=standard
				ruby_modes={init: minimal, minimal: minimal, light: light, standard: standard, full: full}
				@packages_mode={}
				ruby_modes.each { |k,v| @packages_mode[k]={ruby_gems: v} }
				@packages_mode[:standard].merge!({:git_optdist =>%i(git)})
				@packages_mode[:full].merge!({@packages.keys-[:ruby_gems] =>:all})
				## This is now handled by resolver.rb#filter_types
				# @packages_mode.each do |k,v|
				# 	@packages.keys.each do |pkger|
				# 		#be sure that we tell packages.rb that we do not want packages
				# 		#when we have not specified any, so that it can still check
				# 		#extra installations
				# 		@packages_mode[k][pkger]=[] unless v.keys.flatten.include?(pkger)
				# 	end
				# end
				super
				#we may not have pip installed so we need to bootstrap it
				(@packages[:python_pip2][:extra_ok] ||=[]) << "pip"
				(@packages[:python_pip3][:extra_ok] ||=[]) << "pip"
			end

			#we look into :packages,:type,@computer.name
			#but only :packages can be a hash of packages/packages_mode
			def get_mode(*args)
				@computer.dig(:user, :packages) || super(@computer.dig(:user,:type)) || super #@computer.name
			end

			def populate_pkgs_from_mode
				super
				case @computer.name
				when "phare"
					add_packages(:ruby_gems, :custom, ["activesupport","chronic","chronic_duration"]+GEMS[:web])
				when "imb"
					add_packages(:python_pip3, :medias, ["streamlink", "mcomix"])
					# add_packages(:nodejs, :devel, ["coffee-script"])
					#add_packages(:cpanm, :gitsvn, ["SVN::Core"]) #for git svn
					#Installed by the ubuntu 'git-svn' package
				end
				# add_packages(:nodejs, :custom, ["nyaovim"]) if @computer[:list].include?(:Perso)
			end

			def filter_pkgs
				if @computer.attribute?(:syst_types, :archclient)
					@pkgs.each do |ptype, values|
						to_rm=ARCHLINUX[ptype]
						values.each do |group, pkgs|
							values[group]=pkgs.to_a-to_rm.to_a
						end
					end
				end
				if !@pkgs[:rust_cargo].nil? && !@pkgs[:rust_cargo].empty? && !(@pkgs[:rust_cargo].is_a?(Hash) && @pkgs[:rust_cargo].values.flatten.empty?)
					add_packages(:rust_cargo, :cargo, ["cargo-update"])
				end
			end
		end
	end
end

if __FILE__ == $0
	#dispatch to #process in resolver; eg ./$0 rm
	DR::Packages::User.process_args(*ARGV)
end
