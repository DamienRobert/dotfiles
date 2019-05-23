#!/usr/bin/env ruby
require 'dr/config/unison_generic'

#$VERBOSE=2 #warnings

module DR
	class Unison < UnisonGeneric
		#return should be ["config_string", *config_files]
		def custom_config(type)
			case type
			when :common,:minimal,:sh,:usb_backup
				["",@unisonfiles+"ignore-common"]
			when :deploy
				["follow = Name deploy/*\n"]
			when :perso2
				["follow = Name data/.XXX/*\n"]
			else
				super
			end
		end

		def types_from_expand_type(type)
			case type.to_s
			when 'sh'
				{:full => [ :sh ]}
			when 'devel'
				{:full => [ :devel, :sh ], :init => :sh}
			when 'minimal'
				{:full => [ :minimal ]}
			when 'light'
				{:full => [ :common ]}
			when 'standard'
				{:full => [ :common, :data ]}
			when 'full'
				{:full => [ :common, :data, :booklight ],
				 :extra => [ :large, :backup] }
			else
				super
			end
		end

		def alias_hash(*comps)
			h={}
			comps.each do |comp|
				case comp.to_s
				when "imb","oimb"
					h["//bureau.math.u-bordeaux1.fr//home/imb/drobert"]=
						%w(acces servisu bureau fuji33).map do |n|
							["#{n}.math.u-bordeaux1.fr",n]
						end.flatten.map do |n|
							"//#{n}//home/imb/damienrobert"
						end
				when "unison_backup"
					h["//acces.math.u-bordeaux1.fr//scratch/imb/damienrobert/unison"]=
						%w(acces servisu bureau fuji33).map do |n|
							["#{n}.math.u-bordeaux1.fr",n]
						end.flatten.map do |n|
							"//#{n}//scratch/imb/damienrobert/unison"
						end
				when "plafrim"
					h["//devel12//home/drobert"]=
						%w(devel11 devel13).map {|x| "//#{x}//home/drobert"}
				when "Feanor"
					h["//Feanor//home/dams"]=["//feanor//home/dams"]
				when "Valinor"
					h["//Valinor//home/dams"]=["//valinor//home/dams"]
				when "Numenor"
					h["//Numenor//home/dams"]=["//numenor//home/dams"]
				when "FleurBleue"
					h["//FleurBleue//home/dams"]=["//fleurbleue//home/dams"]
				when "mithrim"
					h["//FleurBleue//home/dams"]=["//mithrim//home/dams/media/0b20faec-249c-4e3f-a436-8a47bc6ad0c5"]
				when "bbq"
					h["//barbecue//home/robert"]=["//barbecue//localdisk/home/robert"]
				when "4a"
					h["//quatramaran.ens.fr//home/robert"]=["//quatramaran.salle-s.org//home/robert"]
				#when "usb"
				#	h["//numenor//run/media/dams/usbkey/dams/unison"]=["/run/media/dams/usbkey/home/dams"]
				end
			end
			return h
		end

		class SSH < UnisonGeneric::SSH
			def self.default_opts
				super.merge({ssh: 'ssh2 -Y --batch'})
			end

			def remote_unison
				script=Pathname.new("mine/script/unison.rb")
				"#{@ssh_client.file(:rel_initenv)} #{script}"
			end
		end

		class Sync < UnisonGeneric::Sync
			def self.ssh
				SSH
			end
			# def self.default_opts
			# 	super.merge({default_server: "imb"})
			# end
			def self.sync_mode_opts(mode)
				opts=super
				case mode
				when nil, false #do nothing
				when "backup"
					opts[:server]="unison_backup"
					opts[:push]=true
					opts[:merge]=false
					opts[:unison]||=[]
					opts[:unison]+=['-silent', '-copyonconflict'] #, '-repeat=watch']
					#unison (copy: conflict on 2016-05-03).rb
					#-> find . -name '*conflict on*'
				when "perso"
					opts[:server]="Feanor"
					opts[:type]=%w(perso)
				when "perso2"
					opts[:server]="Feanor"
					opts[:type]=%w(perso2)
				when "photos"
					opts[:server]="oimb"
					opts[:type]=%w(perso)
				else
					opts[:default_server]=Computers::UnisonServer
					warn "WARNING: sync mode '#{mode}' not valid falling back to default" unless mode==true
				end
				return opts
			end
		end
	end
end

if __FILE__ == $0
	DR::Unison::Sync.parse(*ARGV)
end
