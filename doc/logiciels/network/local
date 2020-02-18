vim: ft=markdownlight fdm=expr

localhost
=========

127.0.0.1/8
::1/128

* https://tools.ietf.org/id/draft-smith-v6ops-larger-ipv6-loopback-prefix-04.html
    0001:0000:0000:0000:0000:0000:0000:0000/32 ie  1::/32
  Mais expired.

Cf aussi: https://serverfault.com/questions/193377/ipv6-loopback-addresses-equivalent-to-127-x-x-x
=> link local address: sudo ip -6 address add fe80::1/64 dev lo; nc fe80::1%lo 10001
=> private address: ip -6 route add to local fd66:29e9:f422:8dfe::/64 dev lo
=> ou sudo ip route add local ::127.0.0.0/104 dev lo; ie widening the routing table into the range reserved for ipv4 compatibility 

* Unspecified address: 0.0.0.0 / ::

Private local addresses
=======================

https://en.wikipedia.org/wiki/Private_network
http://rays-notebook.info/computing/net-explore.html

IPv4:
10.0.0.0/8 (255.0.0.0): single class A network
172.[16-31].0.0/12 (255.240.0.0): 16 contiguous class B networks
192.168.0.0/16 (255.255.0.0): 256 contiguous class C networks

IPv6: fd00::/8

Exemple:
  Prefix: fd; Global random id: 12:3456:789a; Interface Id: 0001
  => Subnet: fd12:3456:789a:1::/64
  Address: 0000:0000:0000:0001
  => IPv6 address: fd12:3456:789a:1::1

Link local addresses
====================

* https://en.wikipedia.org/wiki/Link-local_address
169.254.0.0/16
fe80::/10

* Mac to link local:
http://ben.akrin.com/?p=1347
http://www.tcpipguide.com/free/t_IPv6InterfaceIdentifiersandPhysicalAddressMapping-2.htm
  take the mac address: for example 52:74:f2:b1:a8:7f
  throw ff:fe in the middle: 52:74:f2:ff:fe:b1:a8:7f
  reformat to IPv6 notation 5274:f2ff:feb1:a87f
  convert the first octet from hexadecimal to binary: 52 -> 01010010
  invert the bit at index 6 (counting from 0): 01010010 -> 01010000
  convert octet back to hexadecimal: 01010000 -> 50
  replace first octet with newly calculated one: 5074:f2ff:feb1:a87f
  prepend the link-local prefix: fe80::5074:f2ff:feb1:a87f

IPV6
====

::ffff:192.0.2.128 IPv4-mapped IPv6 addresses
Ex: ::ffff:7f00:1 should be 127.0.0.1

::/0 Default unicast
2002::/16 6to4
2001::/32 Toredo tunneling (encapsulates in udp so works behind a nat, unlike 6to4)
fc00::/7 Unique local address [currently fd00::/8 is used for private addresses]

Multicast
=========

http://www.iana.org/assignments/ipv6-multicast-addresses/ipv6-multicast-addresses.xhtml
https://en.wikipedia.org/wiki/Multicast_address

=> ip addresses from 224.0.0.0 to 239.255.255.255
machines send IGMP request to subscribe to a multicast ip, eg 239.0.0.1
when a message is sent to 239.0.0.1 the router sends it to all subscribed machines.
Some multicast adresses are reserved (cf the wikipedia page). 239.0.0.0/8 is
for private use.

ipv6 multicast: ff00::/8

* Specific multicast groups

Ipv4 Multicast
224.0.0.1 	The All Hosts multicast group addresses all hosts on the same network segment.
224.0.0.2 	The All Routers multicast group addresses all routers on the same network segment.

Ipv6 Multicast
Node-Local Scope Multicast Addresses
FF01:0:0:0:0:0:0:1 	All Nodes Address
FF01:0:0:0:0:0:0:2 	All Routers Address
Link-Local Scope Multicast Addresses
FF02:0:0:0:0:0:0:1 	All Nodes Address
FF02:0:0:0:0:0:0:2 	All Routers Address
Site-Local:
FF05:0:0:0:0:0:0:2 	All Routers Address

=> ping ff02::1%wlan0 #to see who is connected to wlan0

* Ethernet multicast: https://en.wikipedia.org/wiki/Multicast_address
Ethernet frames with a value of 1 in the least-significant bit of the first octet[note 3] of the destination MAC address are treated as multicast frames and are flooded to all points on the network. While frames with ones in all bits of the destination address (FF-FF-FF-FF-FF-FF) are sometimes referred to as broadcasts, Ethernet network equipment generally does not distinguish between multicast and broadcast frames.

Exemple:
01-80-C2-00-00-00, 01-80-C2-00-00-03 or 01-80-C2-00-00-0E 	0x88CC 	Link Layer Discovery Protocol 
01-80-C2-00-00-08 	0x0802 	Spanning Tree Protocol (for provider bridges) IEEE 802.1ad 
01-00-5E-00-00-00 through 01-00-5E-7F-FF-FF  IPv4 Multicast
33-33-00-00-00-00 through 33-33-FF-FF-FF-FF 	0x86DD 	IPv6 Multicast

Exemple for ipv6 neighboor discovery https://www.ietf.org/proceedings/65/slides/16ng-3/sld5.htm
RS destination MAC address is 33:33:00:00:00:02 (all-routers multicast MAC address)
RA destination MAC address is 33:33:00:00:00:01 (all-nodes multicast MAC address)
Address Resolution process
NS destination MAC address is 33:33:FF:xx:xx:xx (solicited node multicast MAC address)

# All special adresses

* https://en.wikipedia.org/wiki/Reserved_IP_addresses

* unbound
In unbound, the following adresses are special by default:
localhost, reverse ipv4/ipv6 loopback, onion, test, invalid domain

- reverse RFC1918 local use zones (private local addresses)
  Reverse  data  for zones 10.in-addr.arpa, 16.172.in-addr.arpa to  31.172.in-addr.arpa,   168.192.in-addr.arpa.
- reverse RFC3330 IP4 this, link-local, testnet and broadcast
  Reverse data for zones 0.in-addr.arpa (invalid),
  254.169.in-addr.arpa (link local)
  2.0.192.in-addr.arpa (TEST NET 1), 100.51.198.in-addr.arpa (TEST NET 2), 113.0.203.in-addr.arpa (TEST NET 3),
  255.255.255.255.in-addr.arpa.   
  And from 64.100.in-addr.arpa to 127.100.in-addr.arpa (Shared Address Space) ie 100.64.0.0/10
- reverse RFC4291 IP6 unspecified, ie 0 alias ::
- reverse RFC4193 IPv6 Locally Assigned Local Addresses
  Reverse data for zone D.F.ip6.arpa. (ie fd::/8)
- reverse RFC4291 IPv6 Link Local Addresses
  Reverse data for zones 8.E.F.ip6.arpa to B.E.F.ip6.arpa. (ie fe8::/10)
- reverse IPv6 Example Prefix
  8.B.D.0.1.0.0.2.ip6.arpa. (ie 2001:0DB8::/32)

* ipv4 class A/B/C/D/E
https://en.wikipedia.org/wiki/Classful_network
Class A: leading bit 0 -> 0.0.0.0 	127.255.255.255 /8
Class B: leading bit 10 -> 128.0.0.0 	191.255.255.255 /16
Class C: leading bit 110 -> 192.0.0.0 	223.255.255.255 /24
Class D (multicast): leading bit 1110 -> 224.0.0.0 239.255.255.255
Class E (reserved): leading bit 1111 -> 240.0.0.0 255.255.255.255

zeroconf
========

* Adressage:
ipv4ll: link local address for ipv4

ipv6 router advertissement: 
- https://community.infoblox.com/t5/IPv6-Center-of-Excellence/Why-You-Must-Use-ICMPv6-Router-Advertisements-RAs/ba-p/3416
- http://strugglers.net/~andy/blog/2011/09/04/linux-ipv6-router-advertisements-and-forwarding/
- https://en.wikipedia.org/wiki/IPv6_address#Stateless_address_autoconfiguration

* multicast DNS
https://www.eiman.tv/blog/posts/lannames/
LLMNR (windows) =~ mDNS (apple/avahi)
=> local name resolution

- https://www.gabriel.urdhr.fr/2019/04/02/llmnr-mdns-cli-lookup/
LLMNR: queries requests are sent to multicast address 224.0.0.252 or ff02:0:0:0:0:0:1:3 with UDP port 5355;
dig +noedns -p 5355 @224.0.0.252 wpad
(EDNS0 is disabled because the Microsoft LLMNR profile does not support EDNS0)

mdns: IPv4 address 224.0.0.251 or IPv6 address ff02::fb; UDP port 5353.
dig -p 5353 @224.0.0.251 example.local

* Protocol: upnp/zeroconf
http://www.zeroconf.org/zeroconfandupnp.html
=> services autodetection

- zeroconf: https://en.wikipedia.org/wiki/Zero-configuration_networking
  Bonjour is apple's implementation of mdns + dns-sd

  DNS-SD: uses DNS PTR, SRV, TXT records to advertise instances of service types
  More details on srv: https://en.wikipedia.org/wiki/SRV_record
    A SRV record has the form: '_service._proto.name. TTL class SRV priority weight port target.'

- UPNP uses ssdp: services announced at UDP port number 1900 and multicast address is 239.255.255.250
Note: DLNA is essentially a certified version of upnp
https://superuser.com/questions/226636/what-is-the-difference-between-dlna-and-upnp

* Applications: http://miniupnp.free.fr/
MiniUPnP project offers software which supports the UPnP Internet Gateway Device (IGD) specifications.
=> allows to do nat hole punching: https://github.com/harmony-one/harmony/blob/master/specs/p2p/nat-hole-punching-spike.md
Exemple: 
- upnpc -a 192.168.1.2 22 3333 TCP #forward router's 3333 to 192.168.1.2:22
  upnpc -r 22 [external_port] tcp #forward router's external port to localhost:22

DLNA/UPNP servers: ReadyMedia (previously MiniDLNA), MediaTomb
          clients: banshee, kodi, UPPlay, BubbleUpNP
          mpd integration: https://www.lesbonscomptes.com/upmpdcli/

http://www.bubblesoftapps.com/bubbleupnpserver2/
  Set up a public http(s) tunnel to a dlna media server

avahi
-----

ssd start avahi-daemon
Browse: avahi-browse -alr / avahi-browse --all --ignore-local --resolve --terminate
        avahi-discover [gui]
mdns resolution: https://wiki.archlinux.org/index.php/Avahi#Hostname_resolution
-> install nss-mdns and add to /etc/nsswitch.conf:
   hosts: ... mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns ...

* Alternative to avahi-browse: mdns-scan (this does not runs its own mdns
stack)
=> http://manpages.ubuntu.com/manpages/xenial/man1/mdns-scan.1.html
 It issues a mDNS PTR query to the special RR _services._dns-sd._udp.local for retrieving a list of all currently registered services on the local link.

* Services files can also be configured by resolved:
https://www.freedesktop.org/software/systemd/man/systemd.dnssd.html

Exemple:
           # /etc/systemd/dnssd/http.dnssd
           [Service]
           Name=%H
           Type=_http._tcp
           Port=80
           TxtText=path=/stats/index.html t=temperature_sensor

           $ resolvectl service meteo._http._tcp.local
           meteo._http._tcp.local: meteo.local:80 [priority=0, weight=0]
                                   169.254.208.106%senp0s21f0u2u4
                                   fe80::213:3bff:fe49:8aa%senp0s21f0u2u4
                                   path=/stats/index.html
                                   t=temperature_sensor
                                   (meteo/_http._tcp/local)

systemd
=======

resolved support llmnr+mdns: https://www.freedesktop.org/software/systemd/man/resolved.conf.html

networkd support lldp, llmnr, and ipv4ll:
LLDP: Link Layer Discovery Protocol
LLMNR: Link-Local Multicast Name Resolution
ipv4ll: link local adress, 169.254.0.0/16
+ mdns in recent versions

  NEWS
        * LLDP support has been extended, and both passive (receive-only) and
          active (sender) modes are supported. Passive mode ("routers-only") is
          enabled by default in systemd-networkd. Active LLDP mode is enabled
          by default for containers on the internal network. The "networkctl
          lldp" command may be used to list information gathered. "networkctl
          status" will also show basic LLDP information on connected peers now.

  systemd-network:
       LinkLocalAddressing=
           Enables link-local address autoconfiguration. Accepts "yes", "no",
           "ipv4", or "ipv6". Defaults to "ipv6".
       IPv4LLRoute=
           A boolean. When true, sets up the route needed for non-IPv4LL hosts
           to communicate with IPv4LL-only hosts. Defaults to false.
       LLMNR=
           A boolean or "resolve". When true, enables Link-Local Multicast
           Name Resolution[1] on the link. When set to "resolve", only
           resolution is enabled, but not host registration and announcement.
           Defaults to true. This setting is read by systemd-resolved.service(8).
      MulticastDNS= default: false


  resolved.conf:
       LLMNR=["yes"]
           Takes a boolean argument or "resolve". Controls Link-Local
           Multicast Name Resolution support (RFC 4794[1]) on the local host.
           If true, enables full LLMNR responder and resolver support. If
           false, disables both. If set to "resolve", only resolution support
           is enabled, but responding is disabled. Note that systemd-
           networkd.service(8) also maintains per-link LLMNR settings. LLMNR
           will be enabled on a link only if the per-link and the global
           setting is on.
       MulticastDNS=
           Takes a boolean argument or "resolve". Controls Multicast DNS
           support (RFC 6762[2]) on the local host. If true, enables full
           Multicast DNS responder and resolver support. If false, disables
           both. If set to "resolve", only resolution support is enabled, but
           responding is disabled. Note that systemd-networkd.service(8) also
           maintains per-link Multicast DNS settings. Multicast DNS will be
           enabled on a link only if the per-link and the global setting is
           on.
      Note: these both default to true, as seen in `systemd-analyze cat-config systemd/resolved.conf`

* with systemd-nspawn -n, the container get a dhcp address (and a ipv4ll)
$ cat 80-container-host0.network
[Match]
Virtualization=container
Name=host0

[Network]
DHCP=yes
LinkLocalAddressing=yes

[DHCP]
UseTimezone=yes

* On the host we use a dhcpserver for the ve-* adress
$ cat 80-container-ve.network
[Match]
Name=ve-*
Driver=veth

[Network]
 # Default to using a /28 prefix, giving up to 13 addresses per container.
Address=0.0.0.0/28
LinkLocalAddressing=yes
DHCPServer=yes
IPMasquerade=yes
