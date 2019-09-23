#!/usr/bin/env ruby
require 'dr/config/computers'
require 'dr/sh'
require 'base64'

#$VERBOSE=2 #warnings

module DR
	#Unison.new(server, type: ..., **opts).process
	# => Unison.new(server,**opts).sync(*types)
	#by default use the server default types
	class UnisonGeneric

		ConfigError=Class.new(StandardError)
		def self.default_opts
			{gui: true, cat: true, merge: true, unison: [], type: [], detach: false}
			# type=[] => type=[:default]
		end

		#expand is what we use to expand 'all' or 'default' types
		def initialize(comp,**opts)
			opts=self.class.default_opts.merge(opts)
			@opts=Marshal.load(Marshal.dump(opts))
			#opts.dup is not enough because we want to do a deep copy
			#otherwise the unison options set there, which are a list, are set for
			#the other instances
			# p @opts
			@comp=Computer.computer(comp)
			@current=opts[:current]||Computer.new()
			expand_opt=@opts[:expand]
			if expand_opt.is_a?(Symbol)
				@expand=types_from_expand_type(expand_opt)
			else
				#order: [:unison][:types],types_from_expand_type([:unison][:type] || .name)
				expand_opt ||= @comp
				@expand=get_expand_types(Computers.computer(expand_opt))
			end
			@name=@comp[:name]
			@unisonfiles=@current.file(:userfiles)+"unison"
			@local_unisonfiles=Pathname.home+".unison"
			get_vars
			load_custom_config
		end

		def load_custom_config
			custom_files=%w(custom.rb alias.rb prefs.rb)
			custom_files.each do |f|
				[@unisonfiles, @local_unisonfiles].each do |d|
					fi=d+f
					load "#{fi}" if File.readable?(fi)
					#define alias_hash, custom_pref
				end
			end
		end

		# to subclass
		def types_from_expand_type(type)
			return nil if type.nil? #maybe monad
			warn "[types_from_expand_type] Unknown type: #{type}"
			{}
		end

		def get_expand_types(comp)
			if comp[:unison][:types]
				expand=comp[:unison][:types]
			elsif (type=comp[:unison][:type])
				expand=types_from_expand_type(type)
			else
				expand=types_from_expand_type(comp.name)
			end
			expand[:all] ||= expand.values.flatten.uniq
			expand[:default] ||= [* expand[:full]].first
			expand[:init]||=expand[:default] if expand[:default]
			return expand
		end

		def get_vars
			@root1=ENV['HOME']
			# we do the check explicitly in order to not fallback to @computer.name
			root=if @comp.dig(:unison, :local)
				ENV['HOME']
			else
				@comp.ssh(universal: true, mode: :uri)
			end
			if (path=@comp.dig(:unison,:unisonpath))
				path=Pathname.new(path)
				if path.absolute?
					@root2=path.to_s
				else
					@root2=root+"/"+path.to_s
				end
			else
				@root2=root
			end

			@uopts=@opts[:unison]
			@uopts.push("-logfile", "#{ENV['HOME']}/var/log/unison.log") unless @uopts.include?("-logfile")
			binpath=@comp.dig(:unison,:binpath)
			@uopts.push("-servercmd", binpath.to_s) if binpath && ! @uopts.include?("-servercmd")
			#if we set a binpath, also add the dir to PATH so that unison can find
			#unison-fsmonitor
			@uopts.push("-sshargs", "PATH=#{File.dirname binpath}:$PATH") if binpath && ! @uopts.include?("-sshargs")

			@uopts.push(*oneway(@root1)) if @opts[:push]
			@uopts.push(*oneway(@root2)) if @opts[:pull]

			@prog=@opts[:prog]
			unless @prog
				if (binpath=@current.dig(:unison, :binpath))
					@prog=binpath
				else
					@prog="unison"
					@prog="unison-gtk" if File.executable?("/usr/bin/unison-gtk")
					@prog="unison-gtk2" if File.executable?("/usr/bin/unison-gtk2")
				end
			end
			@prog=@prog.to_s
		end

		def oneway(from)
			#note: -noupdate includes -nodeletion already
			return ["-nocreation", from, "-nodeletion", from, "-noupdate", from]
		end

		def read(*files)
			r=""
			files.each do |file|
				file=Pathname.new(file) if String === file
				r+=file.read if file.readable?
			end
			return r
		end

		def typesname(*types)
			#sort so that we can pass the types in the order we want
			return types.sort.map(&:to_s).join("-")
		end

		def alias_hash(*comps)
			{}
		end

		def get_alias
			r=""
			#alias_hash returns a hash h where h[ploum]=[aliases of ploum]
			h={}
			h=alias_hash(@current,@comp)
			h.each do |k,a|
				a.each do |i|
					r+="rootalias = #{i} -> #{k}\n"
				end
			end
			return r
		end

		def readprefs(*types)
			r=""
			typesname=typesname(*types).to_sym
			types=types+[typesname] unless types.include?(typesname)
			#this is done so that for instance
			# $ unison.rb --all usb will read
			# "/home/dams/mine/config/unison/prefs-usb-common.prf"
			# "/home/dams/.unison/prefs-usb-common.prf"
			# "/home/dams/mine/config/unison/prefs-usb-data.prf"
			# "/home/dams/.unison/prefs-usb-data.prf"
			# "/home/dams/mine/config/unison/prefs-usb-common-data.prf"
			# "/home/dams/.unison/prefs-usb-common-data.prf"
			# (and prefs added interactively via unison go through
			# "/home/dams/.unison/prefs-usb-common-data.prf")
			types.each do |type|
				prefname="prefs-#{@name}-#{type}"
				#this will be the last pref file
				@prefname=prefname
				prefstaticfile=@unisonfiles+"#{prefname}.prf"
				preffile=@local_unisonfiles+"#{prefname}.prf"
				r+=read(prefstaticfile,preffile)
			end
			return r
		end

		# to subclass
		def custom_config(type)
			[""]
		end

		def readconfig(*types)
			r=""
			configfiles=[]
			types.each do |type|
				configfiles.push(@unisonfiles+"config-#{type}.prf")
				config_string,*config_files=custom_config(type)
				configfiles+=config_files
				r+=config_string
			end
			#we don't read the config files at once to avoid replication
			configfiles.uniq.each do |f|
				r+=read(f)
			end
			return r
		end

		def wrap_config(r)
			#follow symlinks (above the path in the config files)
			follow=[]
			r.each_line do |l|
				follow.push($1) if l=~ /^path\s*=\s*(.*)$/
			end
			allfollow=[]
			#we need to follow the parents of each path in follow
			follow.each do |f|
				cur=Pathname.new(f)
				while cur.to_s != "."
					allfollow.push(cur.to_s)
					cur=cur.parent
				end
			end
			allfollow.uniq.each do |f|
				r+="follow = Path #{f}\n"
			end
			r
		end

		def get_diff_merge
			r="diff = $HOME/mine/bin/gitdiff --unison\n"
			if @opts[:merge]
				if ! @opts[:gui]
					return r+<<EOS
merge = Regex .* -> vimdiff CURRENT1 CURRENT2 CURRENTARCHOPT
EOS
				else
					return r+<<EOS
merge = Regex .* ->  meld CURRENT1 CURRENT2 CURRENTARCHOPT
EOS
				end
			else
				return r
			end
		end

		def default_config
			read(@unisonfiles+"default_config.prf", @local_unisonfiles+".default_config.prf")
		end

		def config(*types)
			typesname=typesname(*types)
			@configname="config-#{@name}-#{typesname}.prf"
			configfile=@local_unisonfiles+@configname
			config=<<EOS
root = #{@root1}
root = #{@root2}
EOS
			config+=default_config
			config+=get_diff_merge
			config+=readconfig(*types)
			config+=readprefs(*types)
			(@opts[:paths]||[]).each do |path|
				config << "path=#{path}\n"
			end
			config+=get_alias
			config=wrap_config(config)
			raise ConfigError, "No paths detected" unless config =~ /^path/
			configfile.write(config)
			configfile
		end

		def edit_conf(conf)
			#SH.sh!("#{ENV['VISUAL'] || ENV['EDITOR']} #{conf.shellescape}")
			SH.sh!("#{ENV['EDITOR']} #{conf.shellescape}")
		end

		def process_types(*types)
			unless types.empty?
				conf=config(*types)
				edit_conf(conf) if @opts[:edit]
				uopts=@uopts.dup.push("-addprefsto", @prefname)
				SH.logger.debug("- Syncing #{@comp[:name]} with types #{types}")
				SH.sh(@prog, *uopts, @configname, log: true, detach: @opts[:detach], dryrun: @opts[:dryrun])
			end
		end

		def expand_types(*types)
			require 'dr/ruby_ext'
			types=types.map(&:to_sym)
			if types.empty?
				types=[:default]
			end
			types=@expand.leafs(types) if @expand.respond_to?(:leafs)
			#:none is a custom type which means 'do nothing'
			types.reject{|t| t==:none}
		end

		def sync(*types)
			types=expand_types(*types)
			if @opts[:cat]
				process_types(*types)
			else
				types.each do |t|
					process_types(t)
				end
			end
		end

		def process
			sync(*@opts[:type])
		end


		#Unison::SSH.new(ssh_client,**opts).process(*servers)
		#calls Unison.new on ssh_client
		class SSH
			def self.default_opts
				{}
			end

			def initialize(ssh_client,**opts)
				opts=self.class.default_opts.merge(opts)
				@opts=Marshal.load(Marshal.dump(opts))
				@ssh_client=Computer.computer(ssh_client)
			end

			def remote_unison
				$0 #"unison.rb"
			end

			# Use mode: :spawn to parallelize
			def process(*args, mode: :system)
				#SH.sh("#{@opts[:ssh]||"ssh"} #{@ssh_client.dig(:ssh, :hostu)} \"#{remote_unison} --deserialize #{self.class.base_encode(@opts)} #{args.shelljoin}\"", log: true, detach: @opts[:detach])
				@ssh_client.ssh("#{remote_unison} --deserialize #{self.class.base_encode(@opts)} #{args.shelljoin}", universal: true, ssh_command: @opts[:ssh]||"ssh", mode: mode)
			end

			def self.base_encode(opts)
				Base64.strict_encode64(Marshal.dump(opts))
			end
			def self.base_decode(opts)
				Marshal.load(Base64.decode64(opts))
			end

		end


		#Unison::Sync.new(server: server,type: types,**opts).process(*clients)
		#=> essentially simulate 'ssh server Unison.new(client).sync(*types)
		#		- but if client==current calls directly Unison.new(server)
		#		- and :expand is the one of the client, not the server
		class Sync
			def self.ssh
				SSH
			end
			def self.unison
				UnisonGeneric
			end

			def initialize(**opts)
				default_opts=self.class.default_opts
				sync_opts=self.class.sync_mode_opts(opts.delete(:syncmode))
				opts=default_opts.merge(sync_opts).merge(opts)
				%i(unison type).each do |key|
					if opts.fetch(key,[]).empty? and sync_opts.key?(key)
						opts[key]=sync_opts[key]
					end
				end
				server=opts.delete(:server) || Computer.new
				server=opts[:default_server] if server==:default #server=:default when sync_mode is true
				@server=Computer.computer(server)
				#@opts=opts.dup #we want a deep copy, cf Unison#initialize
				@opts=Marshal.load(Marshal.dump(opts))
			end

			def ssh
				self.class.ssh
			end

			#connect local comp to server
			def inmode(target, **opts)
				opts=@opts.merge(opts)
				#in UnisonSync we want :expand to be the one of target, not server
				opts[:expand]||=target
				# with inmode we don't want to detach, because usually we want to
				# sync our local computer with the server before syncing the server
				# with the other computers
				opts[:detach]=false if opts[:detach]==:auto
				SH.logger.debug "-> Using local mode, options: #{@opts}"
				Unison.new(@server,**opts).process
				return self
			end

			#connect server to arguments (via ssh)
			def outmode(*args)
				detach=@opts[:detach]
				if @opts[:detach]==:auto
					args.length > 1 ? detach=true : detach=false
				end
				if detach
					comps=Computers.computers(*args)
					currents = comps.select {|c| c.is_current?}
					others=comps - currents
					currents.each {|c| inmode(c, **@opts, detach: detach)}
					ssh.new(@server,**@opts, detach: detach).process(* others.map {|c| c.dig(:names, :argument)}) unless others.empty?
				else
					Computers.computers(*args).each do |a|
						if a.is_current?
							#hack so that we save an ssh
							inmode(a, **@opts, detach: detach)
						else
							SH.logger.debug("- Going through server #{@server[:name]}, options: #{@opts}")
							# TODO: filter the current computers and pass all other ones at once to ssh.new(...).process?
							ssh.new(@server,**@opts, detach: detach).process(a.dig(:names, :argument))
						end
					end
				end
			end

			def process(*args)
				if @server.is_current?
					Computers.computers(*args).each do |a|
						self.class.unison.new(a,**@opts).process
					end
				else
					if @opts[:mode]
						@opts[:mode].each_char do |c|
							case c
							when 'i'
								inmode(Computer.new)
							when 'o'
								outmode(*args)
							end
						end
					else
						outmode(*args)
					end
				end
			end

			def self.default_opts
				#{type: []}
				UnisonGeneric.default_opts.merge({detach: :auto})
			end

			def self.sync_mode_opts(mode)
				case mode
				when nil, false
					{}
				else
					#to subclass
					{ server: :default }
				end
			end

			def self.parse_opts(*args, **extra_opts)
				require 'optparse'

				opts=default_opts.merge(extra_opts)
				gui=->(t) do
					opts[:gui]=t
					if t
						opts[:unison].push('-ui', 'graphic')
					else
						opts[:unison].push('-ui', 'text')
					end
				end
				optparse = OptionParser.new do |opt|
					opt.banner = "Wrapper around unison"
					opt.separator "Unison options"
					opt.on("-b", "--batch", "unison batch mode") do |v|
						#-batch accepts all non conflicting changes automatically
						#(works in graphic and text mode)
						if v
							opts[:unison].push('-batch')
						else
							opts[:unison].delete('-batch')
						end
					end
					opt.on("-g", "--[no-]gui", "[on by default]") do |v|
						#the gui option is on by default because we try to look for a -gtk binary
						gui[v]
					end
					opt.on("-c", "text mode") do |v|
						gui[!v]
					end
					opt.on("-a", "--auto", "unison -auto option") do |v|
						if v
							opts[:unison].push('-auto')
							#this option (automatically accept non conflicting choices) only makes sense in ui=text
							#can still rego through the change by selecting 'n'
							gui[false]
						else
							opts[:unison].delete('-auto')
						end
					end
					opt.on("--prog PROG", "path to unison") do |v|
						opts[:prog]=v
					end
					opt.on("--[no-]push", "Push files") do |v|
						opts[:push]=v
					end
					opt.on("--[no-]pull", "Pull files") do |v|
						opts[:pull]=v
					end
					opt.on("--[no-]merge", "Prevent merge") do |v|
						opts[:merge]=v
					end
					opt.on("-o OPT1,OPT2", Array, "unison options") do |v|
						opts[:unison].push(*v)
					end

					opt.separator("Type selection")
					opt.on("-t", "--type TYPE1,TYPE2", Array, "config types") do |v|
						opts[:type].push(*v)
					end
					opt.on("--full", "use full types") do |v|
						opts[:type].push("full")
					end
					opt.on("--all", "use all types") do |v|
						opts[:type].push("all")
					end
					opt.on("--none", "clear all types (to not run unison)") do |v|
						opts[:type]=[:none]
					end
					opt.on("--expand computer", "how to expand default/all types") do |v|
						opts[:expand]=v
					end
					opt.on("--[no-]cat", "cat types [on by default]") do |v|
						opts[:cat]=v
					end

					opt.separator "Sync options"
					opt.on("--ssh_command SSH", "ssh command") do |v|
						v="default" unless v
						opts[:ssh]=v
					end
					opt.on("--server SERVER", "server to connect to") do |v|
						opts[:server]=v
						# if opts[:server]==:default, then look at opts[:default_server]
						# if opts[:server]==nil, fallback to current
					end
					opt.on("--mode MODE", "inbound/outbound") do |v|
						opts[:mode]=v
					end
					opt.on("--ssh client", "connect to 'client' via ssh") do |v|
						# `unison.rb --ssh foo ploum` will run `ssh foo unison.rb ploum`
						opts[:ssh_client]=v
					end
					opt.on("-s", "--sync", "=[SYNC]", "sync mode") do |v|
						#merging nows allow later options to override the settings of sync_mode_opts
						# opts.merge!(sync_mode_opts(v))
						#Update: we merge 'sync_opts' before the opts, so this is the case already
						opts[:syncmode]=v
						# typically this set opts[:server] and opts[:type]
					end

					opt.separator "Misc options"
					opt.on("-d", "--[no-]detach", "parrallel mode", "Default to :auto") do |v|
						opts[:detach]=v
					end
					opt.on("-e", "--[no-]edit", "edit", "Edit config before running unison") do |v|
						opts[:edit]=v
					end
					opt.on("-p", "--path=paths", Array, "Add custom paths") do |v|
						opts[:paths]=v
					end
					opt.on("--deserialize HASH", "[intern use]") do |v|
						opts.merge!(ssh.base_decode(v))
						p opts
					end
				end
				optparse.parse!(args)
				uopts=args.select {|a| a[0]=="-"}
				args-=uopts
				#unison understand opt=foo but not opt=foo=bar, but I need this type of
				#arguments to call -sshargs="PATH=bin/"
				#so when there is two '=' I modify the option to bee 'opt "foo=bar"'
				uopts=uopts.map do |opt|
					optvalues=opt.split('=')
					if optvalues.length < 2
						optvalues.join('=')
					else
						[optvalues[0],optvalues[1..-1].join("=")]
					end
				end.flatten
				unless uopts.empty?
					opts[:unison]||=[]
					opts[:unison]+=uopts
				end
				#opts[:unison]+=["-sshargs", "PATH=bin/"]
				return args, opts
			end

			def self.parse(*args)
				args, opts=self.parse_opts(*args)
				if opts[:ssh_client]
					client=opts.delete(:ssh_client)
					ssh.new(client,**opts).process(*args)
				else
					#with no server configure (via --server=... or --sync=...), this will
					#default to server="current" and call DR::Unison.new(arg)
					self.new(**opts).process(*args)
				end
			end

		end
	end
end

if __FILE__ == $0
	DR::UnisonGeneric::Sync.parse(*ARGV)
end
#Specifying the executable unison command:
#-local: unisonsync --prog ploum;  unisonsync --prog ploum 4a
#-remote: unisonsync -o -servercmd,ploum
#Via ssh: ssh -Y doriath '. ./.initenv; unison.rb -s' 
