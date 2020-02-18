#!/usr/bin/env ruby

# vim: fdm=marker

require 'dr/base/delegate'
require 'dr/base/utils'
require 'ext/duplicate'

module DR

	module Config
		module Network
			DnsExtension="lan"
			VpnZones=%i(wg tinc zerotier)
			extend self

			class Addr #{{{1
				Opts=%i(reverse_dns reverse_dns_mode port)

				include PPHelper
				#extend Forwardable
				# def_delegators :@ip, :ipv4?, :ipv6?, :link_local?, :loopback?, :prefix, :prefix=, :to_range, :to_s, :to_string
				attr_reader :data, :raw_addr, :ip, :domain
				attr_accessor :opts, :prefix
				def initialize(data, **opts)
					@data=data
					@opts=opts
					#addr, @port=data.split(":")
					addr, prefix=data.split("/")
					@raw_addr=addr
					@prefix=prefix
					begin
						@ip=IPAddr.new(@raw_addr)
					rescue IPAddr::InvalidAddressError
						@ip=nil
						@domain=@raw_addr
					end
				end

				def clone
					# Marshal.load(Marshal.dump(self))
					r=self.dup
					r.opts=r.opts.clone
					r
				end

				Opts.each do |k|
					define_method k do
						@opts[k]
					end
					define_method :"#{k}=" do |*args|
						@opts.[]=(k, *args)
					end
				end

				def to_s
					addr.to_s
				end
				def to_pp
					a=addr_port.to_s
					b=addr.to_s
					a+=" [#{b}]" unless b.empty? or b==a
					a
				end

				def addr_only
					if ip?
						@ip
					elsif domain?
						@domain
					else
						@data
					end
				end

				def rdns(reverse_dns: true, rdns_mode: self.reverse_dns_mode || :shortest)
					r=self.get_rdns(reverse_dns)
					if r
						r=Array(r)
						case rdns_mode
						when :first
							r.first
						else
							r.min_by {|d| d.split('.').length}
						end
					end
				end
				def rdns?(*args)
					!!rdns(*args)
				end

				def get_rdns(rdns=self.reverse_dns, **opts)
					rdns=self.reverse_dns if rdns == true
					if rdns and ip?
						rdns = rdns.rdns(**opts) if rdns.is_a?(ZoneAddr)
						return nil unless rdns
						return rdns if rdns.is_a?(String)
						return rdns.first if rdns.is_a?(Array)
						rdns.find do |dip, domain|
							begin
								IPAddr.new(dip.to_s) == ip
							rescue IPAddr::InvalidAddressError
								warn "Invalid ip address for rdns: #{dip}"
							end
						end&.fetch(1)
					end
				end

				def addr_rdns(*args)
					rdns(*args) || addr_only
				end

				def addr_rdns_port(port: self.port,**opts)
					a=addr_rdns(**opts).to_s
					a+=":#{port}" if port
					a
				end
				def addr_port(port: self.port, **opts)
					a=addr_only(**opts).to_s
					a+=":#{port}" if port
					a
				end

				def addr(*args)
					addr_rdns_port(*args)
				end

				#output ip/prefix only if we have an ip
				#(not equivalent to 'data', since @ip.to_s print the shortcut form
				#of the ip)
				def ip_prefix
					@ip && (@ip.to_s + (@prefix ? "/#{@prefix}" : ""))
				end

				def ip_range
					if ip?
						begin
							IPAddr.new("#{ip}/#{prefix}")
						rescue IPAddr::InvalidAddressError
						end
					end
				end

				def ip?
					!!@ip
				end
				def ipv4?
					ip? && @ip.ipv4?
				end
				def ipv6?
					ip? && @ip.ipv6?
				end
				def ipv4
					ipv4? && ip.to_s
				end
				def ipv6
					ipv6? && ip.to_s
				end
				
				def domain?
					!!@domain 
				end

				def dnsname
					domain || rdns
				end
				def dnsname?
					!! dnsname
				end

				# given options have precedence
				def update!(opts)
					self.opts.merge!(opts)
					self
				end
				# given options don't have precedence
				def update(opts)
					self.opts=opts.merge(self.opts)
					self
				end
			end #}}}1

			class DnsAddr #{{{1
				Delegator.delegate_h(self, :@data)
				attr_accessor :data, :fqdn
				def initialize(fqdn, data)
					@fqdn=fqdn
					@data={}
					add_infos(data)
				end
				def to_h
					data
				end

				def add(type, data)
					@data[type]||=[]
					case data
					when nil #do nothing
					when Array
						@data[type] += data
					else
						@data[type] << data.to_s
					end
					@data[type].uniq! if type=="A" or type=="AAAA"
				end

				def add_addr(addr)
					begin
						addr=Addr.new(addr) unless addr.is_a?(Addr)
						if addr.ipv4?
							add("A", addr.ip)
						elsif addr.ipv6?
							add("AAAA", addr.ip)
						end
					rescue => e
						warn "Bad address: #{addr} [#{e}]"
					end
				end

				def add_infos(infos)
					case infos
					when Addr
						add_addr(infos)
					when DnsAddr
						add_infos(infos.data)
					when Hash
						mappings={ip: "A", ip6: "AAAA"}
						mappings.each do |key, type|
							add(type, infos[key]) if infos.key?(key)
						end
						(infos[:addr]||[]).each do |addr| #we can also provide a list of addresses, which can be ipv6 or ipv4
							add_addr(addr)
						end
						infos.each do |k,v|
							next if (mappings.keys+[:addr]).include?(k) #already handled
							add(k,v)
						end
					end
					self
				end

				def merge!(dns)
					add_infos(dns)
				end

				def each_ip
					list=(data["A"]||[])+(data["AAAA"]||[])
					if block_given?
						list.each do |ip|
							yield ip
						end
					end
					list
				end
			end #}}}1

			class Dns #{{{1
				Delegator.delegate_h(self, :@data)
				attr_accessor :data
				def initialize(data={}, **opts, &b)
					@data={} #zones => fqdns => DnsAddr
					add(data, **opts, &b)
				end
				def to_h
					data
				end

				def split(fqdn)
					_b, _d=fqdn.to_s.split(".", 2)
				end
				def basename(fqdn)
					split(fqdn)[0]
				end
				def domain(fqdn)
					split(fqdn)[1]
				end

				def add_dns(fqdn, dns)
					if dns.is_a?(DnsAddr)
						fqdn ||= dns.fqdn
					else
						dns=DnsAddr.new(fqdn, dns)
					end
					domain=self.domain(fqdn)
					@data[domain]||={}
					if @data[domain][fqdn]
						@data[domain][fqdn].merge!(dns)
					else
						@data[domain][fqdn]=dns
					end
				end

				def add(zoneaddr, **opts)
					case zoneaddr
					when DnsAddr
						fqdn=nil; addr=zoneaddr
						fqdn, addr=yield(fqdn, addr) if block_given?
						add_dns(fqdn, addr)
					when ZoneAddr
						zoneaddr.each_fqdn(**opts) do |fqdn, addr|
							fqdn, addr=yield(fqdn, addr) if block_given?
							add_dns(fqdn, addr)
						end
					else
						zoneaddr.each do |fqdn, addr|
							fqdn, addr=yield(fqdn, addr) if block_given?
							add_dns(fqdn, addr)
						end
					end
					self
				end

				def merge!(dns)
					dns.each do |_domain, data|
						data.each do |fqdn, dnsdata|
							add_dns(fqdn, dnsdata)
						end
					end
				end

				def <<(*args, &b)
					add(*args, &b)
				end

				def reverse_dns
					r={}
					data.each do |_zone, zdata|
						zdata.each do |fqdn, dnsdata|
							ipv4s=dnsdata["A"]
							ipv6s=dnsdata["AAAA"]
							([*ipv4s]+[*ipv6s]).each do |ip|
									r[ip] ||=[]
									r[ip] << fqdn unless r[ip].include?(fqdn)
								end
							end
						end
					r
				end

				alias rdns reverse_dns

				def fqdns
					r={}
					data.each do |_z, zdata|
						zdata.each do |fqdn, dnsdata|
							r[fqdn]=dnsdata
						end
					end
					r
				end

				# for hosts file
				def output_hosts
					r=""
					fqdns.each do |fqdn, dns_data|
						dns_data.each_ip do |ip|
							r+="#{ip} #{fqdn}\n"
						end
					end
					r
				end

				# for HOSTALIASES
				def output_user_hosts
					xip=lambda do |ip|
						"#{ip.tr(':', '-')}.sslip.io"
					end

					r=""
					fqdns.each do |fqdn, dns_data|
						dns_data.each_ip do |ip|
							r+="#{fqdn} #{xip.call(ip)}\n"
						end
					end
					r
				end

				def output_unbound(domain_type: "static", indent: 2)
					r=""
					indent=" "*indent if indent.is_a?(Integer)
					data.each do |zone, zonedata|
						r<<"#{indent}local-zone: #{zone.to_s.inspect} #{domain_type}\n"
						zonedata.each do |fqdn, dns_data|
							dns_data.each do |dns_type, infos|
								infos.each do |info|
									r<<"#{indent}local-data: #{"#{fqdn} IN #{dns_type} #{info}".inspect}\n"
									if dns_type=="A" or dns_type=="AAAA"
										r<<"#{indent}local-data-ptr: #{"#{info} #{fqdn}".inspect}\n"
									end
								end
							end
						end
						r<<"\n"
					end
					r
				end
			end #}}}1

			class ZoneAddr #{{{1 # a correspondance zones => addr
				FqdnOpts=%i(fqdn_method fqdn_mode dns_extension dns_zone dns_basename)
				BaseOpts=%i(unreachable_zones default_zone computer service basename default_current_zones)
				DnsOpts=FqdnOpts.map {|i| :"#{i}_for_dns"} + %i(default_current_zones_for_dns)
				Opts=BaseOpts+FqdnOpts+DnsOpts
				AllOpts=Addr::Opts+Opts
				attr_accessor :addrs, :opts, :addr_opts
				Delegator.delegate_h(self, :@addrs)

				def initialize(*main_addrs, opts: {}, **zone_addrs, &get_fqdn)
					self.addrs={}; self.opts={}; self.addr_opts={}
					update_opts(opts, &get_fqdn)
					self.default_zone ||= :internet
					self.unreachable_zones ||= [:internet_firewalled] #can add unfirewalled services to :internet
					add_address(*main_addrs, **zone_addrs)
				end
				def to_h
					addrs
				end

				def update_opts(opts, &b)
					addr_opts={}
					zone_opts={}
					opts.each do |k,v|
						if Addr::Opts.include?(k)
							if k==:reverse_dns and v==true
								v=self
							end
							addr_opts[k]=v
						else
							zone_opts[k]=v
						end
					end
					self.addr_opts.merge!(addr_opts)
					self.opts.merge!(zone_opts)
					self.fqdn=b if b
					return addr_opts
				end

				def fqdn=(stuff)
					self.opts[:fqdn_method]=stuff
				end

				def get_opts
					self.addr_opts.merge(self.opts)
				end

				def update(opts, &b)
					addr_opts=self.update_opts(opts, &b)
					each_address do |a|
						a.update(addr_opts)
					end
					self
				end
				def update!(opts, &b)
					addr_opts=self.update_opts(opts, &b)
					each_address do |a|
						a.update!(addr_opts)
					end
					self
				end

				Addr::Opts.each do |k|
					define_method k do
						@addr_opts[k]
					end
					define_method :"#{k}=" do |*args|
						@addr_opts.[]=(k, *args)
					end
				end
				BaseOpts.each do |k|
					define_method k do
						@opts[k]
					end
					define_method :"#{k}=" do |*args|
						@opts.[]=(k, *args)
					end
				end

				def add_zone_address(zone, *addrs)
					self[zone]||=[] unless addrs.empty?
					addrs.each do |ad|
						ad=if ad.is_a?(Addr)
							ad.clone.update(addr_opts)
						else
							Addr.new(ad, **addr_opts)
						end
						self[zone] << ad unless self[zone].include?(ad)
					end
					self.addrs
				end

				def add_address(*main_addrs, **zone_addrs)
					main_addrs.each do |ad|
						case ad
						when ZoneAddr
							ad.each do |zone, zoneads|
								add_zone_address(zone, *zoneads)
							end
						else
							add_zone_address(default_zone, ad)
						end
					end
					zone_addrs.each do |zone, ads|
						add_zone_address(zone, *ads)
					end
					addrs
				end

				def self.parse_args(*args, **kwds)
					args=args.first if args.length==1 and args.first.is_a?(Array)
					[*args, kwds]
				end
				def self.parse(*args, **kwds)
					if args.length == 1 and args.first.is_a?(ZoneAddr)
						z=args.first
						z=z.clone.update(**kwds) unless kwds.empty?
						z
					else
						*args, kwds=self.parse_args(*args, **kwds)
						self.new(*args, **kwds)
					end
				end

				def add(*args, **kwds)
					*args, kwds=self.class.parse_args(*args, **kwds)
					add_address(*args, **kwds)
				end

				def merge(*za)
					za.each do |zoneaddr|
						self.update(zoneaddr.get_opts)
						self.add(zoneaddr)
					end
				end
				def merge!(*za)
					za.each do |zoneaddr|
						self.update!(zoneaddr.get_opts)
						self.add(zoneaddr)
					end
				end

				def default_current_zones
					opts.key?(:default_current_zones) || true
				end

				def zones(current=self.default_current_zones)
					grading=zones_grading
					z=current_zones.sort {|x,y| grading[x] <=> grading[y] }
					if (current && current != :all)
						z
					else
						rest=(all_zones-current_zones).sort {|x,y| grading[x] <=> grading[y] }
						z+rest
					end
				end

				# for a ComputerNetwork, the zones_grading refer to the
				# connected_zones, ie the zones we want to reach first
				# hare the zones_grading refer to zones, ie the zones we are
				# accessible from. Since this is potentially from anyone, internet
				# is ranked first here
				def zones_grading
					unless @zones_grading
						@zones_grading={home: 10, imb: 20, internet: 1, wg: 510, tinc: 530, zerotier: 520} #the order we try to connect to
						@zones_grading.default=9999 #misc zones
					end
					@zones_grading
				end

				def all_zones
					keys
				end

				# zones we currently are reachable from
				def current_zones
					all_zones-unreachable_zones
				end

				module DnsHelper
					def dns_basename
						self.basename and return self.basename.to_s.downcase
						self.computer and return self.computer.dns_basename
					end

					def dns_extension
						Network::DnsExtension
					end

					def dns_zone_name(zone)
						return "internet" if zone==:internet_firewalled
						zone
					end

					def default_fqdn(zone=nil, a=nil, **fqdn_opts)
						fqdnopts=(self.opts[:fqdn_opts]||{}).merge(fqdn_opts)
						case fqdnopts[:fqdn_mode]
						when :short
							return default_fqdn(zone, a, **fqdn_opts, dns_zone: false, fqdn_mode: :default)
						when :all, :multiple, :both
							return [
								default_fqdn(zone, a, **fqdn_opts, fqdn_mode: :short),
								default_fqdn(zone, a, **fqdn_opts, fqdn_mode: :default),
							]
						end
						dnsext = fqdnopts.fetch(:dns_extension, dns_extension)
						zonename = fqdnopts[:dns_zone]==false ? nil : dns_zone_name(zone)
						basename = fqdnopts[:dns_basename]==false ? nil : dns_basename
						[basename, zonename, dnsext].compact.map {|i| i.to_s}.join(".")
					end

					def fqdn_opts
						r={}
						FqdnOpts.each do |i|
							r[i]=opts[i] if opts.key?(i)
						end
						r
					end

					def fqdn(zone=nil, a=nil, **fqdn_opts)
						fqdnopts=(self.fqdn_opts||{}).merge(fqdn_opts)
						if block_given?
							yield(self, zone, a, **fqdnopts)
						elsif (b=fqdnopts[:fqdn_method])
							b.call(self, zone, a, **fqdnopts)
						else
							default_fqdn(zone, a, **fqdnopts)
						end
					end
				end
				include DnsHelper

				# def pretty_print(pp)
				# 	pp.pp_object(addrs)
				# end

				def clone
					#r=self.dup
					#r.addrs.each do |zone, a|
					#	r.addrs[zone]=a.map {|aa| aa.clone}
					#end
					## r.addrs=Marshal.load(Marshal.dump(self.addrs))
					#r
					Duplicate.duplicate(self)
				end

				def empty_clone(**opts, &b)
					o={}
					o.merge!(self.get_opts)
					o.merge!(opts)
					self.class.new(opts: o, &b)
				end

				def a
					addrs
				end

				def each_address(*zones)
					zones=addrs.keys if zones.empty?
					r=[]
					zones.each do |z|
						addrs[z]&.each do |a|
							yield a if block_given?
							r << a
						end
					end
					r
				end

				def each_fqdn(current_zones: self.default_current_zones, reverse_dns: true, **fqdn_opts)
					r={}
					addr_opts={}
					fqdn_opts.each_key do |k|
						if Addr::Opts.include?(k)
							addr_opts[k]=fqdn_opts.delete(k)
						end
					end
					zones(current_zones).each do |z|
						addrs[z]&.each do |a|
							fqdns=fqdn(z, a, **fqdn_opts)
							if !addr_opts.empty? or reverse_dns
								a=a.clone
								a.update(addr_opts)
								if reverse_dns==true
									# we don't overwrite an existing fqdn
									a.update(reverse_dns: fqdns)
								elsif reverse_dns==:force
									a.update!(reverse_dns: fqdns)
								elsif reverse_dns
									a.update(reverse_dns: reverse_dns)
								end
							end
							Array(fqdns).each do |fqdn|
								r[fqdn] ||= []
								r[fqdn] << a
								yield fqdn, a if block_given?
							end
						end
					end
					r
				end

				def all(exclude: nil, &b)
					if b
						addrs.map(&b).flatten.compact
					elsif exclude
						if exclude == :vpn
							excludelist=Network::VpnZones
						else
							excludelist=[*exclude]
						end
						addrs.map {|k,v| v unless excludelist.include?(k)}.flatten.compact
					else
						addrs.values.flatten
					end
				end
				def best_zone
					filter(addrs.keys.first)
				end
				def best_zone_addrs
					addrs.first&.fetch(1)
				end
				def best
					best_zone_addrs&.first
				end
				#like all, but in string (and uniq) form
				def all_addrs(**opts, &b)
					all(**opts, &b).map {|a| a.to_s}.uniq
				end

				def connect_to_zones(cur=:all)
					r=case cur
					when ComputerNetwork
						cur.connected_zones
					when :all
						addrs.keys
					else
						[*cur]
					end
					r=yield(*r) if block_given?
					r
				end

				# only_reachable=true: our reachable zones and their connected zones
				# only_reachable=false: our zones and their connected zones (reachable ones first)
				# only_reachable=:all: our zones (their connected zones first)
				# best_reachable/best_connected/best_all (the best of the above)
				def connect_handler(theirs_zones, reachable: false)
					our_zones=all_zones
					our_reachable=current_zones
					reachables = theirs_zones & our_reachable
					all_theirs = reachables + (theirs_zones-reachables)
					all=all_theirs + (our_zones - all_theirs)
					case reachable
					when true
						reachables
					when false
						all_theirs
					when :all
						all
					when :best_reachable
						reachables.first
					when :best_connected
						all_theirs.first
					when :best, :best_all
						all.first
					end
				end

				# output a new ZoneAddr with zones we can connect to
				def connect(their_zones=:all, reachable: false, **extra_opts)
					a=self.empty_clone(**extra_opts)
					acc_zones=if block_given?
						yield(self, cur)
					else
						connect_handler(connect_to_zones(their_zones), reachable: reachable)
					end
					Array(acc_zones).each do |zone|
						if addrs.key?(zone)
							a.add(**{zone => addrs[zone]})
						end
					end
					a
				end
				def filter(*zones)
					connect(zones)
				end

				# if values: keep the values, not the original address
				def all_addresses(values: false, **fqdn_opts)
					r={}
					# can also pass 'current_zones: :all' in fqdn_opts
					each_fqdn(**fqdn_opts) do |fqdn, a|
						r[fqdn]||={addr: [], ip: [], ip6: [], ip4: [], domain: [], rdns: [], dnsname: []}
						if values
							r[fqdn][:addr] << a.addr
							r[fqdn][:ip] << a.ip.to_s if a.ip?
							r[fqdn][:ip4] << a.ipv4 if a.ipv4?
							r[fqdn][:ip6] << a.ipv6 if a.ipv6?
							r[fqdn][:domain] << a.domain if a.domain?
							r[fqdn][:rdns] << a.rdns if a.rdns?
							r[fqdn][:dnsname] << a.dnsname if a.dnsname?
						else
							r[fqdn][:addr] << a
							r[fqdn][:ip] << a if a.ip?
							r[fqdn][:ip4] << a if a.ipv4?
							r[fqdn][:ip6] << a if a.ipv6?
							r[fqdn][:domain] << a if a.domain?
							r[fqdn][:rdns] << a if a.rdns?
							r[fqdn][:dnsname] << a if a.dnsname? #rdns or domain
						end
					end
					r.each do |_fqdn, data|
						data.each do |k,v|
							data[k]=v.uniq
						end
					end
					r
				end

				def dns_opts
					r={}
					(FqdnOpts+%i(default_current_zones)).each do |i|
						j=:"#{i}_for_dns"
						i=:current_zones if i==:default_current_zones
						if opts.key?(j)
							r[i]=opts[j] 
						elsif opts.key?(i)
							r[i]=opts[i] 
						else #defaults for dns
							case i
							when :current_zones
								r[i]=:all
							when :fqdn_mode
								r[i]=:default
							end
						end
					end
					r
				end

				def dns(**opts, &b)
					Dns.new(self, **dns_opts.merge(opts), &b)
				end

				def rdns(**opts, &b)
					dns(**opts, &b)&.rdns
				end
			end #}}}1

			class Service #{{{1
				attr_accessor :data
				Delegator.delegate_h(self, :@data)

				def initialize(**data)
					self.data=data.clone
					%i(addr extra_addr).each do |i|
						if data.key?(i)
							self.send(:"#{i}=", self.send(i))
						end
					end
				end
				def to_h
					data
				end

				%i(addr extra_addr).each do |i|
					define_method i do
						data[i]
					end
					define_method :"#{i}=" do |*args|
						data[i]=ZoneAddr.parse(*args)
					end
				end

				def clone
					# s=self.dup
					# %i(addr extra_addr).each do |i|
					# 	s.send(:"#{i}=", s.send(i).clone) if s.send(i)
					# end
					# s
					Duplicate.duplicate(self)
				end

				def add_addr(*args)
					self.addr ||= ZoneAddr.new
					self.addr.add(*args)
				end
				def add_extra_addr(*args)
					self.extra_addr ||= ZoneAddr.new
					self.extra_addr.add(*args)
				end

				def get(global_addr=self[:computer]&.addr)
					s=self.clone
					za=s.addr || ZoneAddr.new
					za.update_opts({service: self, computer: self[:computer]})
					if za.addrs.empty?
						za.merge(global_addr)
					end
					if (e=s.delete(:extra_addr))
						za.add(e)
					end

					if (vpn=data[:vpnzone]) #we can't use the vpn zone to connect to the vpn yet!
						vpnaddr=[]
						[*vpn].each do |v|
							vpnaddr+=[*za.delete(v)]
						end
					end
					s[:vpn_addr]=vpnaddr if vpnaddr

					# we need to update after vpn_addr
					if (port=data[:port])
						za.update(port: port)
					end
					s.addr=za
					s
				end

				def connect(*args, **kws, &b)
					# s=self.get
					s=self.clone
					s.addr=s.addr.connect(*args, **kws, &b)
					s
				end

				def ip_data(ip=self.addr)
					ip=ip.best if ip.is_a?(ZoneAddr)
					if ip
						ip_opts=ip.opts
						ip_opts[:hostname]=ip.addr(port: false)
						data.merge(ip_opts)
					else
						data
					end
				end
			end #}}}1

			class ComputerNetwork #{{{1
				attr_accessor :addr, :services, :name
				extend(Forwardable)
				def_delegators :@addr, :add, :reverse_dns, :unreachable_zones, :default_zone, :reverse_dns=, :unreachable_zones=, :default_zone=, :all_addresses, :dns, :rdns, :zones, :current_zones, :all_zones, :addr_opts, :addr_opts=, :update_opts, :update, :update!
				def_delegator :@addr, :opts, :za_opts
				def_delegator :@addr, :opts=, :za_opts=
				attr_accessor :opts

				def initialize(name, *addrs, opts: {}, **kwds)
					@name=name
					@services={}
					opts[:computer]=self
					za_opts={}
					opts.each_key do |k|
						if ZoneAddr::AllOpts.include?(k)
							za_opts[k]=opts.delete(k)
						end
					end
					self.addr=ZoneAddr.parse(*addrs, opts: za_opts, **kwds)
					self.opts=opts
				end
				def clone
					Duplicate.duplicate(self)
				end

				def to_s
					name.to_s
				end

				#include ZoneAddr::DnsHelper
				def dns_basename
					self.name.to_s.downcase
				end

				attr_writer :zones_grading
				def zones_grading
					unless @zones_grading
						@zones_grading={home: 10, imb: 20, internet: 100, wg: 500, tinc: 600, zerotier: 700} #the order we try to connect to
						@zones_grading.default=9999 #misc zones
					end
					@zones_grading
				end

				# zones we can access
				def connected_zones
					grading=zones_grading
					(current_zones+[:internet]).uniq.sort {|x,y| grading[x] <=> grading[y] }
				end

				def add_service(service, name: :main, **data)
					@services[service] ||= {}
					serv=@services[service]
					if serv.key?(name)
						warn "Warning: overwriting existing service: #{name}"
					end
					data[:service_name]||=name
					data[:service_type]||=service
					data[:computer]||=self
					serv[name]=Service.new(**data)
				end

				def get_service(service, service_name: :default)
					if service_name == :all
						get_services(service)
					elsif service_name == :default
						s=@services[service]&.keys&.first
						get_service(service, service_name: s)
					else
						@services.dig(service, service_name)&.get
					end
				end

				def get_services(service)
					s=@services[service]
					return nil unless s
					r={}
					s.each_key do |name|
						r[name]= get_service(service, service_name: name)
					end
					r
				end

				# cur: zones the caller can connect to
				# return the prefered address to connect to
				def connect(cur: default_zone, service: nil, service_name: :default, **opts, &b)
					if service
						connect_at_service(service, cur: cur, service_name: service_name, **opts, &b)
					else
						addr.connect(cur, **opts, &b)
					end
				end

				# return a hash {zone: service_data}
				def connect_at_service(service, cur: default_zone, service_name: :default, **opts, &b)
					r=get_service(service, service_name: service_name)
					return nil unless r
					if r.is_a?(Hash) # we requested all services
						r.transform_values do |v|
							v.connect(cur, **opts, &b)
						end
						r
					else
						r.connect(cur, **opts, &b)
					end
				end
				def connect_at_services(*args, **opts)
					connect_at_service(*args, service_name: :all, **opts)
				end

				def get_comp(comp) #to subclass
					comp
				end

				# @options: 
				# kwds is the new option for the created ZoneAddr
				# -> :reachable: true, false, :all #the reachable zones of comp
				# (=accessible current zones, accessible zones, all their zones)
				# cur: the zones we have access to
				# Exemples:
				# - fqdn_mode: :default (for each_fqdn)
				# - default_current_zones: [true], false=:all (for each_fqdn)
				# - fqdn_mode_for_dns: :both / [:default]
				# - default_current_zones_for_dns: true, [false=:all]
				#
				# Note that reverse_dns true in connect_to point each Addr to the
				# ZoneAddr. So the reverse_dns resolution is dynamic, and use the
				# *_for_dns settings for the fqdn opts (cf ZoneAddr#dns), with a
				# fallback to the ZoneAddr fqdn opts.
				#
				# Note that ZoneAddr#each_fqdn also pass fqdn options to
				# ZoneAddr#fqdn, plus if reverse_dns=true update the addr with the
				# list of fqdns obtained.
				def connect_to(comp=self, cur: self, reverse_dns: true, **kwds)
					o=fqdn_opts_of.merge(kwds)
					o[:reachable]=opts[:reachable_of] if opts.key?(:reachable_of)
					comp=get_comp(comp)
					comp.connect(cur: cur, reverse_dns: reverse_dns, **o) if comp
				end

				# fqdn_opts_of is to specify default options for connect_to.
				# We use fqdn_mode_of for instance, to specify the option
				# fqdn_mode; because self[:fqdn_mode] is our own fqdn_mode, not the
				# one of the comp we want to connect to.
				def fqdn_opts_of
					r={}
					(ZoneAddr::FqdnOpts+ZoneAddr::DnsOpts).each do |i|
						j=:"#{i}_of"
						r[i]=opts[j] if opts.key?(j)
					end
					r
				end

				# essentially like comp.dns except if we specify settings in
				# fqdn_opts_of
				def all_dns_of(comp, **opts, &b)
					comp=get_comp(comp)
					comp.dns(**fqdn_opts_of.merge(opts), &b) if comp
				end
				def all_rdns_of(comp, **opts, &b)
					dns_of(comp, **opts, &b).rdns
				end

				# Simply do a connect_to and then a dns.
				# So (by default) since reachable=false, this give all the dns for
				# the zones we can connect to.
				# @exemple: reachable: :all, fqdn_mode: :all
				#
				# Note that since we call 'dns' directly and don't use #each_fqdn,
				# then fqdn_mode is equivalent to fqdn_mode_for_dns since we
				# fallback to fqdn_mode in fqdn_mode_for_dns
				def dns_of(*comps, **opts)
					dns=Dns.new
					opts=fqdn_opts_of.merge(opts)
					comps.each do |comp|
						if block_given?
							# the ZoneAddr we want the dns for
							addr=yield comp, self, **opts
						else
							addr=connect_to(comp, **opts)
						end
						dns.merge!(addr&.dns)
					end
					return dns
				end

			end #}}}1

			class GlobalNetwork #{{{1
				attr_accessor :data
				Delegator.delegate_h(self, :@data)

				def initialize(*comps, **named_comps)
					@data={}
					comps.each {|c| self << c}
					self.add_comps(named_comps)
				end
				def clone
					r=self.dup
					r.each do |k,v|
						r[k]=v.clone
					end
					r
					#Marshal.load(Marshal.dump(self))
				end
				def to_h
					data
				end

				alias each each_value
				def names
					each.map { |c| c.name }
				end

				def add_comp(name, comp)
					if comp.is_a?(ComputerGlobalNetworks)
						g=comp.global_networks || []
						g << self unless g.include?(self)
						comp.global_networks=g
					end
					@data[name] = comp
				end

				def <<(comp)
					add_comp(comp.name, comp)
				end
				def add_comps(named_comps)
					named_comps.each do |k,v|
						add_comp(k,v)
					end
				end

				def dns(*args, &b)
					dns=Dns.new
					each do |comp|
						n_dns=comp.dns(*args, &b)
						dns.merge!(n_dns)
					end
					dns
				end

				def all_addresses(**opts, &b)
					r={}
					each do |comp|
						r.merge!(comp.all_addresses(**opts, &b))
					end
					r
				end

				def rdns(**opts, &b)
					dns(**opts, &b).rdns
				end
			end #}}}1

			class ComputerGlobalNetworks < ComputerNetwork #{{{1 #=computer + global networks
				attr_accessor :global_networks
				def initialize(name, *addrs, opts: {}, **kwds)
					self.global_networks=Array(opts.delete(:global_network))
					super
				end

				def local_network
					self
				end

				def all_networks
					g=GlobalNetwork.new
					global_networks.each do |o|
						g.merge!(o.data)
					end
					g
				end

				def network(*args)
					if args.empty?
						local_network
					else
						g=all_networks
						r=args.map do |i|
							case i
							when DR::Config::Network::ComputerNetwork
								i
							when DR::Computer
								g[i.name] || g[i.sym_name]
							else
								g[i.to_s]
							end
						end
						case r.length
						when 0
							nil
						when 1
							r.first
						else
							r
						end
					end
				end

				# the network zones we can access
				def network_zones(current: true)
					local_network.zones(current: current)
				end

				def others_network
					r=[]
					all_networks.each do |c|
						if c.name != self.name
							yield c if block_given?
							r << c
						end
					end
					DR::Config::Network::GlobalNetwork.new(*r)
				end

				def get_comp(comp)
					if comp.is_a?(ComputerNetwork)
						super(comp)
					else
						old_comp=comp
						comp=network(comp)
						if comp
							super(comp) 
						else
							warn "Inexisting computer #{old_comp}"
							nil
						end
					end
				end

				def global_dns(**opts, &b)
					dns_of(*all_networks.each, **opts, &b)
				end
			end #}}}1

			attr_writer :global_network
			def self.global_network
				return @global_network if @global_network
				n=GlobalNetwork.new
				home_dns="dams.duckdns.org"
				%w(Feanor Mithrim Numenor Valinor FleurBleue Durin Doriath).each_with_index do |c,i|
					i=i+1
					comp=ComputerGlobalNetworks.new(c, home: "192.168.0.#{10+i}/24",
						wg: ["10.17.0.#{i}/16", "fd0d:919f:2eef:17::#{i}/64"],
						tinc: ["10.18.0.#{i}/16", "fd0d:919f:2eef:18::#{i}/64"],
					)
					comp.add_service(:ssh, user: "dams")
					tinc={dev: "tinc0", vpnzone: :tinc}
					comp.add_service(:tinc, name: :tinc0, **tinc)
					comp.add_service(:zerotier, network: :home)

					case c
					when "Mithrim"
						comp.addr.add(imb: "147.210.21.27/24")
						comp.addr.add(zerotier: ["10.242.98.12/16", "fc99:9417:5fc6:f459:84f7::1/40"])
					when "Numenor"
						comp.addr.add(imb: "147.210.21.74/24")
					when "Gondolin"
						comp.addr.add(imb: "147.210.21.89/24")
					when "Doriath"
						comp.addr.add(zerotier: ["10.242.144.180/16", "fc99:9417:5ffa:11a2:5bcd::1/40"])
					when "Feanor"
						comp.addr.add(zerotier: ["10.242.252.182/16", "fc99:9417:5f05:ce8d:9108::1/40"])
					when "Durin"
						comp.addr.add(zerotier: ["10.242.39.241/16", "fc99:9417:5f99:1cbe:d1b3::1/40"])
					end

					case c
					when "Mithrim", "Numenor", "Gondolin"
						comp.unreachable_zones << :home
						wg={port: 55280, dev: "wg0", vpnzone: :wg}
						comp.add_service(:wg, **wg)
					end
					if comp.current_zones.include?(:home)
						comp.services.dig(:ssh, :main).add_extra_addr(Addr.new(home_dns, port: 44000+i))
						wg={port: 55280+i, extra_addr: home_dns, dev: "wg0", vpnzone: :wg}
						comp.add_service(:wg, **wg)
					end
					if comp.current_zones.include?(:imb)
						imb=comp.addr[:imb]
						imb_ssh=imb.map {|a| a.clone.update(proxy: "aimb")}
						comp.add(internet_firewalled: imb)
						comp.services.dig(:ssh, :main).add_extra_addr(*imb_ssh)
						comp.services.dig(:wg, :main).add_extra_addr(*imb) #this adds to the :internet zone
					end
					n << comp
				end
				@global_network=n
			end

		end
	end
end

=begin
Note: 
- in unbound.conf and hosts we include the global dns data
- in hosts we also in 'foo.lan' include the best @computer.connect_to zone
- in unbound.conf in 'foo.lan' we include all addreses from @computer.connect_to
- in ssh config_global, we include all_adresses for each computer ssh service
  eg foo.home, ip.foo.home, ip4.foo.home, ip6.foo.home
  in config_local, `foo` uses ip_data, so the best ip address. Astuce: ssh 'foo.' uses llmnr rather than the 'foo' host entry
=end

if __FILE__ == $0 #{{{
	g=DR::Config::Network.global_network
	if ARGV.empty?
		DR::Utils.pretty_print(g)
	else
		ARGV.each do |a|
			puts "# #{a}"
			DR::Utils.pretty_print(g[a])
		end
	end
end
