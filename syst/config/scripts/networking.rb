net=@computer.local_network

if net
	### ssh ports
	ssh_stream=[]
	net.get_services(:ssh)&.each do |_name, data|
		data.addr.all.each do |a|
			if (port=a.port)
				ssh_stream << port
			end
		end
	end
	unless ssh_stream.empty?
		content="[Socket]\n"
		ssh_stream.each do |port|
			content+="ListenStream=#{port}\n"
		end
		write_file("etc/systemd/system/sshd.socket.d/override.conf", content)
	end

	### wireguard
	net.get_services(:wg)&.each do |wgname, wg|
		priv,_pub=@local_computer.network_keys(@computer.name, type: :wg)
		network=<<EOS
[Match]
Name = #{wg[:dev]}

[Network]
EOS
			(wg[:vpn_addr]||[]).each do |a|
				network << "Address = #{a.ip_prefix}\n"
			end

			netdev=<<EOS
[NetDev]
Name = #{wg[:dev]}
Kind = wireguard
Description = Wireguard

[WireGuard]
PrivateKey = #{priv}
ListenPort=#{wg[:port] || 51820}

EOS
		@computer.others_network.each do |comp|
			# wginfo=@computer.connect_to(comp, service: :wg)
			# _, wg=wginfo.first
			wg=@computer.connect_to(comp, service: :wg, service_name: wgname) # fqdn_mode: :all) #since we only have one Endpoint, use a generic dns #Update: wireguard only uses the first ip address from the endpoint, which may be the wg address itself :-( # Reupdate: it actually works, I just need to put all adresses in the hosts file #ReReUpdate: no even with several adresses, it does not work...
			if wg
				allowed_ips=if wg.key?(:allowed_ips)
				 	 wg[:allowed_ips]
					else
						wg[:vpn_addr]
					end
				_priv,pub=@local_computer.network_keys(comp.name, type: :wg)
				netdev+="# #{comp}\n"
				netdev+="[WireGuardPeer]\n"
				netdev+="PublicKey = #{pub}\n"
				netdev+="AllowedIPs = #{[* allowed_ips].join(", ")}\n"
				netdev+="Endpoint = #{wg.addr.best}\n"
				# netdev+="PersistentKeepalive = 25\n" if zone != :internet and n_zone ==:internet #todo: when do we need keepalive
				netdev+="\n"
			end
		end
		write_file("etc/systemd/network/35-wg0.netdev", netdev, perm: 0640)
		write_file("etc/systemd/network/35-wg0.network", network)
	end

	### tinc
	tinc_service=net.get_services(:tinc) if has_package?("tinc")
	tinc_service&.each do |tincname, tinc|
		servername=tinc[:servername]||net.name
		tincconfig=<<EOS
Name = #{servername}
Device = /dev/net/tun
EOS
		@computer.others_network.each do |comp|
			otinc=@computer.connect_to(comp, service: :tinc, service_name: tincname)
			if otinc
				oservername=otinc[:servername]||comp.name
				tincconfig+=<<EOS
ConnectTo = #{oservername}
EOS
			end
		end
		write_file("etc/tinc/#{tincname}/tinc.conf", tincconfig)
		priv,_pub=@local_computer.network_keys(servername, type: :tinc)
		write_file("etc/tinc/#{tincname}/rsa_key.priv", priv, perm: 0640)

		subnet=if tinc.key?(:subnet)
				tinc[:subnet]
			else
				tinc[:vpn_addr]
			end
		tinc_up="#!/bin/sh\n"
		subnet.each do |a|
			tinc_up+="ip addr add #{a.ip_prefix} dev $INTERFACE\n"
		end
		tinc_up+="ip link set $INTERFACE up\n"
		write_file("etc/tinc/#{tincname}/tinc-up", tinc_up, perm: 0755)

		tinc_down=<<EOS
#!/bin/sh
ip link set $INTERFACE down
EOS
		write_file("etc/tinc/#{tincname}/tinc-down", tinc_down, perm: 0755)

		service=<<EOS
[Unit]
Description=Tinc net %i

[Service]
Type=simple
WorkingDirectory=/etc/tinc/%i
ExecStart=/usr/sbin/tincd -n %i -D -d3
ExecReload=/usr/sbin/tincd -n %i -kHUP
KillMode=mixed
TimeoutStopSec=5
Restart=always
RestartSec=60

[Install]
WantedBy=tinc.service
EOS
		write_file("etc/systemd/system/tinc@.service", service)

		@computer.global_network.each do |comp|
			tinc=@computer.connect_to(comp, service: :tinc, service_name: tincname)
			if tinc
				servername=tinc[:servername]||comp.name
				addr=tinc.addr.all_addrs
				subnet=if tinc.key?(:subnet)
						tinc[:subnet]
					else
						tinc[:vpn_addr]
					end
				hostconfig=""
				addr.each {|a| hostconfig+="Address = #{a}\n"}
				[*subnet].each {|a| hostconfig+="Subnet = #{a}\n"}
				_priv,pub=@local_computer.network_keys(servername, type: :tinc)
				hostconfig+="\n"+pub if pub
				write_file("etc/tinc/#{tincname}/hosts/#{servername}", hostconfig)
			end
		end
	end

	### zerotier
	if has_package?("zerotier-one")
		priv,pub=@local_computer.network_keys(@computer.name, type: :zerotier)
		write_file("var/lib/zerotier-one/identity.public", pub) if pub
		write_file("var/lib/zerotier-one/identity.secret", priv, perm: 0640) if priv
		net.get_services(:zerotier)&.each do |ztname, zt|
			network=zt[:network]
			secret_value=@computer.secrets_auth&.dig(:Networks, :zerotier, network) and network=secret_value
			network_file="var/lib/zerotier-one/networks.d/#{network}.conf"
			write_file(network_file, "") if network and !(@dir[:target]+network_file).exist?
		end
	end
end
