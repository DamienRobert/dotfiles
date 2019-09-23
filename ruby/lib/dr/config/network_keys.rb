#!/usr/bin/env ruby

require 'dr/config/computers'
require 'dr/sh'

=begin
Keys for new computer

NAME=Feanor #["Feanor", "Mithrim", "Numenor", "Valinor", "FleurBleue", "Durin", "Doriath"]

* Wireguard
priv=$(wg genkey); echo $priv; echo $priv | wg pubkey

* Tinc
# key=$(openssl genrsa); echo $key; echo $key | openssl rsa  -pubout
openssl genrsa -out ~mine/crypt/tinc/${NAME}_rsa_key.priv
openssl rsa -in ~mine/crypt/tinc/${NAME}_rsa_key.priv -pubout -out ~mine/crypt/tinc/${NAME}_rsa_key.pub

* zerotier
zerotier-idtool generate

Si la clé existe déjà:
cd ~mine/crypt/zerotier
sudo cp /var/lib/zerotier-one/identity.* /tmp
sudo chown dams:dams /tmp/identity.*
mv /tmp/identity.*
vidir .
=end

module DR
	module NetworkKeys
		extend self

		def comp
			@comp ||= Computer.new
		end
		def crypt
			@comp.file(:cryptfiles)
		end

		def gen_keys(name, types: :all)
			changed_secret=false
			types=[:wg, :tinc, :zerotier] if types==:all
			[*types].each do |type|
				case type
				when :wg
					unless (priv=comp.secrets_auth.dig(name, :network, :wg, :private))
						if SH.find_executable("wg")
							SH.sh("wg genkey", capture: true) do |st, out| priv=out.chomp end
							comp.secrets_auth.add_key(name, :network, :wg, :private, priv)
							changed_secret=true
						else
							warn "wg not found"
						end
					end
					if priv && !(pub=comp.secrets_auth.dig(name, :network, :wg, :public))
						if SH.find_executable("wg")
							SH.sh("echo '#{priv}' | wg pubkey", capture: true) do |st, out| pub=out.chomp end
							comp.secrets_auth.add_key(name, :network, :wg, :public, pub)
							changed_secret=true
						else
							warn "wg not found"
						end
					end
				when :tinc
					privfile=crypt+"tinc/#{name}_rsa_key.priv"
					pubfile=crypt+"tinc/#{name}_rsa_key.pub"
					unless privfile.exist?
						if SH.find_executable("openssl")
							SH.sh("openssl genrsa -out #{privfile}")
						else
							warn "openssl not found"
						end
					end
					if privfile.exist? && !pubfile.exist?
						if SH.find_executable("openssl")
							SH.sh("openssl rsa -in #{privfile} -pubout -out #{pubfile}")
						else
							warn "openssl not found"
						end
					end
				when :zerotier
					privfile=crypt+"zerotier/#{name}_identity.secret"
					pubfile=crypt+"zerotier/#{name}_identity.public"
					unless privfile.exist?
						if (e=SH.find_executable("zerotier-idtool"))
							SH.sh("#{e} generate #{privfile} #{pubfile}")
						else
							warn "zerotier-idtool not found"
						end
					end
					if privfile.exist? && !pubfile.exist?
						if (e=SH.find_executable("zerotier-idtool"))
							SH.sh("#{e} getpublic #{privfile} > #{pubfile}")
						else
							warn "zerotier-idtool not found"
						end
					end
				end
			end
			if changed_secret
				puts "- Writing secret file"
				comp.write_secrets_auth
			end
		end
	end
end

if __FILE__ == $0
	ARGV.each do |c|
		DR::NetworkKeys.gen_keys(c)
	end
end
