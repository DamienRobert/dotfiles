vim: ft=markdownlight fdm=expr

SSH via http/https
==================
http: port 80, https: port 443

- phare2.normalesup.org:443 est un serveur ssh

- Shellinabox, un émulateur de terminal accessible via navigateur web, a
  été installé sur phare (il remplace Ajaxterm qui a divers problèmes):
  https://www.normalesup.org/phare/shellinabox/

* https://www.unixmen.com/sslh-a-sslssh-multiplexer-for-linux/
  sslh accepts connections in HTTP, HTTPS, SSH, OpenVPN, tinc, XMPP, or any other protocol that can be tested using a regular expression, on the same port. This makes it possible to connect to any of these servers on port 443 while still serving HTTPS on that port

Port forwarding
===============

in représente la machine subissant le firewall
out la machine à laquelle on veut se connecter
middle la machine par laquelle on va passer

* in -> out:
in $  ssh -fCNT -L port_in:out:port_out middle
localhost:port_in -ssh> middle -> out:port_out

* out -> in -> in2: (ex: seul in peut voir in2)
in $ ssh -fCNT -R middle_port:in2:in2_port middle
middle:middle_port -ssh> in -> in2:in2

* ssh options:
-f Requests ssh to go to background just before command execution
   Implies -n: redirect stdin from /dev/null
-C compression
-N no command
-T no pty

* Be sure the connection stays active:
- autossh https://www.everythingcli.org/ssh-tunnelling-for-fun-and-profit-autossh/
- or a systemd service file:
    [Service]
    User=autossh
    ExecStart=/bin/ssh -N -o PasswordAuthentication=no -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 2222:localhost:22 -o TCPKeepAlive=yes -p 9196 -i /home/autossh/.ssh/autossh autossh@example.com
    Restart=on-failure
    RestartSec=1200
- or cf ~syst-config/scripts/port_forward.rb for a more complicated test that test the ssh forwarding is really active

Tunneling TCP
=============
(sous windows: cf mon script perl forward.pl)
cf [ip#Tunnels] for more tunnels

Tunneling TCP into intermediate TCP hosts
* in -> out:
in $ socat -d -d TCP4-LISTEN:port_in,fork,reuseaddr TCP4:middle:port_middle
middle $ socat -d -d TCP4-LISTEN:port_middle,fork,reuseaddr TCP4:out:port_out

* out -> in -> in2 (si in peut voir middle, mais pas réciproquement):
middle $ socat -d -d TCP4-LISTEN:port_in,fork,reuseaddr TCP4:in:port_in
in $ socat -d -d TCP4-LISTEND:port_in TCP4:in2:port_in2

* Tunneling udp into tcp:
- udptunnel [unactive] Tunnel UDP packets over a TCP connection
- https://github.com/wangyu-/udp2raw-tunnel
  A Tunnel which Turns UDP Traffic into Encrypted UDP/FakeTCP/ICMP Traffic by using Raw Socket,helps you Bypass UDP FireWalls(or Unstable UDP Environment) 

* Tunneling udp via intermediate udp host
sudo socat UDP4-RECVFROM:161,fork UDP4-SENDTO:localhost:10161

* Tunneling ip over udp
https://www.gabriel.urdhr.fr/2016/01/12/ip-over-udp-with-socat/

m1$ sudo socat UDP:192.0.2.2:9000,bind=192.0.2.1:9000 \
  TUN:10.0.1.1/24,tun-name=tundudp,iff-no-pi,tun-type=tun,su=$USER,iff-up<Paste>
m2$ sudo socat UDP:192.0.2.1:9000,bind=192.0.2.2:9000 \
  TUN:10.0.1.2/24,tun-name=tundudp,iff-no-pi,tun-type=tun,su=$USER,iff-up

$ ping 10.0.1.2 => passes via the tun to the 192.0.2.1 socket, which is sent to the 192.0.2.2 udp socket in m2, which goes to the 10.0.1.2 tun socket

Proxy Http
==========

http_proxy='http://user:password@prox-server:3128'

- stunnel [active]
  Stunnel is a proxy designed to add TLS encryption functionality to
  existing clients and servers without any changes in the programs' code.
  -> setup ssl tunnel

- https://github.com/AdrianVollmer/htun/ [python]

- httptunnel [last release 2007, bugfix in 2010]
  HTTPTunnel is a tunneling software that can tunnel network connections
  through restrictive HTTP proxies over pure HTTP "GET" and "POST" requests. 
  -> setup http tunnel

  in $ htc [-P proxy:80] -F port_in middle 8080
  redirige le port port_in vers middle:8080 avec une encapsulation http
  (qui peut passer par le proxy proxy:80 avec l'option -P)

  middle $ hts -F out:port_out 8080
  desencapsule l'http reçu sur le port 8080 et l'envoie sur out:port_out

- corkscrew [last release 2007], proxytunnel [last release 2008]
  Tunnel through http/https proxies.
  httptunnel can also be used to tunnel through proxies

Proxy Socks
===========
ssh -D port
    Specifies a local “dynamic” application-level port forwarding. This
    works by allocating a socket to listen to port on the local side, and
    whenever a connection is made to this port, the connec‐ tion is
    forwarded over the secure channel, and the application protocol is then
    used to determine where to connect to from the remote machine.
    Currently the SOCKS4 and SOCKS5 protocols are supported, and ssh will
    act as a SOCKS server.  Only root can forward privileged ports.
    Dynamic port forwardings can also be specified in the configuration
    file.
-> sv start ssh_socks

Proxy socks: tsocks [last relase 2002], dante [active] (socksv5, compatible udp, donc utilisable avec ssh pour faire un vpn).

Dante: SOCKS5_SERVER=localhost:44000 socksify ...
 
VPN
===

+ https://www.wireguard.com/
+ https://www.zerotier.com/
  = virtual smart switch built on a P2P network
  https://wiki.archlinux.org/index.php/Zerotier
  https://www.zerotier.com/manual/
  zerotier controller cli: https://github.com/zerotier/ZeroTierOne/issues/521
+ https://www.tinc-vpn.org/
  Similar to zerotier, decentralised
  https://news.ycombinator.com/item?id=16325394 Tinc VPN: Secure Private Network Between Hosts (tinc-vpn.org)
  [Il y a un projet de faire le mesh de tinc par dessus wireguard]
- https://github.com/jedisct1/dsvpn
  Runs on TCP. Works pretty much everywhere, including on public WiFi where only TCP/443 is open or reliable.
  Alternative (cf https://news.ycombinator.com/item?id=20571739): 
  WireGuard + UDPTunnel Or udp2raw-tunnel: https://github.com/wangyu-/udp2raw-tunnel

Wireguard
---------

- https://christine.website/blog/site-to-site-wireguard-part-1-2019-04-02
- https://wiki.archlinux.org/index.php/WireGuard
- https://gist.github.com/i4ApvDqgDV/db8b165179e0b6488f544af404b9ff0f A script to spin up a Wireguard VPN server with Unbound recursive DNS in a hurry 
- https://www.ckn.io/blog/2017/11/14/wireguard-vpn-typical-setup/

$ wg genkey | tee privatekey | wg pubkey > publickey
$ wg show / showconf / set / setconf / addconf / genkey / genpsk / pubkey

* Add mesh support:
- https://github.com/costela/wesher
- https://github.com/manuels/wireguard-p2p/issues/8
- https://vincent.bernat.ch/en/blog/2018-route-based-vpn-wireguard
- https://insom.github.io/journal/2017/04/02/ [use vxlan] => fait un vxlan entre chaque hôte, et fait du stp (spanning tree protocol) sur le bridge

* Wireguard with ospf
- https://wiki.vyos.net/wiki/Wireguard
- https://weiti.org/dn42/2018/01/05/basics-tunnels-ospf
- https://www.reddit.com/r/networking/comments/b1yz75/wireguard_ospf/

* Routing all your traffic: https://www.wireguard.com/netns/

1) Replacing The Default Route
The most straightforward technique is to just replace the default route, but add an explicit rule for the WireGuard endpoint:
  # ip route del default
  # ip route add default dev wg0
  # ip route add 163.172.161.0/32 via 192.168.1.1 dev eth0

2) Overriding The Default Route
So, instead of replacing the default route, we can just override it with two more specific rules that add up in sum to the default, but match before the default:
  # ip route add 0.0.0.0/1 dev wg0
  # ip route add 128.0.0.0/1 dev wg0
  # ip route add 163.172.161.0/32 via 192.168.1.1 dev eth0

3) Rule-based Routing
  # ip rule add to 163.172.161.0 lookup main pref 30
  # ip rule add to all lookup 80 pref 40
  # ip route add default dev wg0 table 80

4) Improved Rule-based Routing
The prior solution relies on us knowing the explicit endpoint IP that should be exempt from the tunnel, but WireGuard endpoints can roam, which means this rule may go stale. Fortunately, we are able to set an fwmark on all packets going out of WireGuard's UDP socket, which will then be exempt from the tunnel:
  # wg set wg0 fwmark 1234
  # ip route add default dev wg0 table 2468
  # ip rule add not fwmark 1234 table 2468
  # ip rule add table main suppress_prefixlength 0
[so we use main except for the default route (prefix length=0), use default wg0
except if we are already marked, use main if we are marked]

5) The New Namespace Solution
  # ip netns add physical
  # ip link set eth0 netns physical / iw phy phy0 set netns name physical
  # ip -n physical link add wg0 type wireguard
  # ip -n physical link set wg0 netns 1
  # wg setconf wg0 /etc/wireguard/wg0.conf
  # ip addr add 10.2.4.5/32 dev wg0
  # ip link set wg0 up
  # ip route add default dev wg0
Function to launch a process in the physical namespace:
  physexec() { sudo -E ip netns exec physical sudo -E -u \#$(id -u) -g \#$(id -g) "$@"; }

## Tinc

* Config:
/etc/tinc/netname/tinc.conf
/etc/tinc/netname/hosts/
/etc/tinc/netname/conf.d/

ConnectTo =
Interface =<interface>

DirectOnly =<yes|no>(no) [experimental] When this option is enabled, packets that cannot be sent directly to the destination node, but which would have to be forwarded by an intermediate node,are dropped instead.  When combined with the IndirectData option, packets fornodes for which we do not have a meta connection with are also dropped.

Forwarding =<off|internal|kernel>(internal) [experimental]This option selects
the way indirect packets are forwarded.
  - off: Incoming packets that are not meant for the local node, but which should be forwarded to another node, are dropped.
  - internal: Incoming packets that are meant for another node are forwarded by tinc internally.This  is  the  default  mode,  and  unless  you really  know you  needanother forwarding mode, don’t change it.
  - kernel: Incoming packets are always sent to the TUN/TAP device, even if the packets  are  not for  the  local  node.   This  is  less  efficient, butallows the kernel to apply its routing and firewall rules on them,and can also help debugging

LocalDiscovery =<yes|no>(no) [experimental] When  enabled,  tinc  will  try to  detect  peers  that  are  on  the  same  local  net-work.  This will allow direct communication using LAN addresses, even if both peers  are behind  a  NAT  and  they  only  ConnectTo  a  third  node  outside the NAT, which normally would prevent the peers from learning each other’s LAN address.Currently, local discovery is implemented by sending broadcast packets to the LAN during path MTU discovery.  This feature may not work in all possiblesituations

Mode =<router|switch|hub>(router) This option selects the way packets are routed to other daemons.
  - router: In  this  mode  Subnet  variables  in  the host  configuration  files  willbe used to form a routing table.  Only unicast packets of routableprotocols (IPv4 and IPv6) are supported in this mode.This  is  the  default  mode,  and  unless  you  really  know  you needanother mode, don’t change it.
  - switch: In this mode the MAC addresses of the packets on the VPN willbe used to dynamically create a routing table just like an Ethernetswitch  does.   Unicast,  multicast  and  broadcast packets  of  everyprotocol that runs over Ethernet are supported in this mode at thecost of frequent broadcast ARP requests and routing table updates.This mode is primarily useful if you want to bridge Ethernet seg-ments.
  - hub: This mode is almost the same as the switch mode, but instead everypacket  will  be  broadcast  to  the  other  daemons  while  no routingtable is managed

StrictSubnets =<yes|no>(no) [experimental]When  this  option  is  enabled tinc  will  only  use  Subnet  statements  which  arepresent in the host config files in the local/etc/tinc/netname/hosts/direc-tory.  Subnets learned via connections to other nodes and which are not presentin the local host config files are ignored.

* Host configuration variables

Address =<IP address|hostname>[<port>] [recommended]

IndirectData =<yes|no>(no) This option specifies whether other tinc daemons besides the one you specifiedwith ConnectTo can make a direct connection to you.  This is especially useful if you are behind a firewall and it is impossible to make a connection from theoutside to your tinc daemon. Otherwise, it is best to leave this option out or set it to no. [ie yes => only nodes which already have a meta connection to you will try to establish direct communication]

Subnet =<address[/prefixlength[#weight]]>The subnet which this tinc daemon
will serve.  Tinc tries to look up which otherdaemon it should send a
packet to by searching the appropriate subnet.  If thepacket  matches  a
subnet,  it  will  be  sent  to  the  daemon  who  has  this  subnetin his
host configuration file.  Multiple subnet lines can be specified for
eachdaemon.Subnets  can  either  be  single  MAC,  IPv4  or  IPv6
addresses,  in  which  case  asubnet consisting of only that single address
is assumed, or they can be a IPv4or IPv6 network address with a
prefixlength.  For example, IPv4 subnets mustbe in a form like
192.168.1.0/24, where 192.168.1.0 is the network address and 24is the
number of bits set in the netmask.  Note that subnets like
192.168.1.1/24are invalid!  Read a networking HOWTO/FAQ/guide if you don’t
understandthis.  IPv6 subnets are notated like fec0:0:0:1::/64.  MAC
addresses are notatedlike 0:1a:2b:3c:4d:5e.Prefixlength is the number of
bits set to 1 in the netmask part;  for example:netmask  255.255.255.0
would  become  /24,  255.255.252.0  becomes  /22.   Thisconforms to
standard CIDR notation as described inRFC1519
(https://www.ietf.org/rfc/rfc1519.txt)
A Subnet can be given a weight to indicate its priority over identical
Subnetsowned by different nodes. The default weight is 10. Lower values
indicate higherpriority.  Packets will be sent to the node with the highest
priority, unless thatnode is not reachable, in which case the node with the
next highest priority willbe tried, and so on.

## zerotier

$ ssd start zerotier-one
$ sudo zerotier-cli join network_id #needs port: 9993

/var/lib/zerotier-one => authtoken.secret, identity.public, identity.secret

identity.public can be regenerated via `zerotier-idtool getpublic identity.secret`. This are the keys for the vpn.
identity.secret: `zerotier-idtool generate`
all at once: `zerotier-tool generate [foo.secret] [foo.public] [vanity]`

authtoken.secret is to control the zero tier daemon (via zerotier-cli) from
a non root user:
$ sudo cat /var/lib/zerotier-one/authtoken.secret >>.zeroTierOneAuthToken
$ sudo chown user:group .zeroTierOneAuthToken
$ chmod 0600 .zeroTierOneAuthToken

Sshuttle
--------
https://github.com/sshuttle/sshuttle [was https://github.com/apenwarr/sshuttle]

sshuttle -r username@sshserver 0/0 -vv
sudo -E sshuttle -e "ssh -F $HOME/.ssh/config" -r 4a 0/0 -v

Alternative: https://github.com/ivanilves/xiringuito

openvpn
-------
Freebox: VPN routed (ie NAT)
cp ~/mine/crypt/openvpn/config* /tmp
sudo openvpn /tmp/config_openvpn_routed_dams.ovpn

If udp is blocked, use a udp forwarding:
  socat udp4-listen:30875,reuseaddr,fork STDOUT| ssh phare2 socat STDIN udp-sendto:gondolin.hd.free.fr:30875
Change the openvpn config to use localhost
  sudo openvpn /tmp/config_openvpn_routed_dams.ovpn

Tun tunnel
----------
cf systemd.networkd et systemd.netdev
- http://sleepmap.de/2015/ssh-tunnel-with-single-hop-using-systemd-network-and-autossh.html
- http://www.noah.org/wiki/tun/tap_driver
- https://wiki.archlinux.org/index.php/VPN_over_SSH
  => https://github.com/ambrop72/badvpn
  Has a tun2socks utility:
  $ ssh -TND 4711 <your_user>@<SSH_server>
  # badvpn --tundev tun0 --netif-ipaddr 10.0.0.2 --netif-netmask 255.255.255.0 --socks-server-addr localhost:4711

* https://help.ubuntu.com/community/SSH_VPN
Set up fowarding (see ip#foward) on the server B.
Create the tun devices
    ip tuntap add tun1 mode tun #or let ssh -w create the tuns: ssh -fCNT -w 0:0 1.2.3.4
    ip link set tun1 up
    ip addr add 10.0.0.100/32 peer 10.0.0.200 dev tun1
Configure a tun on the server too and then
    ssh -fCNT -w 1:1 server
Then set up routing on the client A
    ip route add 10.0.0.0/24 via 10.0.0.100
    ip route add 1.2.3.4/32 via 192.168.0.1 #ensure we keep the route to B
    ip route replace default via 10.0.0.1 #route everything via B's default gateway
And arp on the server B:
    sudo arp -sD 10.0.0.100 eth0 pub #so machines in machine B local network know to send ethernet packets to 10.0.0.100 to machineB#eth0
    Or sudo ip neigh add to 10.0.0.100 dev eth0 proxy

* Using systemd-networkd to set up the tun
sudo mkdir /run/systemd/network
sudo tee /run/systemd/network/00-tun.netdev <<EOS
[NetDev]
Description=Netdev for ssh tunnel
Name=tun1
Kind=tun
User=dams
EOS
sudo tee /run/systemd/network/00-tun.network <<EOS
[Match]
Name=tun1
[Address]
Address=10.0.42.2
Peer=10.0.42.1
EOS

## Windscribe
This adds a tun0 with 10.115.206.216/23
IP: 185.232.20.251

$ ip route:
0.0.0.0/1 via 10.115.206.1 dev tun0 
default via 192.168.0.1 dev ipvl0 
10.115.206.0/23 dev tun0 proto kernel scope link src 10.115.206.216 
128.0.0.0/1 via 10.115.206.1 dev tun0 
185.232.20.195 via 192.168.0.1 dev ipvl0 
192.168.0.0/24 dev ipvl0 proto kernel scope link src 192.168.0.57 

$ iptables-save
:INPUT ACCEPT [307:98648]
:FORWARD ACCEPT [0:0]
:OUTPUT DROP [0:0]
-A OUTPUT ! -o tun+ -p tcp -m tcp --dport 53 -j DROP
-A OUTPUT ! -o tun+ -p udp -m udp --dport 53 -j DROP
-A OUTPUT -d 192.168.0.0/16 -j ACCEPT
-A OUTPUT -d 10.0.0.0/8 -j ACCEPT
-A OUTPUT -d 172.16.0.0/12 -j ACCEPT
-A OUTPUT -o tun+ -j ACCEPT
-A OUTPUT -d 127.0.0.1/32 -j ACCEPT
-A OUTPUT -d 185.232.20.195/32 -j ACCEPT
