require 'dr/config/computers'

module DR
	module Sync
		def initialize(from,to,**opts)
			@opts=opts
			@comp=DR::Computer.new(from)
			@target=DR::Computer.new(target)
			expand_opt=@opts[:expand]
			if expand_opt.is_a?(Symbol)
				@expand=types_from_type(expand_opt)
			else
				#order: [:unison][:types],[:unison][:type],.name
				@expand=get_expand_types(DR::Computer.new(@opts[:expand]||@comp))
			end
			return self
		end

		def types_from_type(type)
			return nil if type.nil? #maybe monad
			warning "Unknown type: #{type}"
			{}
		end

		def get_expand_types(comp)
			if comp[:unison][:types]
				expand=comp[:unison][:types]
			elsif type=comp[:unison][:type]
				expand=types_from_type(type)
			else
				expand=types_from_type(comp.name)
			end
			expand[:all] ||= expand.values.flatten.uniq
			expand[:default] ||= [* expand[:full]].first
			expand[:init]||=expand[:default] if expand[:default]
			return expand
		end

		def files_to_sync(type)
			mine=@comp.dig[:usr,:rel_myfiles]
			config=@comp.dig[:usr,:rel_cfgfiles]
			dotfiles=@comp.dig[:usr,:rel_dotfiles]
			r=case type
			when :backup
				%w(var/backups/archives)
			when :book
				%w(data/Books)
			when :booklight,:book_light
				%w(data/Books/mathinfo/Maths data/Books/mathinfo/Info data/Books/Roman)
			when :common
				["#{mine}"]+%w(pro perso latex dist)
			when :data
				%w(data/Documents data/Papiers data/Scans data/WorkData data/usr Mail/mail-archives)
			when :deploy
				%w(deploy)
			when :large
				%w(data/Fonts data/Etudes)
			when :minimal
				%w(mine)
			when :perso
				%w(data/Photos data/Videos/clip)
			when :perso2
				%w(data/Music data/.XXX)
			when :photoslight,:photos_light
				%w(data/Photos/Photos_de_Blandine data/Photos/Photos_de_Damien)
			when :sh
				%w(00COMPUTERS.rb ruby/lib/computers.rb).map {|f| mine+f}+
					%w(mine/config/.gitignore).map {|f| config+f}+
					%w(.bash_profile .bashrc .config/git .config/locale.conf .dir_colors .initenv .initvars .inputrc .profile .ssh/authorized_keys.default .tmux.conf .vim .zprofile .zsh .zshrc).map {|f| dotfiles+f}
			when :usbbackup,:usb_backup
				["#{mine}"]+%w(perso latex dist)
			end
			r.map{|f| Pathname.new(f)}
		end

		def ignored_files(type)
			default=[]
			default << %r{.*(\.|/)nobackup$}
			#default << ".nfs*"
			default << "*.cache" #gitk
			#Compiled code
			default << "*.o"
			default << "*.pyc"
			default << %r{.*/magma/.*\.sig$}
			common=[]
			common << "wallpaper/wallpaper.local.png"
			common << "config/dotfiles/.vim/.netrwhist"
			#gpg
			common << "user/config/dotfiles/.gnupg/gpg.conf"
			common << "user/config/dotfiles/.gnupg/gpg-agent.conf"
			common << "user/config/dotfiles/.gnupg/random_seed"
			#sockets
			common << "config/dotfiles/.fvwm/.FvwmConsole-Socket"
			common << "config/dotfiles/.uim.d/socket"
			#objects
			common << "script/magma-launch/fake_mac.o"
			common << "script/magma-launch/fake_mac.so"
			#magma
			common << %r{.*/code-avisogenies/.*\.sig$}
			#zsh compile files
			common << "*.zwc"
			common << "*.zwc.old"
			r=default
			case backup
			when :common,:minimal,:sh,:usb_backup
				r+=common
			when :deploy
				r+="*.sig"
			when :perso,:photoslight,:photos_light
				r+="*.db"
			when :perso2
				r << "Music/Albums/01Other"
				r << "Music/A_Trier"
				r << "Music/Divers"
				r << "Music/Mirrors"
				r << "Music/MP3Albums"
			end
		end
	end
end
