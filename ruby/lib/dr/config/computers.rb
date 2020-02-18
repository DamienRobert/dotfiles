#!/usr/bin/env ruby
# vim: fdm=marker

=begin
  * initialisation
	def initialize(name=nil, check: false, local: nil, retrieve_local: true, infos: {})
	- name=nil => name="current" [note: if name="local" and the :local opt is nil, then it is set to true]
	- check: check if the name is in List[:all]
	- local=true => compute local infos (cf handle_local)
	- local=false && retrieve_local=true => fetch local infos from the db (cf retrieve_local_infos)
	- infos: initial infos

	Remark: process_files helpers use name="local" by default

	* retrieving infos
	Note that we don't merge local_infos to infos anymore. To retrieve infos, use dig:
			def dig(*args,default:nil, merge:false)
			  - merge=false => dig infos then dig infos[:local]
			  - merge=true => infos[...].deep_merge(infos[:local][...])
	
	* Specifying computers from the command line
	- In opts/process_helpers, the option "-c/--computers=" accept a list (so split on ',')
	- This list is passed to DR::Computers.computers
	  Note that if we pass _ToUnison, then since :ToUnison is in
	  DR::Computers.list we get the list of all 'ToUnison' computers
	- Specific options can be passed via '!opt=value': (cf get_name_options)
		DR::Computer.new("foobar!my/option=2") => this set infos[:my][:option]="2"
	- Then the name itself is parsed by handle_ssh_uri
		=> DR::Computer.new("dams@foobar:plim") set the name to foobar, the :root to plim, and :ssh/:user + :user/:username to dams
		Note that handle_ssh_uri also accept urls, it auto detect them if they are of the form foo://ploum. In this form we can pass ssh options too
		=> DR::Computer.new("ssh://dams@foobar:30/plim?myopt=value&a/b=value2") set the name to foobar, the :ssh/:user+:user/:username to dams, the :ssh/:port to 30, the :root to plim and set :ssh/:options/:myopt to "value" and :ssh/:options/:a/:b to "value2"
	- One can also set ssh options like this
	  DR::Computer.new("foobar!ssh=ploum@plam:foo") => :ssh=>{:user=>"ploum", :host=>"plam", :path=>"foo"}. Here the name is not set to plam, and :user/:username not set to ploum, and the root not set to :foo
	  DR::Computer.new("foobar!ssh=ssh://ploum@plam:20?a=b") => :ssh=>
    {:user=>"ploum", :host=>"plam", :port=>20, :path=>"", :options=>{:a=>"b"}},

		Note that DR::Computer#ssh does not use the :root as a default for the :ssh/:path. So the first two forms above does not set the :ssh/:path, only the :root. To set the :ssh path, specify it as an option 'ssh://foo?path=plim' or 'ploum!ssh=ploum:plim' or 'ploum!ssh/path=plim'
=end

require 'forwardable'

begin
	require 'dr/base/utils' #pretty_print
rescue LoadError
	#try to fix the load path
	require_relative "../load/load_path"
	require 'dr/base/utils'
end
require 'dr/parse/simple_parser'
require 'dr/ruby_ext/core_ext'
require 'dr/sh'
require 'dr/base/bool'

module DR
	module Computers #{{{
		extend self

		myfiles=Pathname.new("mine")
		MYFILES={my: myfiles,
			user: myfiles+"user",
			syst: myfiles+"syst",
			script: myfiles+"script",
			maint: myfiles+"maint",
			cfg: myfiles+"user/config",
			dot: myfiles+"user/config/dotfiles",
			crypt: myfiles+"crypt",
			infos: myfiles+"@infos",
			mycomputers:myfiles+"00COMPUTERS.rb",
			initenv: myfiles+"initenv",
		}
		REL_FILES={
			rel_xdg_config_home: ".config",
			rel_xdg_data_home: ".local/share",
			rel_xdg_cache_home: ".cache",
			rel_xdg_runtime_dir: "tmp",
		}
		REL_FILES.each do |k,v|
			REL_FILES[k]=Pathname.new(v)
		end
		MYFILES.each do |symb,value|
			key=("rel_"+symb.to_s+"files").to_sym
			key=:rel_mycomputers if symb==:mycomputers
			key=:rel_initenv if symb==:initenv
			REL_FILES[key]||=value
		end
		DUMPFILE=Pathname.home+MYFILES[:infos]+"computers.dump"

		def get_dumpfile
			dumpfile=DUMPFILE
			if dumpfile.readable?
				Marshal.load(dumpfile.read)
			else
				{}
			end
		end

		# Lists of computers, attributes and aliases {{{
		#Terminologie: ordi fixe => nom d'elfe
		#Ordi portable => nom de lieu
		#Raspberry => nom de nain
		#Clé usb => nom de hobbit
		archclient = %w(Feanor Mithrim Doriath Numenor Valinor FleurBleue Gondolin Durin Baggins)
		archserver = %w()
		# a virtual is typically a raw image with a gpt partition + EFI boot
		archvirtual = %w(arch_test) #see also add_attribute which define regexp matches
		# a container can be a directory/subvolume, or a raw image with only
		# one fs (as according to the partition spec)
		archcontainer=%w()
		session = %w(imb phare 4a)
		devel = %w(plafrim) #bbq #:unison_type => devel
		backup = %w(usb_backup unison_backup)
		special = %w(minimal light standard full sh devel init server console)

		arch=archclient+archserver+archvirtual+archcontainer
		myclients=archclient #hosttype=perso
		own=arch
		other=(session+devel).uniq
		client=archclient+%w(oimb)
		server=archserver+session
		virtual=archvirtual; container=archcontainer
		laptop=%w(Gondolin Numenor Valinor Mithrim Doriath FleurBleue) #=> laptop: true
		xorg=archclient+%w(imb cremi)
		shell=(xorg+session).uniq #long sessions
		ssh=(client+server).uniq #accessible by ssh

		light=%w(Gondolin Durin Baggins phare FleurBleue)
		standard=%w(Numenor Valinor 4a)
		full=%w(Feanor Mithrim Doriath imb)

		#syst_type => minimal/init/server/console/light/standard/full
		systserver=(archserver+archvirtual).uniq,
		systlight=light
		syststandard=standard
		systfull=full
		#:usertype => minimal/light/standard/full
		userlight=light
		userstandard=standard
		userfull=full
		#:unison_type => sh/minimal/light/standard/full,devel
		#set infos[:unison][:types] for fine grained control, cf unison.rb:expand_types
		unisonfull=full+%w(4a)
		unisonminimal=%w(phare FleurBleue)
		unisonstandard=(light+standard-unisonfull-unisonminimal).uniq

		UnisonServer="imb"
		List={}
		List[:ToUnison]=(session+xorg+devel+archserver-archclient-Array(UnisonServer)).uniq #Servers I want to synchronise via unison A1unisonall
		List[:AllUnison]=List[:ToUnison]+Array(UnisonServer)
		List[:all]=(own+other+backup+special).uniq
		List[:unison_relative_path]=List[:AllUnison]-archserver

		Attributes={
			types: {light: light, standard: standard, full: full,
				own: own, other: other, special: special, backup: backup},
			syst_types: {admin: own,
				client: client, server: server, virtual: virtual, container: container,
				archclient: archclient, archserver: archserver, archvirtual: archvirtual, archcontainer: archcontainer},
			user_session: {ssh: ssh, shell: shell, xorg: xorg},
			user_mail: {offlineimap: full}, # +%w(Numenor)
			user_sudo: own,
			user_wm: {fvwm: xorg},
			user_desktop: {xfce: xorg},
			hardware: {laptop: laptop, usb: %w(Baggins), desktop: %w(Feanor)},
			distribution: {archlinux: arch, ubuntu: %w(imb), debian: %w(4a phare)},
			location: {home: %w(Feanor Doriath Valinor FleurBleue Durin), imb: %w(imb Gondolin Numenor Mithrim), virtual: archvirtual, away: session},

			syst_type: {
				server: systserver,
				light: systlight,
				standard: syststandard,
				full: systfull,
			},
			user_type: {
				light: userlight,
				standard: userstandard,
				full: userfull,
			},
			unison_type: {
				minimal: unisonminimal,
				standard: unisonstandard,
				full: unisonfull,
				devel: devel,
			},
			user_hosttype: {
				perso: myclients,
				ens: %w(phare 4a),
				imb: %w(imb cremi)
			}
		}
		# We reverse the logic in Computer; for instance for 'imb':
		# :list=>[:ToUnison, :all, :unison_relative_path],
		# :attributes=>
		#  {:types=>[:full, :other, :server],
		#   :session=>[:ssh, :shell, :xorg],
		#   :user_mail=>[:offlineimap],
		#   :hardware=>[],
		#   :distribution=>[:ubuntu],
		#   :wm=>[:fvwm],
		#   :desktop=>[:xfce],
		#   :location=>[:imb, :away],
		#   :syst_type=>[:full],
		#   :user_type=>[:full],
		#   :unison_type=>[:full],
		#   :user_hosttype=>[:imb]},


		#ssh: use the new name for :ssh
		#name: use the new name for :name
		Alias={"ens" => "phare", "mygale" => "plafrim", "barbecue" => "bbq",
			"oimb" => [ "imb", "ssh-name", {:ssh => {:hostu => "oimbu" }}],
			"bimb" => [ "imb", "ssh" ],
			"numenorfree" => [ "numenor", "ssh" ],
			"Baggins32" => [ "Baggins", "name", {:syst => {:arch => 'i686'}} ],
			"old_Feanor" => [ "Feanor", "name" ],
		}
		#}}}

		#check if it is in the Computers list
		def check(name)
			return List[:all].include?(name)
		end

		#find the canonical name of the computer
		def normalize(param)
			return nil unless param
			name=(List[:all]+Alias.keys).find {|v| v.downcase == param.downcase }
			return name||param
		end

		def infos(*args,**kwds)
			args = [nil] if args.empty?
			return Computer.new(*args,**kwds).infos
		end

		def list
			list={}
			List.each do |k,v|
				list[k.to_s]=v
			end
			flattify= lambda do |h|
				r={}
				h.each do |k,v|
					if v.is_a?(Hash)
						s=flattify.call(v)
						s.each do |kk, vv|
							r["#{k}_#{kk}"]=vv
						end
					else
						r[k.to_s]=Array(v)
					end
				end
				r
			end
			list.merge(flattify.call(Attributes))
		end

		def computer(name=nil)
			Computer === name ? name : Computer.new(name)
		end

		def computers(*args, default: false, list: true, **options)
			if args.empty?
				[default==false ? Computer.new : Computer.new(default)]
			else
				comp_list=self.list if list
				args.flat_map do |c|
					if list and c.is_a?(String) and c[0]=="_" and
						comp_list.include?(trail=c[1..-1])
						comp_list[trail].map {|c| DR::Computer.new(c, **options)}
					else
						Computer === c ? c : Computer.new(c, **options)
					end
				end
			end
		end
	end #}}}

	class Computer #{{{
		attr_accessor :rel_files
		ROOTLEAF="rootleaf"

		def self.computer(*args)
			Computers.computer(*args)
		end
		def self.computers(*args)
			Computers.computers(*args)
		end
		include PPHelper

		module LoadFileHelper #{{{
			def self.gpg_file?(file)
				[".gpg", ".asc"].include?(file.extname)
			end

			def load_file(file, yaml: false)
				file = Pathname.new(file)
				return nil unless file.exist?
				begin
					if LoadFileHelper.gpg_file?(file)
						decode = `gpg --no-tty -d #{file}`
						if decode.empty?
							warn "Error in gpg: the output is empty"
						else
							if yaml
								require 'yaml'
								YAML.load(decode)
							else
								decode
							end
						end
					else
						if yaml
							require 'yaml'
							YAML.load_file(file)
						else
							file.read
						end
					end
				rescue StandardError => e
					warn "Error in parsing file #{file}: #{e} #{e.backtrace.first}"
				end
			end

			def write_file(file, content, yaml: false)
				if yaml
					require 'yaml'
					content=content.to_yaml
				end
				Pathname.new(file).write(content)
			end
		end
		extend LoadFileHelper
		#}}}

		module InfosHelpers #{{{
			extend Forwardable
			attr_accessor :infos
			#def_delegators :@infos, :[], :[]=, :each, :to_h # :add_key, :dig
			def_delegators :@infos, :[], :[]=, :each, :each_key, :each_value, :fetch, :fetch_values, :has_key?, :has_value?, :key, :key?, :value?, :values, :to_h

			#add_infos(inf) does a reverse deep_merge, ie does not overwrite infos
			def add_infos(inf)
				self.infos=inf.deep_merge(infos)
			end

			def key?(*args)
				@infos.has_keys?(*args)
			end

			def dig(*args,default:nil, merge:false)
				if merge
					local=@infos.dig(:local_infos, *args)
					inf=@infos.dig(*args)
					case inf
					when Hash
						inf.deep_merge(local)
					when Array
						inf+local
					when nil
						local || default
					else
						inf
					end
				else
					@infos.dig_with_default(*args, default: @infos.dig_with_default(:local_infos, *args, default: default))
				end
			end
			# Note that DR::Hash has set_key,add_key,add_to_key(*keys, value)

			def set_key(*args)
				@infos.set_key(*args)
			end
			def add_key(*keys, key, value)
				o=Object.new
				r=dig(*keys, key, default: o) #this looks at local_infos too
				@infos.add_key(*keys, key, value) if r==o #not found
			end
			def add_to_key(*keys, key, value, uniq: true, overwrite: false, deep: false)
				o=Object.new
				r=dig(*keys, key, default: o) #this looks at local_infos too
				if r==o #not found
					@infos.add_to_key(*keys, key, value, uniq: uniq, overwrite: overwrite, deep: deep)
				else
					if value.is_a?(Hash)
						r ||= {}
						if deep
							overwrite ? r.deep_merge!(value) : r=value.deep_merge(r)
						else
							overwrite ? r.merge!(value) : r=value.merge(r)
						end
					else
						r ||= []
						r += Array(value)
						r.uniq! if uniq
					end
					@infos.set_key(*keys, key, r)
				end
			end
		end
		include InfosHelpers #}}}

		module MachineHelpers #{{{
			def root
				Pathname.new(dig(:root, default: Pathname.slash))
			end

			def chroot?
				root != Pathname.slash
			end

			# for machinectl
			def machine
				dig(:machine)
			end
		end
		include MachineHelpers #}}}

		module NameHelpers #{{{
			def name
				dig(:name, default: dig(:names, :name))
			end
			def sym_name
				name.downcase.to_sym
			end
			def name=(n)
				n=n.name if Computer === n
				oldname=name
				if n != oldname
					warn "# 00COMPUTERS: got nil name [#{dig(:names)}]" if n.nil?
					warn "# 00COMPUTERS: got empty name [#{dig(:names)}]" if n&.empty?
				end
				infos[:name]=n
				infos[:names]||={}
				infos[:names][:name]=n
			end
			def check(name=self.name)
				Computers.check(name)
			end

			#is_current? is true when we specified a name (or nil) which is the name of the current computer
			#current? is true when we are on the local computer (ie we called Computer.new(nil)
			#eg: on Doriath, Computer.new("doriath").is_current? is true while
			#current? is false
			#local? is true when we called handle_local which set local infos
			#present? is true when infos[:root] is set (not that by default
			#@computer.root fallbacks to '/' even if it is not set, that's why we
			#check infos[:root] directly in present?); this mean we are current
			#or a container or image;..
			def is_current?
				cur_name, _cur_type=self.class.get_current_name
				name == cur_name
			end
			def current?
				# this invoke a Computer call again
				# self === "current"
				iname=dig(:names,:init_name)
				iname == "current" or iname == "local"
			end
			def local?
				infos[:local]
			end
			# true if we can access the filesystem
			def present?
				infos[:root]
			end
			def has_local_infos?
				(l=infos[:local_infos]) && !l.empty?
			end
			def alias?
				infos[:names][:alias_name]
			end
		end
		include NameHelpers #}}}

		module AttributesHelpers #{{{
			#list each attributes where we appear
			#if the value of an attribute is a hash, we list each key
			#exemple: attributes={ types: {light: light, standard: standard}, sudo: own}, we would get something like {sudo: true, types: {:light}}
			private def get_attributes(name,attributes)
				a={}
				attributes.each do |attr,values|
					case values
					when nil #skip
					when Array
						a[attr]=true if values.include?(name)
					when Hash
						list=values.each.map{|k,v| k if v && v.include?(name)}.compact
						a[attr]=list unless list.empty?
					end
				end
				return a
			end

			#attribute?(attr,value) check if value is in the attributes infos[:attributes][attr]
			#if value is an array, check if 'all?' values are there
			#if value is nil only check if attr is in infos[:attributes]
			def attribute?(attr,value=nil, method: :all?)
				if value
					method.to_proc.call([*value]) {|v| infos[:attributes][attr]&.include?(v)}
				else
					infos[:attributes].key?(attr)
				end
			end

			def any_attribute?(*args)
				attribute?(*args, method: :any?)
			end

			def add_attribute(attribute, *args)
				infos[:attributes]||={}
				infos[:attributes][attribute]||=[]
				infos[:attributes][attribute]+=args
				infos[:attributes][attribute].uniq!
			end
		end
		include AttributesHelpers #}}}

		module FilesHelpers #{{{
			Fileskey=:files
			def files
				dig(Fileskey, merge: true)
			end

			# file(:myfiles) => if :myfiles does not exist and
			# - fallback is true => :rel_myfiles
			# - fallback=:home is true => Pathname.home + :rel_myfiles
			# If check is true => return nil if the file does not exist
			# Special case for :homepath => special fallback to '~', '', '.'
			# The :tilde fallback is used in Computer#home
			def file(name, fallback: true, check: false, check_fallback: false, relative_from: :home)
				files=self.files||{}
				f=files.dig(name.to_sym)
				#xdg_{config,data}_dirs are Arrays
				f.is_a?(Array) and return f
				f &&= Pathname.new(f)
				if name==:homepath and (f.nil? or check && !f.directory?)
					case fallback
					when :tilde
						return Pathname.new('~')
					when :empty, :none
						return Pathname.new('')
					when :dot, :current
						return Pathname.new('.')
					end
				end
				#fallback to relative file
				f=nil if check and !f&.exist?
				g=files.dig("rel_#{name}".to_sym)
				g &&= Pathname.new(g)
				if f.nil? and g
					case fallback
					when true
						f=g
					when :home
						f=Pathname.home+g
					when :homepath,:tilde,:empty,:none,:dot,:current
						f=fallback
						h=file(:homepath, fallback: f, check: check)
						f = h+g if h
					end
					f=nil unless f.exist? if check_fallback
				end
				#fallback to absolute file if we requested a relative one which
				#don't exist
				if f.nil? and (m=name.to_s.match(/^rel_(.*)/))
					abs=m[1]
					g=files.dig(abs.to_sym)
					g &&= Pathname.new(g)
					h=if relative_from==:home
							home
						else
							Pathname.new(h)
						end
					f=h.rel_path_to(g, inside: true) if h and g
				end
				f
			end
		end
		include FilesHelpers #}}}

		module SshHelpers #{{{
			def ssh(*args, mode: :hash, **opts, &b)
				host=dig(:ssh, :host) || name.downcase
				host=dig(:ssh, :hostu) || host if opts[:universal]
				opts=dig(:ssh, :options, default: {}).merge(dig(:ssh, default: {})).merge(opts)
				ssh_opts={}
				SH.method(:ssh).parameters.each do |param|
					ssh_opts[param[1]]=opts[param[1]] if param[0]==:key or param[1]==:keyrest and opts.key?(param[1])
					#keyrest is :opts
				end
				host=:local if mode==:sshkit and current?
				# mode: :hash => {:ssh_command, :ssh_options, :ssh_command_options,
				# :user, :host, :path, :hostssh, :command}
				SH.ssh(host, *args, mode: mode, **ssh_opts, &b)
			end

			def sshfile(file, present: nil, escape: false, **opts)
				present = present? if present.nil?
				file = if present
					file
				else
					"#{ssh_name(**opts)}:#{file}"
				end
				escape ? file.shellescape : file
			end
		end

		def ssh_name(**opts)
			r=self.ssh(mode: :hash, **opts)
			r[:hostssh]
		end
		include SshHelpers #}}}

		module LocalInfosHelpers #{{{
			# compute local infos
			def get_local_infos(local: true)
				begin
					require 'dr/config/infos'
					local_infos=case local
					when nil, false
						infos[:local_infos]
					when :files
						Config::Infos.file_infos(context: self)
					when :user
						Config::Infos.user_infos(context: self)
					else
						Config::Infos.infos(context: self)
					end
				rescue => e
					warn "ERROR In local infos: #{e} #{e.backtrace.first}"
				ensure
					local_infos||={}
				end
				local_infos
			end

			# see if we have stored the info somewhere
			def retrieve_local_infos
				stored_infos=Computers.get_dumpfile
				if stored_infos&.key?(name)
					local_infos=stored_infos[name]
					infos.deep_merge!({local_infos: local_infos})
				end
			end
			def save_local_infos(mode=nil)
				stored_infos=Computers.get_dumpfile || {}
				stored_infos[name]=get_local_infos(local: mode)
				stored_infos[name][:save_date]=Time.now
				Computers::DUMPFILE.write(Marshal.dump(stored_infos))
			end

			def laptop?
				attribute?(:hardware,:laptop) or dig(:syst, :laptop)
			end
		end
		include LocalInfosHelpers #}}}

		module AuthInfoHelpers #{{{
			def get_authinfo(authfile: file(:cfgfiles, fallback: :home, check: true)+".authinfo", **opts)
				require "dr/config/authinfo"
				AuthInfo.get_authinfo(authfile: authfile, **opts)
			end
			def authinfo
				@authinfo||=get_authinfo
			end
			alias :auth :authinfo

			def get_secrets_auth
				self.class.load_file(file(:cryptfiles,fallback: :home, check: true)+"secrets", yaml: true)
			end
			def write_secrets_auth(content=secrets_auth)
				self.class.write_file(file(:cryptfiles,fallback: :home, check: true)+"secrets", content, yaml: true)
			end
			def secrets_auth
				@secrets_auth ||=get_secrets_auth
			end
			def get_network_auth
				self.class.load_file(file(:cryptfiles,fallback: :home, check: true)+"network", yaml: true)
			end
			def network_auth(key)
				secrets_auth&.dig(key, :network)
			end
			def local_network_auth
				network_auth(name) || network_auth(sym_name)
			end
		end
		include AuthInfoHelpers #}}}

		module NetworkHelpers #{{{
			require 'dr/config/network'
			extend Forwardable
			attr_accessor :global_network, :local_network
			def_delegators :@local_network, :network, :network_zones, :others_network, :connect_to
			def init_network
				@global_network=if attribute?(:types, :own)
					DR::Config::Network.global_network
				else
					DR::Config::Network::GlobalNetwork.new
				end
				@local_network= @global_network[self.name] || @global_network[self.sym_name]
			end

			# vpn keys
			def network_keys(name=self.name, type: nil)
				case type
				when :wg
					priv=network_auth(name)&.dig(:wg, :private)
					pub=network_auth(name)&.dig(:wg, :public)
					if priv && !pub and SH.find_executable("wg")
						pub=%x/echo '#{priv}' | wg pubkey/.chomp
					end
				when :tinc
					pub=Pathname.new(file(:cryptfiles)+"tinc/#{name}_rsa_key.pub").read!
					priv=Pathname.new(file(:cryptfiles)+"tinc/#{name}_rsa_key.priv").read!
				when :zt, :zerotier
					pub=Pathname.new(file(:cryptfiles)+"zerotier/#{name}_identity.public").read!
					priv=Pathname.new(file(:cryptfiles)+"zerotier/#{name}_identity.secret").read!
				end
				return priv, pub
			end
		end
		include NetworkHelpers #}}}

		module UserHelpers #{{{
			def user_log(file,msg)
				file=file.to_s+".log" unless file.to_s.end_with?(".log")
				file=Pathname.new(file)
				if file.relative?
					logdir=file(:logdir)
					logdir=home+logdir if logdir.relative?
					file=logdir+file
				end
				require 'time'
				t=Time.now.xmlschema
				file.filewrite("#{t} - #{msg}",mode:"a",mkpath:true)
			end

			def home(fallback: :tilde, check: false)
				file(:homepath, fallback: fallback, check: check)
			end

			# size to fit n_x * n_y windows in a certain screen factor
			def window_size(height_factor:1, width_factor:1, strut: true, decor: true, n_x: 1, n_y: 1, screen: :screen0)
				height=dig(:xorg,:screens,screen,:resolution,:height, default:768)
				height -= dig(:xorg,:strut,:bottom,default:0)+
					dig(:xorg,:strut,:top, default: 0) if strut
				height*=height_factor
				height -= (dig(:xorg,:decor,:bottom, default:0)+
					dig(:xorg,:decor,:top, default: 0))*n_y if decor
				width=dig(:xorg,:screens,screen,:resolution,:width, default:1024)
				width -= dig(:xorg,:strut,:left, default:0)+
					dig(:xorg,:strut,:right, default:0) if strut
				width*=width_factor
				width -= (dig(:xorg,:decor,:left, default:0)+
					dig(:xorg,:decor,:right, default:0))*n_x if decor
				return (width/n_x).round, (height/n_y).round
			end
		end
		include UserHelpers #}}}

		module RunHelpers #{{{
			def run(**opts)
				require 'dr/config/configure/run'
				Run.new(self, **opts)
			end

			def run_command(*args, **opts)
				run.run_command(*args, **opts)
			end
		end
		include RunHelpers #}}}

		module XorgHelpers #{{{
			# There are three strategies:
			# - either we leave the dpi at broken 96 value, and we compute a
			# scale get_real_dpi/96 for everything
			# => set_layout(..., scale: :auto)
			# - or we compute the real dpi and we set it in .Xresources and xsettings
			# => set_dpi
			# - or we set everything by hand
			# => set_layout(fontsize: 12, vert: 50)

			def set_dpi(dpi=:auto)
				dpi=get_real_dpi if dpi==:auto
				set_key(:xorg,:Xft,:dpi,dpi)
			end

			def default_fontsize
				if laptop?
					9
				else
					13
				end
			end

			def set_layout(fontsize: default_fontsize, mono: fontsize+1, sans: fontsize, small: fontsize-2, smallmono: mono-2, vert: :auto, svert: :auto, gvert: :auto, fonts_callback: nil, terms_callback: nil, strut_callback: nil, decor_callback: nil, scale: 1)
				if scale == :auto
					scale = get_real_dpi*1.0 / get_screen_dpi
					scale=(scale*10).round / 10.0 #round
				end
				fonts={}
				fonts[:vt]={family: "Monospace", size: mono*scale, line_height: 1.2*scale}
				fonts[:vte]={default: :vt}
				fonts[:small_vt]={size: smallmono*scale, default: :vt}
				fonts[:default]={family: "Sans", size: sans*scale}
				fonts[:fvwmtitle]={default: :fvwm, size: sans*scale, style: "bold"}
				fonts[:conkysmall]={size: small*scale, default: :conky}
				# :gtk, :fvwm, :conky
				fonts = fonts_callback.(fonts) if fonts_callback
				#infos[:xorg][:fonts]=fonts.deep_merge(infos[:xorg][:fonts]||{})
				add_to_key(:xorg, :fonts, fonts, overwrite: true, deep: true)

				if attribute?(:user_wm,:fvwm)
					height=get_font_size(:fvwm)
					#the pixmaps have a height of 16px, so lets count 2px above and below
					decor = {:left => 1, :right => 1, :top => [height, 20].max, :bottom => 1}
					decor = decor_callback.(decor) if decor_callback
					#infos[:xorg][:decor]=decor.deep_merge(infos[:xorg][:decor]||{})
					add_to_key(:xorg, :decor, decor, overwrite: true, deep: false)
				end

				if attribute?(:user_desktop,:xfce)
					strut = {:left => 0, :right => 0, :top => 30, :bottom => 0}
					strut = struct_callback.(strut) if strut_callback
					#infos[:xorg][:strut]=strut.deep_merge(infos[:xorg][:strut]||{})
					add_to_key(:xorg, :strut, strut, overwrite: true, deep: false)
				end

				terms={}
				vert=get_terminal_height(:vt) if vert == :auto
				svert=get_terminal_height(:small_vt, fit: 2) if svert == :auto
				if gvert == :auto
					gvert=get_terminal_height(:vte)  do |height|
						#we need to adjust the available height because of the tabs
						height - get_font_size(:gtk)
					end
				end
				terms[:vt]={vert: vert}
				terms[:vte]={vert: gvert}
				terms[:small_vt]={vert: svert}
				terms = terms_callback.(terms) if terms_callback
				#infos[:xorg][:terms]=terms.deep_merge(infos[:xorg][:terms]||{})
				add_to_key(:xorg, :terms, terms, overwrite: true, deep: true)
				@infos[:xorg]
			end

			def get_font_size(fontname, line_height: 1.2, real_dpi: false)
				# we need to add the fallback keyword otherwise ruby thinks the
				# hash 'fontname' is for the keywords and not an item
				props=font(fontname, fallback: true)
				size=props[:size]||12
				# the font size depends on the screen dpi, not the real dpi
				dpi=dig(:xorg,:Xft,:dpi) || real_dpi ? get_real_dpi : get_screen_dpi
				#there are 72 points  in one inch
				pixelsize=size*dpi/72.0
				#this is just a heuristic, it is hard to compute the real line
				#height of a font
				font_line_height=props[:line_height] || line_height
				(pixelsize*font_line_height).round
			end

			# fit: how many terminals we want to fit vertically
			def get_terminal_height(termname, fit: 1)
				font=terminal_font(termname)
				size=get_font_size(font)
				_width, termsize=window_size(n_y: fit)
				termsize=yield termsize if block_given?
				(termsize/size).floor
			end

			def xsettings(more_settings={})
				xsettings=dig(:xorg, :xsettings, default: {}).dup
				xsettings[:Gtk_FontName] || xsettings[:Gtk_FontName]=self.font(:gtk, type: :gtk)
				# Note: Gtk/MonospaceFontName is not really used, cf https://bugs.launchpad.net/ubuntu/+source/terminator/+bug/1769774
				# that's why I put it in the gsettings also
				xsettings[:Gtk_MonospaceFontName] || xsettings[:Gtk_MonospaceFontName]=self.font(:vte, type: :gtk)
				#soft merge Xft into xsettings
				unless infos[:xorg][:Xft].nil?
					%i(dpi antialias hinting hintstyle rgba).each do |i|
						key=case i
							when :dpi; "DPI"
							when :antialias; "Antialias"
							when :hinting; "Hinting"
							when :hintstyle; "HintStyle"
							when :rgba; "RGBA"
						end
						value=infos[:xorg][:Xft][i]
						# boolean Xft_* xsettings value are -1, 0 or 1
						value=1 if value==true
						value=0 if value==false
						value=-1 if value.nil? && key=="DPI"
						value and xsettings[:"Xft_#{key}"]||=value
					end
				end
				xsettings.merge(more_settings)
				xsettings
			end

			#gtk-settings are of the form gtk-font-name
			#xsettings registry of the form Gtk/FontName
			#and my :xsettings of the form Gtk_FontName
			def gtk_settings(more_settings={})
				gtksettings={}
				xsettings.each do |key, value|
					if key.match(/^Xft_/)
						key="gtk-#{key.to_s.tr('_','-').downcase}"
					else
						# Prevent 'unkown key gtk-monospace-font-name', cf also the
						# bugreport above
						next if key == :Gtk_MonospaceFontName
						key=key.to_s.sub(/^Net_/,'Gtk')
						key=Utils.to_snake_case(key).tr('_','-')
					end
					gtksettings[key]=value
				end
				gtksettings.merge!(dig(:xorg,:gtksettings, default: {}))
				gtksettings.merge!(more_settings)
				gtksettings
			end

			# in key, we split the schema via '::'
			def xfce_settings(more_settings={})
				prog="xfconf-query"
				xfconf=lambda do  |key,value|
					schema,key=key.split('::',2)
					array=value.is_a?(Array)
					types=[*value].map do |v|
						case v
							when TrueClass, FalseClass; "bool"
							when String; "string"
							when Integer,Fixnum,Float; "int"
						end
					end
					value.nil? ? "" : ([prog, '-n', '-c', schema, '-p', key] +
						types.map {|t| ['-t', t]}.flatten +
						[*value].map {|v| ["-s#{array ? 'a' : ''}", v]}.flatten).shelljoin+"\n"
				end
				r=""
				dig(:xorg, :xfce_settings, default: {}).merge(more_settings).each do |key, value|
					r << xfconf.(key,value) unless value.nil?
				end
				xsettings.each do |key,value|
					key="xsettings::/#{key.to_s.sub('_','/')}"
					# note: xfce-xsettings, by default use -1 for the dpi =>
					# autodetect the resolution in xsettings
					# if we set the dpi, don't mulitply by 1024, this is done by
					# xfce-xsettings!
					r << xfconf.(key,value) unless value.nil?
				end
				# Note: the LastCustomDPI is set in Xfce/LastCustomDPI"
				{ progname: prog, conf: xfconf, settings: r }
			end

			def gnome_settings(more_settings={})
				prog="gsettings"
				gconf=lambda do  |key,value|
					schema,key=key.split('::',2)
					value.nil? ? "" : [prog, 'set', schema, key, value].shelljoin+"\n"
				end
				r=""
				dig(:xorg, :gnome_settings, default: {}).merge(more_settings).each do |key, value|
					r << gconf.(key,value) unless value.nil?
				end
				# cf doc/logiciels/fonts/settings
				xsettings.each do |key, value|
					gkey=case key.to_s
						when "Net_DoubleClickTime"
							"org.gnome.settings-daemon.peripherals.mouse::double-click"
						when "Net_DndDragThreshold"
							"org.gnome.settings-daemon.peripherals.mouse::drag-threshold"
						when "Gtk_ShellShowsDesktop"
							"org.gnome.desktop.background::show-desktop-icons"
						when "Gtk_ColorPalette"
							"org.gnome.desktop.interface::gtk-color-palette"
						when "Gtk_FontName"
							"org.gnome.desktop.interface::font-name"
						when "Gtk_MonospaceFontName"
							"org.gnome.desktop.interface::monospace-font-name"
						when "Net_CursorBlink"
							"org.gnome.desktop.interface::cursor-blink"
						when "Net_CursorBlinkTime"
							"org.gnome.desktop.interface::cursor-blink-time"
						when "Gtk_CursorBlinkTimeout"
							"org.gnome.desktop.interface::cursor-blink-timeout"
						when "Net_ThemeName"
							"org.gnome.desktop.interface::gtk-theme"
						when "Gtk_IMModule"
							"org.gnome.desktop.interface::gtk-im-module"
						when "Net_IconTheme"
							"org.gnome.desktop.interface::icon-theme"
						when "Gtk_CursorTheme"
							"org.gnome.desktop.interface::cursor-theme"
						when "Gtk_EnablePrimaryPaste"
							"org.gnome.desktop.interface::gtk-enable-primary-paste"
						when "Net_SoundThemeName"
							"org.gnome.desktop.sound::theme-name"
						when "Net_EnableEventSounds"
							"org.gnome.desktop.sound::event-sounds"
						when "Net_EnableInputFeedbackSounds"
							"org.gnome.desktop.sound::input-feedback-sounds"
						when "Gtk_RecentFilesMaxAge"
							"org.gnome.desktop.privacy::recent-files-max-age"
						when "Gtk_RecentFilesEnabled"
							"org.gnome.desktop.privacy::remember-recent-files"
						when "Gtk_DecorationLayout"
							"org.gnome.desktop.wm.preferences::button-layout"
						when "Gtk_TitlebarDoubleClick"
							"org.gnome.desktop.wm.preferences::action-double-click-titlebar"
						when "Gtk_TitlebarMiddleClick"
							"org.gnome.desktop.wm.preferences::action-middle-click-titlebar"
						when "Gtk_TitlebarRightClick"
							"org.gnome.desktop.wm.preferences::action-right-click-titlebar"
						when "Gtk_KeynavUseCaret"
							"org.gnome.desktop.a11y::always-show-text-caret"
						when "Gtk_CursorThemeSize"
							"org.gnome.desktop.desktop.interface::cursor-size"
						when "Gtk_CursorThemeName"
							"org.gnome.desktop.desktop.interface::cursor-theme"
						when "Xft_Antialias"
							# none, grayscale, rgba
							if value==0
								value="none"
							elsif xsettings[:Xft_RGBA]=="none"
								value="grayscale"
							elsif value==-1
								value=nil #default
							else
								value="rgba"
							end
							"org.gnome.settings-daemon.plugins.xsettings::antialiasing"
						when "Xft_RGBA"
							value=nil if value=="none"
							"org.gnome.settings-daemon.plugins.xsettings::rgba-order"
						when "Xft_HintStyle"
							if xsettings[:Xft_Hinting]==0
								value="none"
							else
								value=value&.sub(/^hint/,'') #remove the beginning 'hint'
							end
							"org.gnome.settings-daemon.plugins.xsettings::hinting"
						when "Xft_DPI"
							if value and value > 0
								value=(value/96.0).round(2)
								value=1 if 0.9 <= value and value <= 1.1
							else
								value=nil #default
							end
							"org.gnome.desktop.interface::text-scaling-factor"
						else
							next
						end
					r << gconf.(gkey, value) unless gkey.nil? or value.nil?
				end
				{ progname: prog, conf: gconf, settings: r }
			end

			def xresources(more_settings={})
				xres={}
				xres['*.foreground']=dig(:xorg, :colors,:foreground, default: "Black")
				xres['*.background']=dig(:xorg, :colors, :background, default: "#FFFFFFFFDDDD")
				xres['*.cursorColor']=dig(:xorg, :colors,:cursor, default: "Firebrick3")
				dig(:xorg, :colors, :scheme, default: []).each_with_index do |c,i|
					xres["*.color#{i}"]=c
				end
				dig(:xorg, :Xft, default: {}).each do |key,value|
					value=1 if value==true
					value=0 if value==false
					xres["Xft.#{key}"]=value
				end
				# :Xresources has priority
				xres.merge!(dig(:xorg, :Xresources, default: {}))
				xres.merge!(more_settings)
				xres
			end

			# list of fallback terminals symbols or hashes
			# fallback => return default values rather than nil if not found
			def terminal(*terms, fallback: true)
				term=nil
				terms.each do |t|
					case t
					when Hash
						term=t
						break
					else
						term=dig(:xorg, :terms, t) || next
						term[:name]||=t
						break
					end
				end
				if term.nil?
					if fallback
						# bailout if the :default term does not exist;
						# otherwise we get an infinite loop
						return nil if terms==[:default]
						term={}
					else
						return nil
					end
				end
				default=term[:default] || :default
				params= (term[:name] != default) ? self.terminal(default, fallback: true) : {}
				params&.merge(term)
			end

			def terminal_geometry(*terms, position: :none, strut: true)
				xorg=infos[:xorg]; geom=""
				if terms!=[:none]
					term=self.terminal(*terms)
					unless term.nil?
						horiz=term[:horiz] || 80
						vert=term[:vert] || 30
						geom="#{horiz}x#{vert}"
					end
				end
				strutleft=strutright=struttop=strutbottom=0
				if strut
					strutleft=xorg.dig(:strut, :left) || 0
					strutright=xorg.dig(:strut, :right)|| 0
					struttop=xorg.dig(:strut, :top) || 0
					strutbottom=xorg.dig(:strut, :bottom) || 0
				end
				case position
				when :dr
					geom+="-#{strutright}-#{strutbottom}"
				when :dl
					geom+="+#{strutleft}-#{strutbottom}"
				when :ur
					geom+="-#{strutright}+#{struttop}"
				when :ul
					geom+="+#{strutleft}+#{struttop}"
				end
				geom
			end

			# list of fallback fonts symbols or hashes or strings
			def font(*families, type: :hash, fallback: true)
				fonts=dig(:xorg, :fonts, default: {})
				font=nil
				families.each do |family|
					case family
					when Hash
						font=family
						break
					when String
						return family
					else
						font=fonts[family]||next
						font[:name]||=family
						break
					end
				end
				if font.nil?
					if fallback
						return nil if families==[:default]
						font={}
					else
						return nil
					end
				end
				default=font[:default] || :default
				params= (font[:name] != default) ? self.font(default, type: :hash, fallback: true) || {} : {}
				params=params.merge(font||{})
				return nil if params.empty?
				case type
				when :fontconfig, :xft
					%i(default name line_height).each do |i|
						params.delete(i)
					end
					r="#{params.delete(:family)}"
					params.each { |k,v| r+=":#{k}=#{v}" }
					r
				when :gtk
					[params[:family], params[:style], params[:size]].compact.join(' ')
				else
					params
				end
			end

			def terminal_font(term, type: :hash)
				# try to look up the terminal settings, fallback to the font settings (youpilou!)
				fonts=[self.terminal(term, fallback: false)&.fetch(:font), term.is_a?(Symbol) && self.font(term, fallback: false), self.terminal(term, fallback: true)&.fetch(:font), term.is_a?(Symbol) && self.font(term, fallback: true)].compact.flatten
				r=self.font(*fonts, type: type)
				r

			end

			def get_real_dpi(screen=:screen0)
				monitors=dig(:xorg, :xrandr, screen, :monitors)
				if monitors
					_name, monitor=monitors.find {|_k,m| m[:primary] && m[:dpi] } || monitors.find {|_k,m| m[:connected] && m[:dpi]}
					dpi=monitor[:dpi]
				else
					dpi=dig(:xorg, :screens, screen, :dpi)
				end
				dpi && [dpi[:width], dpi[:height]].min or 96
			end

			# fake dpi
			def get_screen_dpi(screen=:screen0)
				dpi=dig(:xorg, :screens, screen, :dpi)
				dpi && [dpi[:width], dpi[:height]].min or 96
			end

		end
		include XorgHelpers #}}}

		# pass nil to get the default
		# pass 'local' to recompute local_infos
		def initialize(name=nil, check: false, local: nil, retrieve_local: true, infos: {})
			self.rel_files=DR::Computers::REL_FILES
			self.infos={}.deep_merge!(infos) #deep copy the infos parameter to encapsulate
			add_infos({options: {check: check, local: local, retrieve_local: retrieve_local}})
			if Computer===name
				add_infos(name.infos)
				# don't compute the same local infos twice
				self.infos[:options][:local]=false if self.infos[:options][:local]==name.infos[:options][:local]
				self.infos[:options][:retrieve_local]=false if self.infos[:options][:retrieve_local]==name.infos[:options][:retrieve_local]
			else
				name="current" if name.nil? #default
				self.infos[:names]||={}
				self.infos[:names][:argument]=name
				get_name_options(name)
				handle_ssh_uri
				coerce_types # if we set options via get_name_options or handle_ssh_uri, we need to convert them to boolean
				if self.name=='local' and self.infos[:options][:local].nil? #use local infos if the option is let as nil
					if self.root.to_s=="/"
						self.infos[:options][:local]=true
					else
						self.infos[:options][:local]=:files
					end
				end
				get_names
				handle_alias
				warn "#{name} not found in Computers list" unless check(name) if check
			end
			# Note: :options/:local is used to know if we call get_local_infos
			# but :local is used to know if we are local. This allows to have
			# local_infos for a 'non local' computer and conversely.
			if self.infos[:options][:local]
				handle_local # this computes local infos and set :local = true
			elsif self.infos[:options][:retrieve_local]
				retrieve_local_infos
			end
			if self.current?
				self.infos[:root]||=Pathname.slash
			end
			set_infos
		end

		private def coerce_types
			infos[:options]&.each {|k,b| self.infos[:options][k]=Bool.to_bool(b, allow_nil: true)}
			infos[:local] && infos[:local]=Bool.to_bool(infos[:local], string_fallback: true)
			if (o=infos[:overwrite])
				o[:local] && o[:local]=Bool.to_bool(o[:local], string_fallback: true)
			end
		end

		#public methods: to_s, ===, in? {{{
		def to_s
			name
		end
		def ===(item)
			case item
			when String
				name==Computer.new(item, retrieve_local: false, local: false).name
			when Computer
				name==item.name
			end
		end
		#find if name is in list
		def in?(list)
			list.any? do |i|
				self.===(i)
			end
		end

		def attributes
			dig(:attributes, merge: true)
		end
		def list
			dig(:list, merge: true)
		end
		# }}}

		# misc private methods {{{

		#ploum,ssh=plam
		private def get_name_options(oname)
			# we need to split on '!' because when using --computers c1,c2; the computers are separated by ','; and ':' is taken for the port
			name, options=SimpleParser.parse_name_options(oname, arg_split:'!', valuesep: '=')
			# Splitting "" gives [], but we still want name to be empty and not nil
			name=oname if name.nil?
			if (ssh=options[:ssh]) and ssh.is_a?(String)
				options.set_key(:ssh, parse_ssh_uri(ssh))
			end
			infos.deep_merge!(options)
			self.name=name
		end

		# We can parse a ssh://ploum@plam:port/root url or a
		# ploum@plam:root ssh like path.
		# When specified as a name, this will set the name and the root of the
		# computer, (+ user/username).
		# When specified as name!ssh=ssh_url then this only set :ssh
		# Note: ssh/host default to name.downcase (for ssh/config),
		#       user/hostname default to name
		#       syst/hostname to the real hostname of the computer (via local_infos)
		private def handle_ssh_uri
			begin
				r=parse_ssh_uri(self.name)
				#here we don't set ssh/host, so that if the name is local/current,
				#the ssh host gets updated accordingly
				host=r.delete(:host)
				path=r.delete(:path) #the path is used for :root
				add_infos({ssh: r})
				add_key(:user, :username, r[:user]) if r[:user]
				self.name=host
				infos[:root]=path unless path.empty?
			rescue URI::InvalidComponentError => e
				warn "Error in uri parsing: #{e}"
			end
		end

		private def parse_ssh_uri(uri)
			require 'dr/base/uri'
			u=URI::Ssh.parse(uri)
			r={}
			user=u.user and r[:user]=user
			host=u.host and r[:host]=host
			port=u.port and r[:port]=port
			path=u.path and r[:path]=path
			query=u.query
			if query
				options=SimpleParser.parse_options(query, arg_split:'&',valuesep:'=')
				r[:options]=options
			end
			r
		end

		def self.get_current_name
			name = ENV['MYHOSTNAME']
			local_type = ENV['MYHOSTTYPE']
			f=Pathname.new("#{ENV['HOME']}/.initvars")
			unless (name and local_type) or !f.exist?
				vars=f.read
				vars.match(/^MYHOSTNAME=(.+)$/) { |m| name||=m[1] }
				vars.match(/^MYHOSTTYPE=(.+)$/) { |m| local_type||=m[1] }
			end
			# note: bash defines 'HOSTNAME' while zsh defines 'HOST'
			name ||= ENV['HOST'] || ENV['HOSTNAME']
			unless name
				name=SH::Run.run_simple("hostname", fail_mode: :nil, quiet: true, chomp: true) 
				name=nil if name&.empty?
			end
			unless name
				host=Pathname.new("/etc/hostname")
				host.readable? and name=host.read.chomp
			end
			return name, local_type
		end

		private def get_names
			name=self.name
			names=infos[:names]||{}
			names[:init_name]=name
			name="current" if name=="local"
			if name == "current"
				name, local_type = self.class.get_current_name
				name && names[:local_name]=name
				local_type && names[:local_type]=local_type
			end
			name=Computers.normalize(name)
			names[:orig_name]=name
			infos[:names]=names
			self.name=name
			#names may contains
			#-argument: the initial argument
			#-init_name: the name after option parsing
			#-local_name,local_type: from ENV or .initvars
			#-orig_name: name after canonicalisation
			#-alias_name: name we are based off in case of alias
			#-name: either orig_name or alias_name depending on the alias setting
			#ex: oimb -> :init_name=>"oimb", :orig_name=>"oimb", :name=>"oimb", :alias_name=>"imb"
			#  numenorfree -> :init_name=>"numenorfree", :orig_name=>"numenorfree", :name=>"numenor", :alias_name=>"numenor"
			#  local -> :init_name=>"local", :local_name=>"imb", :local_type=>"imb", :orig_name=>"imb", :name=>"imb"
		end

		#Ex: "Baggins32" => [ "Baggins", "name", {:syst => {:arch => 'i686'}} ],
		#  'name': use the new name for Computer.name
		#  'ssh': use the new name for ssh
		private def handle_alias
			if Computers::Alias.keys.include?(name)
				r=Computers::Alias[name]
				case r
				when String
					alias_name=r
					alias_mode=nil
					extra_infos={}
				when Array
					alias_name,alias_mode,extra_infos=r
				end
				add_infos(extra_infos) unless extra_infos.nil?
				infos[:names][:alias_name]=alias_name
				add_infos(Computer.new(alias_name).infos)
				infos.deep_merge!({ :ssh => {host: name, :hostu => name }}) if alias_mode=~/ssh/
				self.name=infos[:names][:alias_name] unless alias_mode=~/name/
			end
		end
		private def handle_local(local: dig(:options, :local, default: true))
			infos.deep_merge!({local_infos: get_local_infos(local: local)})
			infos.key?(:local) || infos[:local]=local
		end
		#this is the public name
		def refresh_local(local: dig(:options, :local, default: true))
			handle_local(local: local)
		end
		#}}}

		#informations on computers {{{
		#   initialize:
		#-> start with the :infos parameter given to Computer.new
		#-> parse name to get eventual extra infos (cf get_name_options and handle_ssh_uri)
		#-> overwrite infos[:local_infos] with Computer.local_infos if local (cf handle_local) or from the database if retrieve_local (cf retrieve_local_infos)
		#-> set_infos
		#   set_infos:
		#-> add init infos
		# [-> overwrite infos with infos[:local_infos]]
		#-> configure infos[:list] and infos[:attributes]
		#-> add static informations
		#-> add/overwrite with custom infos (like font and terminal size)
		#-> add complete infos (like setting sshu to ssh)
		#-> overwrite infos with infos[:overwrite]
		private def set_infos
			add_infos(init_infos)
			# infos.deep_merge!(infos[:local_infos]) #merge (eventual) local infos
			configure_list
			configure_attributes #set up extra attributes
			init_network
			add_infos(get_static_infos)
			set_custom_infos
			complete_infos
			infos.deep_merge!(infos[:overwrite])
			# readd init_infos so that the keys are in the correct order.
			add_infos(init_infos)
		end

		private def init_infos
			{
				:name => nil,
				:names => {},
				:options => {},
				:root => nil,
				:list => [],
				:attributes=> {},
				:ssh => {}, :unison => {}, :files => {},
				:user => {}, :xorg=>{}, :syst => {},
			}
		end

		private def configure_list
			Computers::List.each do |k,w|
				infos[:list] << k if w.include?(name)
			end
		end

		private def configure_attributes
			infos[:attributes]=get_attributes(name, Computers::Attributes).deep_merge(infos[:attributes], append: true)

			infos[:user][:type]||=infos[:attributes][:user_type]&.first
			infos[:syst][:type]||=infos[:attributes][:syst_type]&.first
			infos[:unison][:type]||=infos[:attributes][:unison_type]&.first
			infos[:user][:hosttype]||=infos[:attributes][:user_hosttype]&.first&.to_s

			case name
			when /^arch_?virtual/
				add_attribute(:syst_types, :archvirtual)
			when /^arch_?(container|img|image)/
				add_attribute(:syst_types, :archcontainer)
			when /^virtual/
				add_attribute(:syst_types, :virtual)
			when /^(image|img|container)/
				add_attribute(:syst_types, :container)
			end

			types=%i(client server virtual container)
			if any_attribute?(:syst_types,types.map {|i| :"arch#{i}"})
				add_attribute(:syst_types, :admin)
				add_attribute(:distribution, :archlinux)
			end
			types.each do |i|
				add_attribute(:syst_types, i) if attribute?(:syst_types, :"arch#{i}")
			end

			if any_attribute?(:syst_types,%i(client server virtual)) and attribute?(:syst_types, :admin)
				add_attribute(:syst_types, :boot) #we are booting
				add_attribute(:syst_types, :wheel) #we configure the wheel group
				# add_attribute(:syst_types, :pacman) #we install from the computer rather than pacstrap
			end

			if any_attribute?(:syst_types,%i(client server)) and attribute?(:syst_types, :admin)
				add_attribute(:syst_types, :pacman) #we don't install from pacstrap
				add_attribute(:syst_types, :ssh) #we want ssh
				add_attribute(:syst_types, :shell) #we want minimal packages like zsh/vim
				add_attribute(:syst_types, :dns) #we want an unbound conf
			end
		end

		#set_infos calls add_infos(get_static_infos)
		private def get_static_infos #(config based on type) {{{
			infos=init_infos

			#infos.set_key(:ssh,:host, name.downcase)

			if attribute?(:user_session)
				infos.deep_merge!({
					:user => {
						:hostname => name,
					},
					Fileskey => {
						:logdir => Pathname.new("var/log"),
					}
				})
				infos[:user][:hosttype]||="none"
			end

			if attribute?(:user_sudo)
				infos.deep_merge!({
					:user => {:sudo => 'sudo'},
				})
			end
			if attribute?(:hardware,:laptop)
				# note: [:syst][:laptop] is also autodetected from hostnamectl
				# chassis, while the laptop attribute is static
				infos.deep_merge!({
					:syst => {
						:laptop => true,
					}})
			end
			if attribute?(:location,:imb)
				infos.deep_merge!({
					:user => {
						:printer => true,
					}})
			end

			if attribute?(:user_session,:xorg)
				infos.deep_merge!({
					:xorg => {
						:terms => {
							:default => { :horiz => 80, :font => :vt},
							:vt => { :horiz => 80, :font => :vt},
							:vte => { :horiz => 80, :font => :vte},
							:small_vt => { :horiz => 80, :font => :small_vt},
						},
						:fonts => { :default => { family: 'Sans' }},
						:dm => 'xfce', :xaudio => 'pulse', #xaudio is for mpd,
						:Xft => { :antialias => true, :rgba => 'rgb', :hinting => true, :hintstyle => 'hintslight', :lcdfilter => 'lcddefault'}, #used for fontconfig; rgba: rgb, bgr, vrgb, vbgr
						:xsettings => { :Net_CursorBlink => false, :Net_ThemeName => "Adwaita", :Net_IconThemeName => "Adwaita"},
						:gtksettings => {"gtk-enable-primary-paste" => true},
						:colors => { :foreground => "#000000000000", :background => "#FFFFFFFFDDDD",
						:cursor => "#CDCD26262626", :scheme => %w(#2E2E34343636 #CCCC00000000 #4E4E9A9A0606 #C4C4A0A00000 #34346565A4A4 #757550507B7B #060698209A9A #D3D3D7D7CFCF #555557575353 #EFEF29292929 #8A8AE2E23434 #FCFCE9E94F4F #72729F9FCFCF #ADAD7F7FA8A8 #3434E2E2E2E2 #EEEEEEEEECEC)} #the colors are from the tango theme of gnome-terminal; previously the background was lemon-chiffon
						# foreground is "Black", cursor is "Firebrick3"
						# Note that the cursor color is also hardcoded in vim and zsh; where I use DarkOrange3 in insertion mode
						#tango theme: https://gist.github.com/evaryont/4478505
						# :blue: "#3465A4"
						# :cyan: "#06989A"
						# :green: "#4E9A06"
						# :bright_red: "#EF2929"
						# :bright_yellow: "#FCE94F"
						# :bright_purple: "#AD7FA8"
						# :bright_white: "#EEEEEC"
						# :red: "#CC0000"
						# :yellow: "#C4A000"
						# :purple: "#75507B"
						# :bright_black: "#555753"
						# :bright_green: "#8AE234"
						# :white: "#D3D7CF"
						# :bright_cyan: "#34E2E2"
						# :black: "#2E3436"
						# :bright_blue: "#729FCF"
						# :foreground: "#FFFFDD"
						# :background: "#000000"
				}})

				#xdg autostart overrides
				infos.deep_merge!({
					:user => {
						:xdg_autostart => {
							'clipit-startup' => false, #not installed anymore
							'xfce4-clipman-plugin-autostart' => true,
							'light-locker' => false, #bugs out with fvwm
							'nm-applet' => false, #I use wpa_supplicant directly
							'tracker-store' => false,
							#'tracker_store' => false,
							'tracker-extract' => false,
							'tracker-miner-fs' => false,
							'tracker-miner-rsss' => false,
							  #Not really necessary since on archlinux tracker only
							  #contains tracker-store which do not mine;
							  #the miners are split in tracker-miners, cf
							  #https://gist.github.com/vancluever/d34b41eb77e6d077887c
							'baloo_file' => false, #kde's tracker
							'pulseaudio' => true, #this just launches start-pulseaudio-x11 which was launched by xinitrc before but is now an autostart desktop file
							'print-applet' => false, #started as a user service, otherwise it stays active and prevent sessions from closing
						}
					}})

				infos[:user][:xdg_autostart]['print-applet']=false unless infos[:user][:printer]
			end

			#syst:
			#:type, packages: pour packages.rb,
			#:laptop pour powersave.rb, network.rb, logind et packages.rb
			#:arch pour makepkg.conf, pacman.conf, mirrorlist
			#:mkinitcpio* pour mkinitcpio
			#:lang:  pour bootloader.rb et locale.gen
			#:bootloader: pour bootloader.rb
			#:boot: utilisé par init.rb pour savoir si on installe le bootloader/mkinitcpio...
			_mkinitcpio_hooks_legacy=%w(base udev autodetect modconf block resume filesystems keyboard fsck keymap consolefont)
			mkinitcpio_hooks_bare=%w(systemd autodetect modconf block filesystems fsck)
			mkinitcpio_hooks_std=%w(base)+mkinitcpio_hooks_bare+%w(keyboard sd-vconsole)
			if attribute?(:syst_types,:admin)
				services=%w(sshd.socket)
				## I prefer to add it on a case by case basis
				# pkgs=Packages::Syst.new(@computer).pkgs_list[:arch_abs]
				# services<< "lightdm.service" if pkgs.find {|p| p =~ /^lightdm/}
				services << "lightdm.service" if attribute?(:user_session,:xorg)
				## Done in complete_info so that net_wlan is available
				## services << "wpa_supplicant@#{infos[:syst][:net_wlan].first}.service" unless infos[:syst][:net_wlan].nil? or infos[:syst][:net_wlan].empty?
				services +=%w(power-save.service power-performance.service) if laptop? #attribute?(:hardware,:laptop)
				#run cups even if infos[:user][:printer] is false since this is just a socket
				services+=%w(avahi-daemon.socket org.cups.cupsd.socket)
				services+=%w(unbound.service) if attribute?(:syst_types, :archclient)

				if (net=local_network)
					if (tinc=net.get_services(:tinc))
						services += tinc.each_key.map {|k| "tinc@#{k}.service"}
					end
					if (_zt=net.get_services(:zerotier))
						services << "zerotier-one.service"
					end
				end

				add_to_key(:syst,:services,services)

				if attribute?(:syst_types, :boot)
					infos.deep_merge!({
						:syst => { :boot => :uefi, :bootloader => 'systemd-boot', }
						})
				end

				if attribute?(:syst_types,:client)
					infos.deep_merge!({
						:syst => {
							:lang => "fr",
						}
						})
				end

				if attribute?(:distribution,:archlinux)
					infos[:syst][:mkinitcpio_modules] = []
					infos[:syst][:mkinitcpio_hooks] = []
					mkinitcpio=if attribute?(:syst_types,:client)
						mkinitcpio_hooks_std
					elsif any_attribute?(:syst_types,%i(server virtual))
						mkinitcpio_hooks_bare
					else
						[]
					end
					infos.add_to_key(:syst, :mkinitcpio_hooks, mkinitcpio)
				end
			end

			#filepaths
			rel_files.each do |symb,value|
				infos[Fileskey][symb]||=value
			end

			return infos
		end #}}}

		private def set_custom_infos #{{{ (Custom configs)

			set_layout if attribute?(:user_session,:xorg) #fallback

			case name
			when "Feanor"
				set_dpi(96)
				set_layout(fontsize: 13, mono: 15.5, vert: 46, gvert: 44)
				infos[:syst][:video]||=""
				infos[:syst][:video]+="| Intel | Nvidia" #the graphic cards bugs out so I hardcode them
				add_to_key(:syst, :bootoptions, {rootflags: %w(compress=zstd noatime autodefrag)}, deep: true)
				add_to_key(:user, :startup, %w(firefox deluge))
			when "old_Feanor"
				infos[:syst][:bootoptions]={root: 'PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7"', rootflags:%w(compress=zstd noatime autodefrag)}
			when "Mithrim"
				set_dpi(96)
				set_layout(vert: 50, gvert: 48, fontsize: 13.5)
				# we autodetect dpi, but at .xprofile launch our monitor is not yet
				# primary, so it uses the laptop screen dpi setting
				add_to_key(:syst,:services, "port_forward.service")
				infos[:syst][:bootoptions]={root: 'PARTUUID="986178da-85b0-4a7c-a0ec-600adfa32be7"', rootflags:%w(compress=zstd noatime autodefrag)}
			when "Doriath"
				# set_terminals_and_fonts(vert: 44, font: 10, gtkfont: 10)
				infos.deep_merge!({
					:xorg => {
						:strut => {:top => 40},
					},
					:syst => {
						:bootoptions => {root: 'PARTLABEL=slash', rootflags:%w(compress=zstd noatime subvol=slash)},
					}
				})
				#TODO: remove when xfce bug fixed
				set_dpi #set :Xft/dpi to get_real_dpi
				set_layout(fontsize: 9, mono: 10, vert: 40, gvert: 38)
			when "Valinor"
				set_layout(vert: 44, gvert: 42, fontsize: 14)
				infos.deep_merge!({
					:syst => {
						:boot => :bios, :bootloader => 'grub',
						:bootoptions => {linux_options: ['resume=dev/sda5']},
					},
				})
			when "Numenor"
				set_layout(vert: 31, gvert: 30)
				infos.deep_merge!({
					:syst => {
						:boot => :bios, :bootloader => 'grub-bios',
						:bootoptions => {linux_options: %w(resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1 nomodeset)},
					},
				})
			when "Gondolin"
				set_layout(vert: 38, fontsize: 13)
				infos.deep_merge!({
					:syst => {
						:boot => :bios, :bootloader => 'grub',
						:bootoptions => {linux_options: %w(resume=/dev/mapper/MainGroup-swap lvmwait=/dev/sda1 nomodeset)},
					},
					:xorg => {
						:xaudio => 'alsa', :dm => 'fvwm'
					},
				})
			when "Durin"
				set_layout(vert: 34, fontsize: 18)
				infos.deep_merge!({
					:syst => {
						:boot => :bios, :bootloader => 'custom',
						:services => [nil, "serial-getty@ttyAMA0.service", "rngd.service"],
						:vconsole => {:font => "ter-132b"},
					},
					#:unison => { :binpath => "/usr/local/bin/unison" },
					:xorg => {
						:xaudio => 'alsa', :dm => 'fvwm'
					},
				})
			when "Baggins"
				set_layout(vert: 50, gvert: 49, fontsize: 15)
				infos.deep_merge!({
					:syst => {
						:bootloader => ['systemd-boot','syslinux']
					},
				})
			when "FleurBleue"
				set_layout(vert: 39, gvert: 38, fontsize: 15)

			when "usb_backup" #for unison synchronisation with usb key
				infos.deep_merge!({
					:unison => {
						:local => true,
						:unisonpath => ("media/usbinria/home/dams").to_s,
						:types => {full: %i(usb_backup)}}
				})
			when "unison_backup"
				infos.deep_merge!({
					:ssh => {:hostu => 'imbu'},
					:unison => {
						:unisonpath => "var/backups/unison",
					}
				})

			when "imb"
				set_layout(vert: 49, gvert: 48, fontsize: 14)
				infos.deep_merge!({
					:ssh => { :hostu => 'imbu' },
					:user => {
						:startup => %w(mpd)
					},
					:xorg => {
						:Xresources => {"*customization" => ""},
					}, #:dm => 'mate', 
				})
			when "cremi"
				set_layout(vert: 54, gvert: 55, fontsize: 13, mono: 16)
			when "phare"
				infos.deep_merge!({
					:ssh => { :hostu => 'phare2' },
					:unison => {:types => {:full => [ :minimal, :phare ]}},
				})
			when "4a"
				infos.deep_merge!({ 
					:ssh => { :hostu => '4a2' },
				})
			end

		end #}}}

		private def complete_infos # (Extra config based on the info we have now) {{{
			add_key(:user,:hosttype, infos[:names][:local_type])
			add_key(Fileskey, :homepath, Pathname.home) if current?
			infos[Fileskey][:homepath]&&=Pathname.new(infos[Fileskey][:homepath])

			#absolute filepaths
			if (homepath=file(:homepath))
				files={}
				self.files.each do |symb, value|
					symb.to_s.match(/^rel_(.*)/) do |m|
						files[m[1].to_sym]=homepath+value
					end
				end
				add_infos({
					Fileskey=>files
				})
			end

			#config based on cpu and video
			infos[:syst][:videos]||=[]
			infos[:syst][:videos] << :Intel if dig(:syst,:video)=~/\bIntel\b/
			infos[:syst][:videos] << :Nvidia if dig(:syst,:video)=~/\bNvidia\b/i
			infos[:syst][:videos] << :Radeon if dig(:syst,:video)=~/\bRadeon\b/

			modules={:Intel => ["i915"], :Nvidia=>["nouveau"], :Radeon=>["radeon"]}
			dig(:syst, :videos, default: []).each do |vid|
				add_to_key(:syst, :mkinitcpio_modules, modules[vid])
			end

			add_key(:syst,:hostname, name&.downcase)
			add_to_key(:syst, :machine_info, {pretty_hostname: name}, deep: false)
			add_to_key(:syst, :locale_info, {lang: "en_US.UTF-8"}, deep: false)

			if (layout=dig(:syst,:localectl,"X11 Layout"))
				model=dig(:syst,:localectl,"X11 Model")
				layout="#{layout}(#{model})" if model
				add_key(:syst, :xkbmap, layout)
			end

			if dig(:syst, :lang)=="fr"
				add_key(:syst, :timezone, "Europe/Paris")
				add_key(:syst, :xkbmap, "fr(oss)")
				add_to_key(:syst, :vconsole, {keymap: "fr-latin1", font: "lat1-16"}, deep: false)
			end

			if dig(:syst,:hostnamectl,"Chassis")=="laptop"
				add_key(:syst, :laptop, true)
			end

			if !infos[:unison].empty?
				add_key(:sync,"unison")
				if infos[:list].include?(:unison_relative_path) or dig(:ssh,:hostu)=="imbu"
					add_key(:unison, :binpath, (file(:homepath, fallback: :empty)) + "bin/unison")
				end
			else
				add_key(:sync,"rsync")
			end

			if attribute?(:syst_types,:admin) and attribute?(:distribution,:archlinux)
				if (wlan=dig(:syst,:net_wlan)&.first)
					#add_to_key(:syst,:services, "wpa_supplicant@#{wlan}.service")
					#add_to_key(:syst,:services, "iwd.service")
					add_to_key(:syst,:services, ":wpa@#{wlan}.service")
				end

				if dig(:syst,:modules)&.include?("bcache")
					add_to_key(:syst,:mkinitcpio_modules, "bcache")
					infos[:syst][:mkinitcpio_hooks].insert(infos[:syst][:mkinitcpio_hooks].index("filesystems"), "bcache")
				end
				if dig(:syst,:modules)&.include?("lvm")
					add_to_key(:syst,:mkinitcpio_hooks,"sd-lvm2")
				end
			end

			infos[:syst][:services]=dig(:syst, :services)&.compact&.uniq

			unless infos[:xorg].empty?
				gtkfont=self.font(:gtk, type: :gtk)
				unless gtkfont.nil? or gtkfont =="Sans 10" #Sans 10 is the default
					add_to_key(:xorg, :xsettings, { :Gtk_FontName => gtkfont}, deep: false)
				end
			end
		end #}}}
	# }}}
	end #}}}
end

if __FILE__ == $0 #{{{
	require 'optparse'
	opts={:local => nil, :check => false, :export => false, :list => false, :save => false, :show_dump_file => false }
	optparse = OptionParser.new do |opt|
		opt.banner= "#{File.basename($0)} [options] computers"
		opt.on("-l", "--[no-]list", "List computers") do |v|
			opts[:list]=v
		end
		opt.on("-c", "--[no-]check", "Check", "Check if computers is in List") do |v|
			opts[:check]=v
		end
		opt.on("--[no-]local", "Local Infos", "Gather local informations") do |v|
			opts[:local]=v
		end
		opt.on("--[no-]pretty","=[color]", "Pretty Print") do |v|
			opts[:pretty]=v
		end
		opt.on("--export=[value]", "Export") do |v|
			opts[:export]= if v; v else opts[:list] ? "//" : "COMPUTER:/" end
		end
		opt.on("--[no-]save[=files/user]","Save", "Save local infos", "If mode is not specified do full save. Other modes: files, user") do |v|
			opts[:local]=v if v #force local to be true
			opts[:save]=v
		end
		opt.on("--[no-]show-save[=files/user]","Show saved infos", "Show what would be saved with --save", "If mode is not specified show a full save") do |v|
			opts[:local]=v if v #force local to be true
			opts[:show_save]=v
		end
		opt.on("--[no-]show-dump-file[=date]","Show", "Show stored local infos. If 'date' only show the date the info was saved") do |v|
			opts[:show_dump_file]=v
		end
		opt.on("--ssh","ssh", "Connect to computer") do |v|
			opts[:ssh]=v
		end
	end
	optparse.parse!

	if opts[:show_dump_file]
		stored_infos=DR::Computers.get_dumpfile || {}
		if opts[:show_dump_file] == "date"
			stored_infos.each do |k,v|
				date=v.dig(:save_date) || v.dig(:syst,:timedatectl, "Local time")
				puts "- #{k}: #{date}"
			end
		else
			p stored_infos.keys
			DR::Utils.pretty_print(stored_infos,pretty: opts[:pretty])
		end
	elsif opts[:list]
		#computers=DR::Computers::List
		computers=DR::Computers.list
		if opts[:export]
				puts SH::Export.export_parse(computers,opts[:export])
		else
			DR::Utils.pretty_print(computers,pretty: opts[:pretty])
		end
	elsif opts[:ssh]
		comp, *args = ARGV
		comp=DR::Computer.new(comp)
		if opts[:export]
			puts SH::Export.export_variables(comp.ssh(*args, mode: :export))
		else
			comp.ssh(*args)
		end
	else
		computers=DR::Computers.computers(*ARGV, default: 'local', :local => opts[:local], :check => opts[:check])
		computers.each do |comp|
			if (mode=opts[:show_save])
				infos=comp.get_local_infos(local: mode.is_a?(String) ? mode.to_sym : mode)
				DR::Utils.pretty_print(infos, pretty: opts[:pretty])
			elsif (mode=opts[:save])
				comp.save_local_infos(mode.is_a?(String) ? mode.to_sym : mode)
			end
			if !opts[:show_save]
				infos=comp.infos
				if opts[:export]
					infos.deep_merge!(infos[:local_infos]) # we cannot rely on 'dig' here
					puts SH::Export.export_parse(infos,opts[:export])
				else
					DR::Utils.pretty_print(infos,pretty: opts[:pretty])
				end
			end
		end
	end
end
#}}}
