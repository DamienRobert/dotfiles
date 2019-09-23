def get_ssh_config(host, data)
	r=""
	user = data[:user]
	hostname = data[:hostname]
	port = data[:port]
	proxy = data[:proxy]
	proxy = "ssh -W %h:%p #{proxy}" if proxy
	proxy ||= data[:proxycommand]
	if hostname
		r << "Host #{host}\n"
		r << "HostName #{hostname}\n" if hostname
		r << "User #{user}\n" if user
		r << "Port #{port}\n" if port
		r << "ProxyCommand #{proxy}\n" if proxy
		r << "\n"
	end
	r
end

if @computer.network
	content=""
	@computer.others_network.each do |c|
		ssh=@computer.connect_to(c, service: :ssh)
		data=ssh.ip_data
		content += get_ssh_config(c.to_s.downcase, data) if data
	end
	unless content.empty?
		content=<<EOS
# Dynamic connections
# ===================

#{content}
EOS
		write_file(".ssh/config_local", generated_from(true)+ content) 
	end
end

if ::DR::Config::Network.global_network.names.include?(@computer.name)
	gcontent=""
	@computer.global_network.each do |c|
		c.get_services(:ssh).each do |ssh_name, ssh|
			ssh.addr.all_addresses(current_zones: :all, dns_extension: nil, reverse_dns: false).each do |fqdn, addrs|
				host=fqdn
				host=host+"."+ssh_name.to_s if ssh_name != :main
				%i(addr ip ip4 ip6).each do |key|
					if (a=addrs[key].first)
						key_host=host
						key_host="#{key}.#{key_host}" if key != :addr
						data=ssh.ip_data(a)
						gcontent += get_ssh_config(key_host, data)
						if key == :addr #add the short name
							basename, domainname=host.split('.', 2)
							if domainname=="internet"
								gcontent += get_ssh_config(basename, data)
							end
						end
					end
				end
			end
		end
	end
	unless gcontent.empty?
		gcontent=<<EOS
# Static connections
# ==================

#{gcontent}
EOS
		write_file(@computer.file(:rel_dotfiles)+".ssh/config_global", generated_from(true)+ gcontent)
	end
end

# Include is only understood in ssh version >= 7.3
unless @computer.attribute?(:types, :own)
	config=(@local_computer.file(:dotfiles, fallback: :home)+".ssh/config").read!
	all=config.each_line.map do |l|
		if m=l.match(/^Include\s+(.*)/)
			file=m[1]
			(@dir[:out]+".ssh/#{file}").read! ||
			(@local_computer.file(:dotfiles, fallback: :home)+".ssh/#{file}").read!
		else
			l
		end
	end.compact.join
	write_file(".ssh/config", generated_from(true)+all)
end
