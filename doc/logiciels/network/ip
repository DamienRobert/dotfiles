vim: ft=markdownlight fdm=expr

Documentation
=============

* Books: https://www.quora.com/What-is-the-best-way-resource-to-learn-Linux-networking-concepts-and-practices-like-open-source-training-manuals-and-hand-outs
- Guide to IP Layer Network Administration with Linux: http://linux-ip.net/html/index.html [2007]
- Linux Advanced Routing & Traffic Control HOWTO: http://tldp.org/HOWTO/Adv-Routing-HOWTO/index.html [2002-07-22]
  Newer version: https://www.lartc.org/ [2012-05]
- IP Command Reference (by the author of iproute, Alexey Kuznetsov's): http://linux-ip.net/gl/ip-cref/ip-cref.html [1999]
- http://www.policyrouting.org/iproute2.doc.html
  From Policy Routing With Linux - Online Edition, by Matthew G. Marsh [2001]
  http://www.policyrouting.org/PolicyRoutingBook/ONLINE/TOC.html
  [expand the above ip command reference]
- http://freecomputerbooks.com/Linux-Network-Administrators-Guide-2nd-Edition.html [2000]
  Pdf: http://www.tldp.org/LDP/nag2/nag2.pdf
- https://www.oreilly.com/library/view/understanding-linux-network/0596002556/

* Cheatsheets
- Cheatsheet: https://www.computerhope.com/unix/ip.htm
              https://packetpushers.net/linux-ip-command-ostensive-definition/
- https://www.tecmint.com/linux-networking-commands/

* Network:
- Arp (Address resolution protocol): Layer 3 MAC <-> IP
- FDB (Forward database): Layer 2 MAC <-> corresponding port of the bridge
- Realm: https://en.wikipedia.org/wiki/Realm-Specific_IP
  (Note this is different from 'ip route realm' which simply are a way to
  group certain routes)

* TCP
- https://stackoverflow.com/questions/3757289/tcp-option-so-linger-zero-when-its-required
  cf aussi ens.forum.informatique.internet:858 et 855
  et https://www.nybek.com/blog/2015/03/05/cross-platform-testing-of-so_linger/
- https://stackoverflow.com/questions/740817/behavior-of-shutdownsock-shut-rd-with-tcp
- https://news.ycombinator.com/item?id=21044529
  - close(): socket will be lingering in background as usual
  - shutdown(SHUT_RD): no network side effect, discards read buffer
  - shutdown(SHUT_WR): equivalent to FIN SO_LINGER socket - if timeout non-zero blocks until write buffer flushed; if timeout is zero then immediately sends RST
  - the trick with close() after TCP_REPAIR: (https://lwn.net/Articles/495304/) immediately discard a socket with no network side effects.
  - "ss --kill" command: forcefully close a socket from outside process, done with netlink SOCK_DESTROY command. 
  - shutdown(SHUT_RD): seem not to have _any_ side effects. you can totally still recv() on that socket. Kerrisk writes 61.6.6: "However if the peer application subsequently writes data on its socket, then it is still possible to read that data on the local socket". Basically, SHUT_RD makes recv() return 0. That's all it does.
  - SO_LINGER on O_NONBLOCK: shutdown() doesn't block. close() still blocks. 

* Tools:
- tc show / manipulate traffic control settings (qos)
- ss: replacement of netstat

* Linux:
- http://vger.kernel.org/~davem/skb.html socket buffer, or "SKB"
  http://vger.kernel.org/~davem/skb_data.html
- http://amsekharkernel.blogspot.com/2014/08/what-is-skb-in-linux-kernel-what-are.html


* TOS
- https://en.wikipedia.org/wiki/Type_of_service
  https://en.wikipedia.org/wiki/Explicit_Congestion_Notification
- https://www.slashroot.in/understanding-differentiated-services-tos-field-internet-protocol-header
=> 8 bits, bits 0-5 = DSCP (differentiated service codepoint)
                6-7 = ECN (explicit congestion notification)
   DSCP = CS (class selector) 3 bits
   CS: CS0 = 000000 [default]
       CS1 = 001000
       ...
       CS7 = 111000
   Note: CS6 and CS7 is reserved for network protocol and control related stuff. This means that CS5 class value is the highest class value.

   CS1 to CS4 can have a drop precedence of low (01), medium (10) and high (11) (high drop precedence will get dropped more than low drop precedence)

   Setting drop precedence means the dscp if of type AF (assured forwarding)
   => AF11 = 001010 = CS1 + low drop precedence
      AF12 = 001100 = CS1 + medium drop precedence
      AF13 = 001110 = CS1 + high drop precedence
      ...
      AF43 = 100110 = CS4 + high drop precedence
   
   CS5 does not have drop precedence. But we can add '11' to make it of
   class EF (expediated forwarding):
   => EF = 101110

ip
==
http://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/
https://tty1.net/blog/2010/ifconfig-ip-comparison_en.html

ip l / ip link
ip a / ip addr
ip r / ip route

Options:
-s, -stats, -statistics
-d, -details
-a, -all
-br, -brief

## ip link
* Change
$ ip link set eth0 up/down
Rename interface: $ ip link set old_name name new_name
Specify a group: $ ip link set eth1 group 1 [we cannot set a group directly
when adding a device]

* Add
$ sudo ip link add v-eth1 type veth peer name v-peer1
$ sudo ip link add foobar type dummy

* Show
$ ip link show wlan0
    3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
        link/ether 80:19:34:0c:f6:48 brd ff:ff:ff:ff:ff:ff
$ ip -br link show eno1 #-br = -brief
eno1             DOWN           08:60:6e:e6:08:c7 <NO-CARRIER,BROADCAST,MULTICAST,UP> 

* Options
        group GROUP
            specify the group the device belongs to.  The available groups
            are listed in file /etc/iproute2/group.

## ip addr

ip address show [dev] eth0: Shows the addresses assigned to network interface eth0
ip addr add 2001:0db8:85a3::0370:7334/64 dev eth1: Adds an IPv6 address to network interface eth1
ip addr add 192.168.1.2/24 dev eth0
 # Nowadays the broadcast is set up correctly from the netmask, no need to specify it directly
 # ip addr add 192.168.1.2/24 broadcast 192.168.1.255 dev eth0
ip a add 192.168.1.200/255.255.255.0 dev eth0
ip addr del 192.168.0.77/24 dev eth0
ip addr flush dev eth4: Removes all addresses from device eth4

* Add alias interface: ip addr add 10.0.0.1/8 dev eth0 label eth0:1
https://www.kernel.org/doc/html/latest/networking/alias.html
    IP-aliases are an obsolete way to manage multiple IP-addresses/masks
    per interface. Newer tools such as iproute2 support multiple
    address/prefixes per interface, but aliases are still supported for
    backwards compatibility.
(ifconfig won't show extra addresses if they are not added with an alias)

* Show
$ ip a s wlan0 / ip addr show wlan0
    3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
        link/ether 80:19:34:0c:f6:48 brd ff:ff:ff:ff:ff:ff
        inet 172.17.2.186/24 brd 172.17.2.255 scope global dynamic wlan0
           valid_lft 2705sec preferred_lft 2705sec
        inet6 fe80::8219:34ff:fe0c:f648/64 scope link 
           valid_lft forever preferred_lft forever

[ifconfig: ifconfig eth0 "$1" broadcast "$2" netmask "$3"
           route add default gw "$2"
           echo "nameserver $3" > /etc/resolv.conf]

$ ip -br show wlan0
wlp6s0           UP             192.168.0.11/24 fe80::de85:deff:fe74:f5f5/64 

* peer:
$ sudo ip a add dev foobar 42.1.0.2 peer 42.2.0.1/24
    inet 42.1.0.2 peer 42.2.0.1/24 scope global foobar
$ ip r
    42.2.0.0/24 dev foobar proto kernel scope link src 42.1.0.2 

## ip neigh

ip neigh replace the arp utility

* add
ip neigh add 192.168.0.1 lladdr 00:11:22:33:44:55 nud permanent dev eth0
ip link set dev eth0 arp off #switch off arp

* proxy:
Was supposed to be deprecated, cf
http://lkml.iu.edu/hypermail/linux/kernel/0110.2/0523.html
but still there.
ip neighbor add proxy 192.168.100.1 dev eth0
(note they are not shown in ip neigh show by default, we need to use
`ip neigh show proxy`)

* Show:
$ ip neigh
192.168.0.17 dev wlp6s0 lladdr f0:d5:bf:b7:d1:53 REACHABLE
192.168.0.1 dev wlp6s0 lladdr 24:7f:20:ab:5e:44 DELAY

* Ping: arping

### arp proxy:


* via proxy_arp sysctl
- https://wiki.debian.org/BridgeNetworkConnectionsProxyArp
The bridge host will proxy ARP requests from the inside network to the outside, and respond to ARPs from the outside network on behalf of inside hosts. Linux will only do this for hosts that are known via the routing table, so a /32 host route must be created pointing to the inside host (one for each inside host). The route is also required for IP forwarding to work, i.e. when IP traffic arrives after the ARP process has completed. 
  bridge# echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
  bridge# echo 1 > /proc/sys/net/ipv4/ip_forward
  bridge# ip ro add 10.42.0.11/32 dev eth0

- https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
proxy_arp - BOOLEAN
	Do proxy arp.
	proxy_arp for the interface will be enabled if at least one of
	conf/{all,interface}/proxy_arp is set to TRUE,
	it will be disabled otherwise

=> More details here: https://blog.noc.grnet.gr/2018/09/10/arp-proxy-going-rogue-part-2-tracing-the-kernel/
For every ARP request linux will lookup the routing tables for the destination IP. Most probably a route will be found, even if it’s the default gateway. Then, in case proxy_arp is enabled and if and only if the host would route traffic to that destination IP through a device that is different than one the ARP request originated from, then a ARP reply will be produced.

=> https://serverfault.com/questions/212074/is-it-possible-to-use-proxy-arp-back-to-the-same-interface
But enabling proxy_arp_pvlan allow to proxy even if the destination ip is
on the same interface.
proxy_arp_pvlan - BOOLEAN
    Private VLAN proxy arp.
    Basically allow proxy arp replies back to the same interface
    (from which the ARP request/solicitation was received).

* by hand http://linux-ip.net/html/adv-proxy-arp.html
    - arp -s $IPADDR -i $INTERFACE -D $INTERFACE pub
    (-D use this device ethernet address, -i: associate the arp to this
    interface [if not specified the kernel uses the routing table to
    guess])

    Note that arp's man page says:
    /usr/sbin/arp -i eth0 -Ds 10.0.0.2 eth1 pub
       This will answer ARP requests for 10.0.0.2 on eth0 with the MAC address
       for eth1.
    but in practice this does not seems to work, I get
    10.0.0.2   *   <from_interface>    MP enp0s25
    so it will answer with enp0s25's interface.

    - $ ip neigh add proxy $IPADDR dev $INTERFACE

* parprouted is designed to monitor the ARP table and both proxy ARP requests and install matching /32 host routes. Running parprouted with the inside and outside interfaces handles the ARP and routing completely automatically. Note that the kernel's proxy ARP mechanism (/proc/sys/net/ipv4/conf/all/proxy_arp) is not required. 
  https://linux.die.net/man/8/parprouted

* Other arp settings:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/networking/ip-sysctl.txt?h=v4.19#n1171
Note that arp_filter by default is 0: The kernel can respond to arp requests with addresses from other interfaces.

## ip route
* Doc
- http://cpham.perso.univ-pau.fr/ENSEIGNEMENT/UERHD/DescriptifCmdIP.pdf
- Plus de détails dans le livre: http://linux-ip.net/html/tools-ip-route.html
- realm: http://linux-ip.net/gl/ip-cref/ip-cref-node172.html#RT-REALMS
  (classify routes together => rtacct)
- route lookups are stored in fib table: https://vincent.bernat.ch/en/blog/2017-ipv4-route-lookup-linux

* Usage
ip route => ip route show => ip route show table main

* ip route add
ip route add {NETWORK/MASK} via {GATEWAYIP}
ip route add {NETWORK/MASK} dev {DEVICE}
ip route add ... src SRC => when we have several ip, prefer using this SRC when using this route

Exemples:
ip route add default [via] 192.168.1.1
ip route add 192.168.1.0/24 via 192.168.1.254
ip route add 192.168.1.0/24 dev eth0 #route via eth0

Note: ip route add 192... is a shortcut for ip route add unicast 192...
The other route types are unreachable, blackhole, prohibit, local, broadcast, throw, nat[no longer supported], anycast, multicast.
Eg: ip route add prohibit 209.10.26.51 [from 192.168.99.35]

* specify several hops
ip route add default nexthop via 10.10.10.1 weight 1 nexthop dev ens33 weight 10
[sends 10 packets to ens33 for 1 packet to 10.10.10.1]

* Other options:
ip route add TYPE=unicast/unreachable to ...
ip route add to $IPADDR scope global protocol static preference 42 ...
ip route ... encap ...: attach tunnel encapsulation to this route

- TYPE=unicast,unreachable,blackhole,prohibit,local,broadcast,throw,[nat]
- preference number [lower = prefered]
- pref: low/medium/high [ipv6 preference]
- protocol: redirect/kernel/boot [default]/static (=boot but routing daemon preserve these routes)/ra
- encap: mpls, ip, bpf, seg6
- scope: host/link/global
  If this parameter is omitted, ip assumes scope global for all gatewayed
  unicast routes, scope link for direct unicast and broadcast routes and scope
  host for local routes.

  Scope | Description (https://serverfault.com/questions/63014/ip-address-scope-parameter)
  global | valid everywhere
  site | valid only within this site (IPv6)
  link | valid only on this device
  host | valid only inside this host (machine)
- onlink: pretend that the nexthop is directly attached to this link, even if it does not match any interface prefix.
- dsfield TOS (route only packets with a specific tos)
- realm REALMID (set up the dest. realm of the route)
- metric METRIC (routing order is most specific first, then according to metric. Lower metric have higher precedence, no metric means metric=0)

* Flush the cache:
$ ip route flush cache

* Simulate a route:
$ ip route get 20.10.3.3

### Encap
- https://lwn.net/Articles/651497/ lightweight tunnels:
  VXLAN:
  $ ip route add 40.1.1.1/32 encap vxlan id 10 dst 50.1.1.2 dev vxlan0
  MPLS:
  $ ip route add 10.1.1.0/30 encap mpls 200 via inet 10.1.1.1 dev swp1

  [mpls: https://archive.nanog.org/meetings/nanog49/presentations/Sunday/mpls-nanog49.pdf]

- https://lwn.net/Articles/722804/ IPv6 segment routing (srh)

  Tutorial:
  https://segment-routing.org/index.php/Implementation/ConfigureEncapsulation
  # ip -6 route add fc42::/64 via NH encap seg6 mode encap segs fc00:12,fc00:89
    - fc42::/64: the matching prefix for encapsulation
    - via NH: the "default" next-hop for the route. It can be the next-hop that would normally be used to forward the traffic for the matching prefix, but it does not really matter as the kernel will restart its routing decision process to route the SR-enabled packet to the first segment. Also, the Linux IPv6 stack requires a route to have a valid IPv6 next-hop in order to support features such as ECMP, in order to avoid issues with routes such as ff00::/8 and fe80::/64 that are automatically assigned to each IPv6-enabled interface.
    - encap seg6: this tells the kernel to give the packet to the SR-IPv6 subsystem.
    - mode encap: this specifies the encapsulation mode. Two values are possible: encap creates an outer IPv6 header with the SRH attached, followed by the original, unmodified inner packet. The other value, inline, directly attach the SRH to the original IPv6 packet. The encap mode should be used, unless you know what you are doing.
    - segs fc00:12,fc00:89: a list of comma-separated segments 

* Details:
  - https://translate.google.com/translate?sl=auto&tl=en&u=https%3A%2F%2Fblog.csdn.net%2Fsinat_20184565%2Farticle%2Fdetails%2F84952713

  Rather than configuring the local routes via 'ip link', one use 'ip link
  ... external' and then uses encapsulation routes

   $ ip link add dev vxlan1 type vxlan id 30001 remote 20.1.1.2 dstport 4789
   $ ip route add 10.1.1.1 dev vxlan1

   $ ip link add dev gnv0 type geneve remote 192.168.100.3 vni 1234 dstport 5678
   $ ip route add 172.16.20.1 dev gnv0

   becomes

   $ ip link add vxlan1 type vxlan dstport 4789 external
   $ ip link set dev vxlan1 up
   $ ip addr add 20.1.1.1/24 dev vxlan1
   $ ip route add 10.1.1.1 encap ip id 30001 dst 20.1.1.2 dev vxlan1

   $ ip link add gnv0 type geneve external
   $ ip link set dev gnv0 up
   $ ip route add 172.16.20.1/32 encap ip id 1234 dst 192.168.100.3 dev gnv0

  - https://linux.cn/article-10672-1.html
  Décrit comment ils combinent des gretap + vrf (pour l'isolation) + nft
  (pour l'offloading) et les patchs soumis au noyau linux pour tout faire
  marcher

    $ ip l add dev tun type gretap external
    $ ifconfig tun 1.1.1.7/24 up
    $ ip r r 2.2.2.11 via 1.1.1.11 dev tun encap ip id 1000 dst 172.168.0.1 key
    (le id 1000 crée un tunnel interne avec le TUNNEL_ID=1000; 'key' sans
    rien => j'imagine qu'il utilise le TUNNEL_ID)
    => set tunnel properties by routing, which avoids managing a large number of tunnel devices
   cf le patch
    https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=3d65cefbefc86a53877f1e6461a9461e5b8fd7b3
   qui permet de rajouter key, csum, seq à 'encap ip...'
   cf aussi ce patch 
   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/commit/?id=0fb4d21956f4a9af225594a46857ccf29bd747bc
   http://patchwork.ozlabs.org/patch/1025554/
   qui ajoute
   `nft add rule firewall rules-all meta iifkind "vrf" counter accept`
   pour empecher des interactions bizarres entre le nat, les rules et le
   vrf (le même paquet étant vu deux fois, une fois via l'interface
   esclave, l'autre via le vrf, on peut avoir des règles contradictoires)
  
  - https://github.com/torvalds/linux/commit/af308b94a2a4a5a27bec9028354c4df444a7c8ba
     netfilter: nf_tables: add tunnel support 

  - https://serverfault.com/questions/985656/linux-lightweight-tunnels

## ip rule

https://openwrt.org/docs/guide-user/network/ip_rules

* ip rule => Multiple routing tables:
https://unix.stackexchange.com/questions/345862/is-it-possible-to-have-multiple-default-gateways-for-outbound-connections

$ ip rule
0:	from all lookup local # handled by the kernel
32766:	from all lookup main
32767:	from all lookup default

$ ip route show table local
...

 # give the name 'special' to the table 7
echo 7 special >> /etc/iproute2/rt_tables

$ sudo ip rule add to 10.10.10.10/32 lookup 123 priority 10
Note: pref is an alias to priority.
If not specified, use the highest lowest priority possible: for instance if the lowest priority is 100, then the new rule has priority 99.

* Exemple: https://www.linuxjournal.com/content/linux-advanced-routing-tutorial
$ echo "121 dmz" >> /etc/iproute2/rt_tables
$ ip route add default via 203.0.113.37 dev vlan-shdsl table dmz
$ ip rule add pri 1000 from 203.0.113.208/28 iif vlan-dmz lookup dmz

* Details
       SELECTOR := [ not ] [ from PREFIX ] [ to PREFIX ] [ tos TOS ] [ fwmark
               FWMARK[/MASK] ] [ iif STRING ] [ oif STRING ] [ pref/priority NUMBER ] [ l3mdev ] [ uidrange NUMBER-NUMBER ] [ ipproto PROTOCOL ] [ sport [ NUMBER | NUMBER-NUMBER ] ] [ dport [ NUMBER | NUMBER- NUMBER ] ] [ tun_id TUN_ID ]
       ACTION := [ table TABLE_ID ] [ protocol PROTO ] [ nat ADDRESS ] [ realms [SRCREALM/]DSTREALM ] [ goto NUMBER ] SUPPRESSOR
       SUPPRESSOR := [ suppress_prefixlength NUMBER ] [ suppress_ifgroup GROUP]

* Types:
       The RPDB may contain rules of the following types:
        -  unicast - the rule prescribes to return the route found in the routing table referenced by the rule.
        -  blackhole - the rule prescribes to silently drop the packet.
        - unreachable - the rule prescribes to generate a 'Network is unreachable' error.
        - prohibit - the rule prescribes to generate 'Communication is administratively prohibited' error.
        [- nat - the rule prescribes to translate the source address of the IP packet into some other value. (deprecated)]

        Exemple: ip rule add unreachable iif eth2 tos 0xc0
                 ip rule add to 10.17.100.1 prohibit

* Action:
goto NUMBER => go to this rule priority number
 Exemple: sudo ip rule add from 10.17.100.2 goto 1
          => Error: Backward goto not supported.

* Options:
              suppress_prefixlength NUMBER
                     reject routing decisions that have a prefix length of
                     NUMBER or less.

              suppress_ifgroup GROUP
                     reject routing decisions that use a device belonging to
                     the interface group GROUP.

* Realm http://linux-ip.net/gl/ip-cref/ip-cref-node172.html#RT-REALMS

 For each packet the kernel calculates a tuple of realms: source realm and destination realm, using the following algorithm:
  1. If the route has a realm, the destination realm of the packet is set to it.
  2. If the rule has a source realm, the source realm of the packet is set to it. If the destination realm was not inherited from the route and the rule has a destination realm, it is also set.
  3. If at least one of the realms is still unknown, the kernel finds the reversed route to the source of the packet.
  4. If the source realm is still unknown, get it from the reversed route.
  5. If one of the realms is still unknown, swap the realms of reversed routes and apply step 2 again.
  After this procedure is completed we know what realm the packet arrived from and the realm where it is going to propagate to. If some of the realms are unknown, they are initialized to zero (or realm unknown). 

  Exemple: ip rule add to 10.17.100.2 realms 2/
  => from all to 10.17.100.2 lookup main realms 2/cosmos
           ip rule add to 10.17.100.2 realms 4/5
  => 32762:	from all to 10.17.100.2 lookup main realms 4/5

  Application as a tc filter: https://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.adv-filter.route.html

  Match any packet that has a route entry
  $ tc filter add dev eth1 parent 1:0 protocol ip prio 100 route classid CLASSID

  Route to realm 10 go to class 1:10
  $ ip route add 192.168.10.0/24 via 192.168.10.1 dev eth1 realm 10
  $ tc filter add dev eth1 parent 1:0 protocol ip prio 100 route to 10 classid 1:10

  Route from realm 2 go to class 1:2
  $ ip route add 192.168.2.0/24 dev eth2 realm 2
  $ tc filter add dev eth1 parent 1:0 protocol ip prio 100 route from 2 classid 1:2

* l3mdev: https://netdevconf.org/1.2/papers/ahern-what-is-l3mdev-paper.pdf
 L3  Master  Device  (l3mdev) is  a  separate  API  that  can  be  leveraged  by other  drivers  that  want  to  influence  FIB  lookups  or  want  to manipulate  packets  at  layer. Used by VRF and ipvlan.

 When a VRF device is created, a rule of type l3mdev and prio 1000 is
 automatically created, so there is no need usually to configure it. A VRF
 associate a virtual device to a specific routing table, and the l3mdev
 rule associate the lookup of each vrf to its corresponding table. Cf VRF
 below for more details.

 IE when doing $ ip link add vrf-blue type vrf table 10
 the l3mdev rule is equivalent to doing
     $ ip ru add oif vrf-blue table 10
     $ ip ru add iif vrf-blue table 10
 for every vrf [with the benefit that it is only one rule, vs 2*N rules for
 N vrf]

## ip tunnel

ip tunnel -> ipip, sit, isatap, vti, gre
  Note: it seems like `ip link` can also set up a ipip,... tunnel.
ip tuntap #ex: ip tuntap add name tap0 mode tap
ip fou, ip gue #for receive port configuration; use ip link for transmit

* IPIP and Gre

- Can be created by ip tunnel or ip link:
sudo ip tunnel add ipiptun mode ipip local 10.3.3.3 remote 10.4.4.4 ttl 64 dev eno1
sudo ip link add ipiptun2 type ipip local 10.6.6.6 remote 10.7.7.7 ttl 64 dev eno1 #curiously the mode is any/ip here
    ipiptun: ip/ip remote 10.4.4.4 local 10.3.3.3 dev eno1 ttl 64
    ipiptun2: any/ip remote 10.7.7.7 local 10.6.6.6 dev eno1 ttl 64

  local address:
    local ADDRESS [can also put an interface name (or maybe this is set in `dev
    device`)]
    set the fixed local address for tunneled packets.  It must be an address on another interface of this host.

- gre: ip link add name gre1 type gre local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR [seq] key KEY

- Full ipip exemple:
  https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#gre
  Note: When the ipip module is loaded, or an IPIP device is created for the first time, the Linux kernel will create a tunl0 default device in each namespace, with attributes local=any and remote=any. When receiving IPIP protocol packets, the kernel will forward them to tunl0 as a fallback device if it can’t find another device whose local/remote attributes match their source or destination address more closely.

  $ ip link add name ipip0 type ipip local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR
  $ ip link set ipip0 up
  $ ip addr add INTERNAL_IPV4_ADDR/24 dev ipip0
  Add a remote internal subnet route if the endpoints don't belong to the same subnet
  $ ip route add REMOTE_INTERNAL_SUBNET/24 dev ipip0

  Note that https://wiki.linuxfoundation.org/networking/tunneling show that
  we can use peer also: 
  $ ip tunnel add ipiptun mode ipip local 10.3.3.3 remote 10.4.4.4 ttl 64 dev eth0
  $ ip addr add dev ipiptun 10.0.0.1 peer 10.0.0.2/32
  $ ip route add 10.4.10.0/24 via 10.0.0.2 #this allow to use via rather than dev

- One can also encapsulate in fou/gue:
$  ip link add name tun1 type ipip remote 192.168.1.1 local 192.168.1.2 ttl 225  encap fou encap-sport auto encap-dport 5555

* Fou / Gue
Both sides fou:
  receive  $ ip fou add port 5555 ipproto 4 #for gre: ipproto 47.
  transmit $  ip link add name tun1 type ipip \
       remote 192.168.1.1 local 192.168.1.2 ttl 225 \
       encap fou encap-sport auto encap-dport 5555

Both sides gue:
  Server A # ip fou add port 5555 gue
  Server B # ip link add name tun1 type ipip remote 192.168.1.1 local 192.168.1.2 ttl 225 encap gue encap-sport auto encap-dport 5555

## (Dumb) nat
http://linux-ip.net/html/nat-stateless.html

$ ip route add nat 205.254.211.17 via 192.168.100.17
=> the parameter via tells the NAT code to rewrite the packet bound for
205.254.211.17 with the new destination address 192.168.100.17. Note, that
this only handles inbound packets; that is, packets whose destination
address contains 205.254.211.17.
[Note: no longer supported since linux 2.6]

$ ip rule add nat 205.254.211.17 from 192.168.100.17 
=> rewrite any packet from 192.168.100.17 with the specified source address
(205.254.211.17). Any packet originating from 192.168.100.17 which passes
through this router will trigger this rule. In short, this command rewrites
the source address of outbound packets so that they appear to originate
from the NAT IP.
[for a subnet: ip rule add nat 205.254.211.32 from 192.168.100.32/29]

[root@masq-gw]# ip route show table all | grep ^nat                 4
nat 205.254.211.17 via 192.168.100.17  table local  scope host
[root@masq-gw]# ip rule show                                        5
0:      from all lookup local 
32765:  from 192.168.100.17 lookup main map-to 205.254.211.17 
32766:  from all lookup main 
32767:  from all lookup 253

Remark: doing that I get `Warning: route NAT is deprecated`

## Divers:

* Files
/etc/protocols: ip protocols

Route Configuration:
- scope: SCOPE_VAL may be a number or a string from the file /etc/iproute2/rt_scopes.
  [global nowhere host link site]
- protocol RTPROTO: /etc/iproute2/rt_protos
  [redirect kernel boot static gated ra...]
- realm REALMID: /etc/iproute2/rt_realms
  [cosmos]
- route table: /etc/iproute2/rt_tables
  [local main default]
- dsfield TOS: /etc/iproute2/rt_dsfield

Ip link configuration:
- group GROUP: /etc/iproute2/group [default]

Tc configuration:
- /etc/iproute2/tc_cls #map class id to class name

iw
==

iw dev wlan0 link #Getting link status.
  Shortcut: iw wlp2s0 link
iw dev wlan0 info #interface info
iw dev wlan0 set power_save on #Enabling power save.

iw dev wlan0 scan #Scanning for available access points.
iw dev wlan0 set type ibss #Setting the operation mode to ad-hoc.
iw dev wlan0 connect your_essid #Connecting to open network.
iw dev wlan0 connect your_essid 2432 #Connecting to open network specifying channel.
iw dev wlan0 connect your_essid key 0:your_key #Connecting to WEP encrypted network

Create an interface from a phy (cf https://iwd.wiki.kernel.org/interface_lifecycle):
iw dev / iw phy: list interfaces and phy
sudo iw phy phy0 interface add wlp2s0 type station

bridge
======

Replace brctl

* fdb (forwarding database entry)
bridge fdb - forwarding database management
       fdb objects contain known Ethernet addresses on a link.
$ bridge fdb (=bridge fdb show)

bridge fdb { add | append | del | replace } LLADDR dev DEV { local |
               static | dynamic } [ self ] [ master ] [ router ] [ use ] [ ex‐
               tern_learn ] [ sticky ] [ dst IPADDR ] [ src_vni SRC_VNI ] [
               vni VNI ] [ port PORT ] [ via DEVICE ]

* link
bridge link => show bridge interfaces created with
 # ip link add name bridge_name type bridge
 # ip link set bridge_name up
 # ip link set eth0 master bridge_name
 
* mdb (multicast group database entry)

* vlan (vlan filter list)

* monitor

wpa_supplicant
==============

wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf
wpa_supplicant -B -i interface -c <(wpa_passphrase essid passphrase)

$ wpa_passphrase essid passphrase
network={
    ssid="essid"
    #psk="passphrase"
    psk=f5d1c49e15e679bebe385c37648d4141bc5c9297796a8a185d7bc5ac62f954e3
}

tc
==

Bandwidth tests: iperf3

* Articles:
- https://web.archive.org/web/20190427083833/https://www.coverfire.com/articles/queueing-in-the-linux-network-stack/
- Nice tutorial: https://medium.com/criteo-labs/demystification-of-tc-de3dfe4067c2
- Hardware offload: https://github.com/Mellanox/mlxsw/wiki/ACLs

* Some modern qdiscs:
- codel: https://queue.acm.org/detail.cfm?id=2209336
- cake: https://www.bufferbloat.net/projects/codel/wiki/Cake/
        http://man7.org/linux/man-pages/man8/tc-cake.8.html

* Doc
- https://wiki.archlinux.org/index.php/Advanced_traffic_control
- https://wiki.debian.org/TrafficControl
- http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:networking:traffic_control

* Basic usage
- Change a qdisc:
qdisc tbf: token bucket filter
$ tc qdisc add dev eth1 root tbf rate 220kbit latency 50ms burst 1540
$ tc qdisc add dev eth0 root tbf rate 1mbit burst 32kbit latency 400ms

qdisc sfq: stochastic fairness queueing
$ tc qdisc add dev eth1 root sfq perturb 10

- Delete a qdisc:
$ tc qdisc del dev eth1 root

- Stats (-s) and details (-d)
$ tc -s -d qdisc show [dev device]

Note: for tc filter, it seems that 'classid' is a synonym for 'flowid'

* Default qdisc: cat /proc/sys/net/core/default_qdisc
  ie sysctl net.core.default_qdisc

## Stateless qdisc
- noqueue
- pfifo_fast [original default]
- fq_codel (cf https://lists.fedoraproject.org/pipermail/devel/2015-March/209508.html)
- tc-sfq: Stochastic Fairness Queueing
  Hash a packet to a random bucket, which is dequeued in a round robin
  fashion. The quantum is the number of bytes that is dequeued (by default
  the mtu) by round robin.
  The hash value can be selected more finely with 'tc filter ... flow'
  [flow set the classid so I guess sfq uses that. I don't know if it looks
  at the skb priority too]
- tc-red: Random  Early  Detection
  Randomly drop packets if the size is too large
  (note sfq can be configured with a red mode for each flow)
  tc-choke is a variation of red (using packets instead of bytes).
  tc-sfb - Stochastic Fair Blue (Unlike  RED,  where  the  marking  probability has to be configured, BLUE tries to determine the ideal marking probability automatically.)

* https://linux.die.net/man/8/tc-pfifo_fast
3 queues

* http://man7.org/linux/man-pages/man8/tc-codel.8.html

  CoDel (pronounced "coddle") is an adaptive "no-knobs" active queue
  management algorithm (AQM)

       tc qdisc ... codel [ limit PACKETS ] [ target TIME ] [ interval TIME
       ] [ ecn | noecn ] [ ce_threshold TIME ]

* http://man7.org/linux/man-pages/man8/tc-fq_codel.8.html

   FQ_Codel (Fair Queuing Controlled Delay) is queuing discipline that
   combines Fair Queuing with the CoDel AQM scheme. FQ_Codel uses a
   stochastic model to classify incoming packets into different flows and
   is used to provide a fair share of the bandwidth to all the flows using
   the queue. Each such flow is managed by the CoDel queuing discipline.
   Reordering within a flow is avoided since Codel internally uses a FIFO
   queue.

       tc qdisc ... fq_codel [ limit PACKETS ] [ flows NUMBER ] [ target
       TIME ] [ interval TIME ] [ quantum BYTES ] [ ecn | noecn ] [
       ce_threshold TIME ] [ memory_limit BYTES ]

* http://man7.org/linux/man-pages/man8/tc-cake.8.html
       tc qdisc ... cake
    SHAPER PARAMETERS:
       [ bandwidth RATE | unlimited* | autorate-ingress ]
    OVERHEAD COMPENSATION PARAMETERS
       [ overhead N | conservative (= overhead 48 atm) | raw* ]
       [ ptm | atm | noatm* ]
       [ mpu N ]
    ROUND TRIP TIME PARAMETERS
       [ rtt TIME | datacentre | lan | metro | regional | internet* | oceanic | satellite | interplanetary ]
    FLOW ISOLATION PARAMETERS
       [ flowblind | srchost | dsthost | hosts | flows | dual-srchost | dual-dsthost | triple-isolate* ]
       [ nat | nonat* ]
    PRIORITY QUEUE PARAMETERS
       [ besteffort | diffserv8 | diffserv4 | diffserv3* ]
       [ fwmark MASK ]
    OTHER PARAMETERS
       [ wash | nowash* ]
       [ split-gso* | no-split-gso ]
       [ memlimit LIMIT ]

    ???
       [ ack-filter | ack-filter-aggressive | no-ack-filter* ]
       [ ingress | egress* ]

  - Override priority tin: To assign a priority tin, the major number of the priority field needs to match the qdisc handle of the cake instance; if it does, the minor number will be interpreted as the tin index.
  $ tc qdisc replace dev eth0 handle 1: root cake diffserv3
  $ tc filter add dev eth0 parent 1: protocol ip prio 1 u32 match icmp type 0 0 action skbedit priority 1:3 #set priority tin to 3
  Note: the 'fwmark' option can also be used to set a packet priority from
  its fwmark.

  - Flow hash override: To override flow hashing, the classid can be set.
CAKE will interpret  the  major number of the classid as the host hash used in host isolation mode, and the minor number as the flow hash used for flow-based  queueing.
     This example will assign all ICMP packets to the first queue:
     $ tc qdisc replace dev eth0 handle 1: root cake
     $ tc filter add dev eth0 parent 1: protocol ip prio 1 u32 match icmp type 0 0 classid 0:1

  * priority parameters:
       diffserv4
            Provides a general-purpose Diffserv implementation with four tins:
                 Bulk (CS1), 6.25% threshold, generally low priority.
                 Best Effort (general), 100% threshold.
                 Video  (AF4x,  AF3x, CS3, AF2x, CS2, TOS4, TOS1), 50% thresh‐
       old.
                 Voice (CS7, CS6, EF, VA, CS5, CS4), 25% threshold.

       diffserv3 (default)
            Provides a simple, general-purpose  Diffserv  implementation  with
       three tins:
                 Bulk (CS1), 6.25% threshold, generally low priority.
                 Best Effort (general), 100% threshold.
                 Voice  (CS7, CS6, EF, VA, TOS4), 25% threshold, reduced Codel
       interval.

Cake with hfsc: https://lists.bufferbloat.net/pipermail/cake/2019-March/004768.html
$ tc qdisc add dev eth1 root handle 1: hfsc default 1
$ tc class add dev eth1 parent 1: classid 1:1 hfsc ls rate 5mbit ul rate 5mbit
$ tc qdisc add dev eth1 parent 1:1 cake unlimited besteffort internet nat memlimit 32m

## Classful qdisc

* Multiqueue (classful):
- multiq: https://www.kernel.org/doc/Documentation/networking/multiqueue.txt
  => when the device has multiple tx hardware queue, when dequeuing it will
  skip through the queues and use the first available one.
  The queue for a packet can be changed via:
  $ tc filter ... action skbedit queue_mapping 3
  By default the queue is determined from skb_tx_hash.
- mq: https://serverfault.com/questions/474230/linux-traffic-control-qdisc-mq
   => https://lwn.net/Articles/351021/
   The mq scheduler does two things:
   - present device TX queues as classes, allowing to attach different qdiscs to them, which are grafted to the TX queues
   - present accumulated statistics of all device queue root qdiscs
   => classful multiqueue ("mq") dummy scheduler; used by default for multiqueue devices instead of the regular pfifo_fast qdisc (ie with several processors, one can get a mq with a queue by processor, and then each queue is a pfifo_fast). It present device TX queues as classes, allowing to attach different qdiscs to them, which are grafted to the TX queues
- mqprio: map traffic flows to hardware queue ranges using priorities

* qfq: a class version of fq
  https://github.com/Mellanox/mlxsw/wiki/ACLs

* https://linux.die.net/man/8/tc-prio
[this one actually has a class by queue]

Use the old TOS meaning to map priority to channel
0   1   2   3   4   5   6   7
+---+---+---+---+---+---+---+---+
|           |               |   |
|PRECEDENCE |      TOS      |MBZ|
|           |               |   |
+---+---+---+---+---+---+---+---+

More infos on tc-prio:
- https://lartc.org/howto/lartc.qdisc.classless.html
[- https://serverfault.com/questions/894054/tc-prio-how-the-packets-are-prioritized]

* Hierarchical Token Bucket (HTB) qdisc

Within  the  one  HTB  instance  many  classes may exist. Each of these
classes contains another qdisc, by default tc-pfifo(8).

At each node we look for an instruction,  and  then  go  to  the class  the
instruction  refers  us  to. If the class found is a barren leaf-node
(without children), we enqueue the packet there. If it is not yet  a  leaf
node, we do the whole thing over again starting from that node.

The following actions are performed, in order at each  node  we  visit,
until one sends us to another node, or terminates the process.
(i) Consult filters attached to the class. If sent to a leafnode, we are
done.  Otherwise, restart.
(ii)If none of the above returned with an  instruction,  enqueue  at this
node.

- http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm
HTB Linux queuing discipline manual - user guide

- https://wiki.debian.org/TrafficControl

Creating root 1: and 1:1 using HTB (default 6 means follow 1:6 if no rule matched) 
$ tc qdisc add dev eth1 root handle 1: htb default 6
$ tc class add dev eth1 parent 1: classid 1:1 htb rate 2mbit ceil 2mbit

Create leaf 1:5 and add filter to redirect to it
$ tc class add dev eth1 parent 1:1 classid 1:5 htb rate 1mbit ceil 1.5mbit
$ tc filter add dev eth1 protocol ip parent 1:0 prio 0 u32 match ip src YOUR_MAIL_SERVER_IP/32 flowid 1:5
$ tc filter add dev eth1 protocol ip parent 1:0 prio 0 u32 match ip sport 22 0xffff flowid 1:5

Leaf 1:6
$ tc class add dev eth1 parent 1:1 classid 1:6 htb rate 0.5mbit ceil 1.5mbit

Leaf 1:7
$ tc class add dev eth1 parent 1:1 classid 1:7 htb rate 0.2mbit ceil 1mbit
$ tc filter add dev eth1 protocol ip parent 1:0 prio 5 u32 match ip src VIDEO_STREAM_IP/32 flowid 1:7

Add a qdisc leaf (otherwise the leaf behaves as a pfifo qdisc):
$ tc qdisc add dev eth1 parent 1:5 handle 20: sfq perturb 10

=> Result
$ tc qdisc show dev eth1
qdisc htb 1: root refcnt 2 r2q 10 default 0x6 direct_packets_stat 0 direct_qlen 1000
qdisc sfq 20: parent 1:5 limit 127p quantum 1514b depth 127 divisor 1024 perturb 10sec 
$ tc class show dev eth1
class htb 1:1 root rate 2Mbit ceil 2Mbit burst 1600b cburst 1600b 
class htb 1:5 parent 1:1 prio 0 rate 1Mbit ceil 1500Kbit burst 1600b cburst 1599b 
class htb 1:6 parent 1:1 prio 0 rate 500Kbit ceil 1500Kbit burst 1600b cburst 1599b 
class htb 1:7 parent 1:1 prio 0 rate 200Kbit ceil 1Mbit burst 1600b cburst 1600b

Cf http://linux-ip.net/articles/Traffic-Control-HOWTO/classful-qdiscs.html
for borrowing.

* Hierarchical fair-service curve (HFSC)

  HFSC qdisc has only one optional parameter - default. CLASSID specifies
  the  minor part of the default classid, where packets not classified by
  other means (e.g. u32 filter, CLASSIFY target of iptables) will be  en‐
  queued.  If  default  is  not  specified,  unclassified packets will be
  dropped.

- http://man7.org/linux/man-pages/man7/tc-hfsc.7.html
- http://linux-ip.net/articles/hfsc.en/

 For complex traffic shaping scenarios, hierarchical algorithms are necessary. Current versions of Linux support the algorithms HTB and HFSC. While HTB basically rearranges token bucket filter (TBF) into a hierarchical structure, thereby retaining the principal characteristics of TBF, HFSC allows proportional distribution of bandwidth as well as control and allocation of latencies. This allows for better and more efficient use of a connection for situations in which both bandwidth intensive data services and interactive services share a single network link. 

$ tc qdisc add dev $dev root handle $ID: hfsc [default $classID ] 
In the second step, the class hierarchy is constructed with consecutive class additions.
$ tc add class dev $dev parent parentID classid $ID hfsc [ [ rt  SC ] [ ls  SC ] | [ sc  SC ] ]  [ ul  SC ]

- Script exemples:
  https://gist.github.com/bradoaks/940616
  with a nice introduction to tbf, htb and hfsc
  Latest version: https://gist.github.com/eqhmcow/939373
- More details on hfsc: https://serverfault.com/questions/105014/does-anyone-really-understand-how-hfsc-scheduling-in-linux-bsd-works
- Tutorials: http://linux-tc-notes.sourceforge.net/tc/doc/sch_hfsc.txt
             http://manpages.ubuntu.com/manpages/precise/man7/tc-hfsc.7.html

* tc-qfq
https://netdev.vger.kernel.narkive.com/6FYLI2fu/quick-fair-queue-scheduler-maturity-and-examples

## Netem qdisc

* https://netbeez.net/blog/how-to-use-the-linux-traffic-control/
=> netem: network emulator; to add a wan property

This is a classful qdisc. Lot of details in the master thesis:
http://home.ifi.uio.no/paalh/students/AndersMoe.pdf

- simulate delay
$ tc qdisc add dev eth0 root netem delay 200ms
change in place:
$ tc qdisc change dev eth0 root netem delay 300ms

- simulate packet loss / corruption
$  tc qdisc add dev eth0 root netem loss 10%
$ tc qdisc change dev eth0 root netem corrupt 5%
$ tc qdisc change dev eth0 root netem duplicate 1% 

Manual: http://tcn.hypert.net/tcmanual.pdf

## Documentations
### https://www.tldp.org/HOWTO/html_single/Traffic-Control-HOWTO/

[root@leander]# tc class add    \ (1)
>                  dev eth0     \ (2)
>                  parent 1:1   \ (3)
>                  classid 1:6  \ (4)
>                  htb          \ (5)
>                  rate 256kbit \ (6)
>                  ceil 512kbit   (7)

(1) Add a class. The verb could also be del. 
(2) Specify the device onto which we are attaching the new class. 
(3) Specify the parent handle to which we are attaching the new class. 
(4) This is a unique handle (major:minor) identifying this class. The minor number must be any non-zero (0) number. 
(5) Both of the classful qdiscs require that any children classes be classes of the same type as the parent. Thus an HTB qdisc will contain HTB classes. 
(6)(7) This is a class specific parameter. Consult Section 7.1 for more detail on these parameters. 


[root@leander]# tc filter add               \ (1)
>                  dev eth0                 \ (2)
>                  parent 1:0               \ (3)
>                  protocol ip              \ (4)
>                  prio 5                   \ (5)
>                  u32                      \ (6)
>                  match ip port 22 0xffff  \ (7)
>                  match ip tos 0x10 0xff   \ (8)
>                  flowid 1:6               \ (9)
>                  police                   \ (10)
>                  rate 32000bps            \ (11)
>                  burst 10240              \ (12)
>                  mpu 0                    \ (13)
>                  action drop/continue       (14)

(1) Add a filter. The verb could also be del. 
(2) Specify the device onto which we are attaching the new filter. 
(3) Specify the parent handle to which we are attaching the new filter. 
(4) This parameter is required. It's use should be obvious, although I don't know more. 
(5) The prio parameter allows a given filter to be preferred above another. The pref is a synonym. [lower number=higher prec]
(6) This is a classifier, and is a required phrase in every tc filter command. 
(7)(8) These are parameters to the classifier. In this case, packets with a type of service flag (indicating interactive usage) and matching port 22 will be selected by this statement. 
(9) The flowid specifies the handle of the target class (or qdisc) to which a matching filter should send its selected packets. 
(10) This is the policer, and is an optional phrase in every tc filter command. 
(11) The policer will perform one action above this rate, and another action below (see action parameter). 
(12) The burst is an exact analog to burst in HTB (burst is a buckets concept). 
(13) The minimum policed unit. To count all traffic, use an mpu of zero (0). 
(14) The action indicates what should be done if the rate based on the attributes of the policer. The first word specifies the action to take if the policer has been exceeded. The second word specifies action to take otherwise. 

### lartc

#### Classless qdisc
* https://lartc.org/howto/lartc.qdisc.classless.html

9.2.1. pfifo_fast [3 bands]
Do not confuse this classless simple qdisc with the classful PRIO one! Although they behave similarly, pfifo_fast is classless and you cannot add other qdiscs to it with the tc command.

####  Classful qdisc
* https://lartc.org/howto/lartc.qdisc.classful.html

                     1:   root qdisc
                      |
                     1:1    child class
                   /  |  \
                  /   |   \
                 /    |    \
                 /    |    \
              1:10  1:11  1:12   child classes
               |      |     | 
               |     11:    |    leaf class
               |            | 
               10:         12:   qdisc
              /   \       /   \
           10:1  10:2   12:1  12:2   leaf classes

* Exemple with a prio qdisc:
          1:   root qdisc
         / | \ 
       /   |   \
       /   |   \
     1:1  1:2  1:3    classes
      |    |    |
     10:  20:  30:    qdiscs    qdiscs
     sfq  tbf  sfq
band  0    1    2

$ tc qdisc add dev eth0 root handle 1: prio 
This *instantly* creates classes 1:1, 1:2, 1:3

$ tc qdisc add dev eth0 parent 1:1 handle 10: sfq
$ tc qdisc add dev eth0 parent 1:2 handle 20: tbf rate 20kbit buffer 1600 limit 3000
$ tc qdisc add dev eth0 parent 1:3 handle 30: sfq

* Exemple with an htb class:

$ tc qdisc add dev eth0 root handle 1: htb default 30

$ tc class add dev eth0 parent 1: classid 1:1 htb rate 6mbit burst 15k

$ tc class add dev eth0 parent 1:1 classid 1:10 htb rate 5mbit burst 15k
$ tc class add dev eth0 parent 1:1 classid 1:20 htb rate 3mbit ceil 6mbit burst 15k
$ tc class add dev eth0 parent 1:1 classid 1:30 htb rate 1kbit ceil 6mbit burst 15k

The author then recommends SFQ for beneath these classes:

$ tc qdisc add dev eth0 parent 1:10 handle 10: sfq perturb 10
$ tc qdisc add dev eth0 parent 1:20 handle 20: sfq perturb 10
$ tc qdisc add dev eth0 parent 1:30 handle 30: sfq perturb 10

Add the filters which direct traffic to the right classes:

$ U32="tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32"
$ $U32 match ip dport 80 0xffff flowid 1:10
$ $U32 match ip sport 25 0xffff flowid 1:20

#### Filter

https://lartc.org/howto/lartc.qdisc.filters.html

#### Imq

* https://lartc.org/howto/lartc.imq.html

  - Only egress shaping is possible (an ingress qdisc exists, but its possibilities are very limited compared to classful qdiscs).
  - A qdisc can only see traffic of one interface, global limitations can't be placed.

IMQ is there to help solve those two limitations. In short, you can put everything you choose in a qdisc. Specially marked packets get intercepted in netfilter NF_IP_PRE_ROUTING and NF_IP_POST_ROUTING hooks and pass through the qdisc attached to an imq device. An iptables target is used for marking the packets.

This enables you to do ingress shaping as you can just mark packets coming in from somewhere and/or treat interfaces as classes to set global limits. You can also do lots of other stuff like just putting your http traffic in a qdisc, put new connection requests in a qdisc, ...

$ iptables -t mangle -A PREROUTING -i eth0 -j IMQ --todev 0
$ ip link set imq0 up

$ tc qdisc add dev imq0 root handle 1: htb default 20
...

Note: now replaced by ifb
cf https://wiki.linuxfoundation.org/networking/ifb
   https://wiki.archlinux.org/index.php/Advanced_traffic_control

## Ingress qdisc

* https://serverfault.com/questions/350023/tc-ingress-policing-and-ifb-mirroring

IFB is an alternative to tc filters for handling ingress traffic, by redirecting it to a virtual interface and treat is as egress traffic there.You need one ifb interface per physical interface, to redirect ingress traffic from eth0 to ifb0, eth1 to ifb1 and so on.

When inserting the ifb module, tell it the number of virtual interfaces you need. The default is 2:
$ modprobe ifb numifbs=1
Now, enable all ifb interfaces:
$ ip link set dev ifb0 up # repeat for ifb1, ifb2, ...

And redirect ingress traffic from the physical interfaces to corresponding ifb interface. For eth0 -> ifb0:
$ tc qdisc add dev eth0 handle ffff: ingress #Note: handle ffff: seems to be the default for ingress
$ tc filter add dev eth0 parent ffff: protocol ip u32 match u32 0 0 action mirred egress redirect dev ifb0
Again, repeat for eth1 -> ifb1, eth2 -> ifb2 and so on, until all the interfaces you want to shape are covered.

Now, you can apply all the rules you want. Egress rules for eth0 go as usual in eth0. Let's limit bandwidth, for example:
$ tc qdisc add dev eth0 root handle 1: htb default 10
$ tc class add dev eth0 parent 1: classid 1:1 htb rate 1mbit
$ tc class add dev eth0 parent 1:1 classid 1:10 htb rate 1mbit

Ingress rules for eth0, now go as egress rules on ifb0 (whatever goes into ifb0 must come out, and only eth0 ingress traffic goes into ifb0). Again, a bandwidth limit example:
$ tc qdisc add dev ifb0 root handle 1: htb default 10
$ tc class add dev ifb0 parent 1: classid 1:1 htb rate 1mbit
$ tc class add dev ifb0 parent 1:1 classid 1:10 htb rate 1mbit

The advantage of this approach is that egress rules are much more flexible than ingress filters. Filters only allow you to drop packets, not introduce wait times, for example. By handling ingress traffic as egress you can setup queue disciplines, with traffic classes and, if need be, filters. You get access to the whole tc tree, not only simple filters.

Note: ingress shaping is not really useful https://stackoverflow.com/questions/15881921/why-tc-cannot-do-ingress-shaping-does-ingress-shaping-make-sense
  The caveat with ingress shaping is that it may take a long time for an
incoming stream to respond to your shaping actions, due to all the buffers
in routers between the stream source and your interface.

Cf also:
https://serverfault.com/questions/557573/incoming-ingress-traffic-shaping-on-linux-bw-is-lower-than-expected

* clsact

https://lwn.net/Articles/671458/
Special qdisc which has both ingress and egress support.

   # tc qdisc add dev foo clsact
   # tc qdisc show dev foo
   qdisc mq 0: root
   qdisc pfifo_fast 0: parent :1 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
   qdisc pfifo_fast 0: parent :2 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
   qdisc pfifo_fast 0: parent :3 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
   qdisc pfifo_fast 0: parent :4 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
   qdisc clsact ffff: parent ffff:fff1

Adding filters (deleting, etc works analogous by specifying ingress/egress):

   # tc filter add dev foo ingress bpf da obj bar.o sec ingress
   # tc filter add dev foo egress  bpf da obj bar.o sec egress
   # tc filter show dev foo ingress
   filter protocol all pref 49152 bpf
   filter protocol all pref 49152 bpf handle 0x1 bar.o:[ingress] direct-action
   # tc filter show dev foo egress
   filter protocol all pref 49152 bpf
   filter protocol all pref 49152 bpf handle 0x1 bar.o:[egress] direct-action

A 'tc filter show dev foo' or 'tc filter show dev foo parent ffff:' will
show an empty list for clsact. Either using the parent names (ingress/egress)
or specifying the full major/minor will then show the related filter lists.

* Note: for 'ingress' and 'clsact' the handle by default is ffff:
qdisc ingress ffff: dev foo1 parent ffff:fff1
qdisc clsact ffff: dev foo2 parent ffff:fff1 

For 'ingress' we can add a filter to ffff: or any subclass ffff:0001
Listing the filters show all filters (including on subclasses, ie the
parent is forgotten, or in other words ffff:xxxx = ffff:).
The keyword 'ingress' is a shortcut for 'parent ffff:'. 
So these do the same things
$ sudo tc filter add dev foo1 ingress matchall action ok
$ sudo tc filter add dev foo1 parent ffff:02 matchall action ok

For 'clsacct' we need to specify ingress vs egress. In fact ffff:fff2 is
the ingress subclass, and ffff:fff3 is the egress subclass.
We can't add filter to ffff:, all other classes are invalid (ffff:fff1
too), we can only use ingress and egress, and to list filters we need
$ tc filter show dev foo2 egress = tc filter show dev foo2 parent ffff:fff3

## Filter

* https://medium.com/criteo-labs/demystification-of-tc-de3dfe4067c2
Note: filters can also be attached to some stateless qdisc, like sfq, cake...
(but not pfifo_fast)

$ tc filter add dev DEV [parent qdiscid] [handle filter-id] protocol proto prio prio filter... flowid flow-id.

Note: flowid is a synonym for classid and is a classifier.
Ie if an action is pass/ok, then it get sent to the corresponding class.

### Matching

Nice documentation in https://www.linux.com/tutorials/qos-linux-tc-and-filters/

* Other filters:
- tc-cgroup match on cgroup
- tc-bpf: match via (e)bpf (can also specify actions)
- tc-route: match according to the route: from REALM, fromif TAG, to REALM.
- tc-fw: match the fwmark, eg $ tc filter add ... handle 6 fw classid 1:1
  will match fwmark 6.
- tc-tcindex: match according to the dscp/ecn fields
- tc-matchall: match all packets

* Basic filtering: tc-basic

tc  filter  ...  basic  [  match EMATCH_TREE ] [ action ACTION_SPEC ] [ classid CLASSID ]
$ tc filter add dev eth0 parent 1: basic match 'meta(priority eq 6)' classid 1:10

The EMATCH_TREE is described in tc-ematch, in particular it can match metadata.

* tc-flower: match specific key
  + assigns  an arbitrarily chosen class ID to packets belonging to them (if classid is not specified)

  $ tc filter add dev eth0 parent ffff: protocol ip pref 33 flower dst_mac 52:54:00:3d:c7:6d action ...

* Flow classifying: tc-flow
       The  flow  classifier  is  meant to extend the SFQ hashing capabilities
       without hard-coding new hash functions. It  also  allows  deterministic
       mappings of keys to classes.

Exemples:
       Classic SFQ hash:
              tc filter add ... flow hash \
                   keys src,dst,proto,proto-src,proto-dst divisor 1024

       Classic SFQ hash, but using information from conntrack to work properly
       in combination with NAT:
              tc filter add ... flow hash \
                   keys nfct-src,nfct-dst,proto,nfct-proto-src,nfct-proto-dst \
                   divisor 1024

       Map destination IPs of 192.168.0.0/24 to classids 1-256:
              tc filter add ... flow map \
                   key dst addend -192.168.0.0 divisor 256

Exemple from https://www.linux.com/tutorials/qos-linux-tc-and-filters/:
  $ tc filter add dev eth0 parent 1: handle 0x1337 flow map key priority baseclass 1:10
  The flow filter now uses the priority value to construct a destination
  class ID by adding it to the value of `baseclass`. While this works for
  priority values of 0, 2 and 6, it will result in non-existent class ID
  1:14 for Interactive Bulk traffic. In that case, the HTB default applies
  so that traffic goes into class ID 1:10 just as intended. Please note
  that specifying a handle is a mandatory requirement by the flow filter,
  although I didn't see where one would use that later.

Exemple from http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:networking:traffic_control
$ tc qdisc add dev eth0 root handle 1: sfq perturb 10 quantum 3000 limit 64
$ tc filter add dev eth0 parent 1:0 protocol ip handle 1 flow hash keys src,dst divisor 1024

* tc-u32: u32 - universal 32bit traffic control filter

$ tc filter ... u32 match ... ht HANDLE
where HANDLE is hash_table_id (12 bits), hash_table_bucket (8 bits),
node_id (12 bits). Node_id can also be set by 'order', and correspond to
the priority. eg 'ht 1: order 3' gives handle 1::3

Exemple:
            $ tc filter add dev eth0 parent 999:0 prio 99 protocol ip u32 \
                      match ip src 192.168.8.0/24 classid 1:1
    => This create a hashtable of size 1 and handle 800, and a filter in 800:0:800. Adding a new u32 filter without specifying the handle would create 800:0:801.
              filter parent 1: protocol ip pref 99 u32 \
                      fh 800: ht divisor 1
              filter parent 1: protocol ip pref 99 u32 \
                      fh 800::800 order 2048 key ht 800 bkt 0 flowid 1:1 \
                      match c0a80800/ffffff00 at 12

            $ tc filter add dev eth0 prio 99 handle 1: u32 divisor 256
            $ tc filter add dev eth0 parent 1: prio 1 u32 \
                      link 1: hashkey mask 0x0000ff00 at 12 \
                      match ip src 192.168.0.0/16
    => When packets matches, they are sent to ht 1:<hash of the bit>
       We could then classify the packets as follow:
       tc filter add dev eth0 parent 1: prio 99 u32 ht 1:3: classid 1:16 match u8 0 0'

    More precisely, this adds a filter to the root hash table 800:0:...,
    which redirect to hash table 1:...
    Result (here I used the handle 42:) =>
    filter parent 1: protocol all pref 1 u32 chain 0 
    filter parent 1: protocol all pref 1 u32 chain 0 fh 801: ht divisor 1 
    filter parent 1: protocol all pref 1 u32 chain 0 fh 801::800 order 2048 key ht 801 bkt 0 link 42: not_in_hw 
      match c0a80000/ffff0000 at 12
        hash mask 0000ff00 at 12 
    filter parent 1: protocol all pref 99 u32 chain 0 
    filter parent 1: protocol all pref 99 u32 chain 0 fh 42: ht divisor 256 
    filter parent 1: protocol all pref 99 u32 chain 0 fh 800: ht divisor 1 

    Note: be vary of the nexthdr+ option used implicitely by tcp/udp:
    https://lartc.vger.kernel.narkive.com/KTD6vNXU/tc-u32-match-in-nexthdr-not-working
    we need to get an explicit offset, and so chain rules. See the exemple
    at the end of tc-u32.

- More details: http://linux-tc-notes.sourceforge.net/tc/doc/cls_u32.txt

    # tc filter add dev eth0 parent 999:0 protocol ip prio 99 u32 \
        link 1:0: \
	match ip src 192.168.8.0/24

  If this filter item matches it will "link" to filter list 1:0:, meaning
  the kernel will now execute filter list 1:0:.  If a filter item in that
  list matches and classifies a packet then the u32 stops and returns
  classified packet.  If that does not happen, ie if no filter item in the
  list classifies the packet then the kernel resumes executing the original
  list.  Execution continues at the next filter item in the original list,
  ie the one after the filter item that did the "link".  A linked list can
  in turn link to other lists.  You can nest up to 7 link commands.

  Hash table 800 is special.  It is called the root.  When you create
  a u32 filter the root hash table gets created for you automatically.
  It always has exactly one bucket, numbered 0.  This means the root
  hash table also exactly one filter list associated with it.  When
  the u32 filter starts execution it always executes this filter
  list.  In other words a u32 filter does its thing by executing
  filter list 800:0.  If filter list 800:0 does not classify the
  packet (implying that none of the lists it linked to classified it
  either) then the u32 filter returns the packet unclassified.

  [Note: this is not clear because when adding a rule at a different
  priority, I get a default ht of 801, 802, ... + The tc-u32 man page say
  'The filter is given a lower priority than the hash table itself so  u32
       consults it before manually traversing the hash table.']

  u32 caveats: https://lartc.vger.kernel.narkive.com/KTD6vNXU/tc-u32-match-in-nexthdr-not-working
               https://lartc.vger.kernel.narkive.com/XomCjWrA/policing-based-on-port-numbers

### Filter actions
=> Reference: https://people.netfilter.org/pablo/netdev0.1/papers/Linux-Traffic-Control-Classifier-Action-Subsystem-Architecture.pdf
https://netdevconf.info/0.1/sessions/21.html

add action to a filter: tc filter add dev ... parent ... prio ...
[matching] [action] 'action1' [CONTROL] [action 'action2' [CONTROL]

-> CONTROL: { reclassify | pipe | drop | continue | ok/pass }
              reclassify
                     Restart the classifiction by jumping back to the first
                     filter attached to the action's parent.
              pipe   Continue with the next action. This is the default
                     control.
              drop   Drop the packed without running any further actions.
              continue
                     Continue the classification with the next filter.
              pass   Return to the calling qdisc for packet processing, and
                     end classification of this packet.
(a control action is also called a gact)

Note: an action can be created with a specific 32 bits index eg 'action
police rate 10kbit burst 10k pipe index 1' which allow to reuse it in
another filter.

An action can be created with 'tc action' (cf tc-actions) and then attached
in a filter:
 $ tc actions add  action connmark zone 3 index 10
 $ tc filter add dev $ETH parent ffff: pref 11 protocol ip u32 match ip protocol 17 0xff  flowid 1:3 action connmark index 10

* Actions
-> tc-simple: for debugging actions
-> tc-mirred: copy / redirect packets
-> Packet manipulation:
   tc-pedit+tc-csum: edit packet data and recalculate checksum
   tc-skbmod: user friendly pedit
   tc-skbedit: edit meta data (supports changing queue mapping, priority field and firewall mark value)
   tc-ife: encaspulate/decapsulate metadata into packet data
-> High level manipulation:
   tc-nat: stateless nat
   tc-connmark: The connmark action is used to restore the connection's mark value into the packet's fwmark.
   tc-tunnelçkey: tunnel metadata manipulation
   tc-vlan: vlan manipulation
   tc-xt: iptables action [some exemples / links in https://github.com/firehol/firehol/issues/49]

-> tc-police
The  police  action allows to limit bandwidth of traffic matched by the filter it is attached to.
  # tc qdisc add dev eth0 handle ffff: ingress
  # tc filter add dev eth0 parent ffff: u32 \
       match u32 0 0 police rate 1mbit burst 100k #shortcut for 'action police'

  Exemple combining police and mirred:
              # tc qdisc add dev eth0 handle ffff: ingress
              # tc filter add dev eth0 parent ffff: u32 \
                   match u32 0 0 \
                   action police rate 1mbit burst 100k conform-exceed pipe \
                   action mirred egress redirect dev lo

  One can set the policy of exceeding packet / conforming packets via
  conform-exceed EXCEEDACT[/NOTEXCEEDACT]: continue, drop=shot, ok=pass, reclassify, pipe
  The default is drop/ok (Warning: the man page is completely wrong here)
  Note that 'action police rate 1mbit burst 100k pipe' is a shortcut for
  'conform-exceed pipe'.

### Block and chains

* chains: https://lwn.net/Articles/723067/
By default we have one filter chain (orderer by priority).
But we can build different chains and add goto action to them:

$ tc qdisc add dev eth0 ingress (default handle of ingress is ffff:)
$ tc filter add dev eth0 parent ffff: protocol ip pref 33 flower dst_mac 52:54:00:3d:c7:6d action goto chain 11
$ tc filter add dev eth0 parent ffff: protocol ip pref 22 chain 11 flower dst_ip 192.168.40.1 action drop

$ tc filter show dev eth0 root
filter parent ffff: protocol ip pref 33 flower chain 0
filter parent ffff: protocol ip pref 33 flower chain 0 handle 0x1
  dst_mac 52:54:00:3d:c7:6d
  eth_type ipv4
        action order 1: gact action goto chain 11
         random type none pass val 0
         index 2 ref 1 bind 1
filter parent ffff: protocol ip pref 22 flower chain 11
filter parent ffff: protocol ip pref 22 flower chain 11 handle 0x1
  eth_type ipv4
  dst_ip 192.168.40.1
        action order 1: gact action drop
         random type none pass val 0
         index 3 ref 1 bind 1

La chaîne 11 a été crée à la volée par tc filter, mais on aurait aussi pu
utiliser tc-chain: https://github.com/Mellanox/mlxsw/wiki/ACLs
$ tc chain add dev enp3s0np1 ingress chain 11


* block: share filter chains
cf https://patchwork.ozlabs.org/cover/863941/

tc qdisc add dev ... ingress_block blockindex ...
=> this qdisc will use the filter chain of block 'blockindex'.

$ tc qdisc add dev ens7 ingress_block 22 ingress
$ tc qdisc add dev ens8 ingress_block 22 ingress
$ tc filter add block 22 protocol ip pref 25 flower dst_ip 192.168.0.0/16 action drop

Block sharing is also supported for clsact qdisc:
$ tc qdisc add dev ens10 ingress_block 23 egress_block 24 clsact
$ tc qdisc show dev ens10
qdisc clsact ffff: dev ens10 parent ffff:fff1 ingress_block 23 egress_block 24

## Exemples
$ sudo ip l add dev foo1 type dummy
$ sudo ip l set dev foo1 up
$ sudo tc qdisc add dev foo1 root sfq

$ sudo tc qdisc del dev foo1 root
$ sudo tc qdisc add dev foo1 root handle 1: htb default 6
$ sudo tc class add dev foo1 parent 1: classid 1:1 htb rate 2mbit ceil 2mbit
$ sudo tc class add dev foo1 parent 1:1 classid 1:5 htb rate 1mbit ceil 1.5mbit
$ sudo tc filter add dev foo1 protocol ip parent 1:0 prio 0 u32 match ip src 1.2.3.4/32 flowid 1:5
$ sudo tc filter add dev foo1 protocol ip parent 1:0 prio 0 u32 match ip sport 22 0xffff flowid 1:5
$ sudo tc class add dev foo1 parent 1:1 classid 1:6 htb rate 0.5mbit ceil 1.5mbit
$ sudo tc class add dev foo1 parent 1:1 classid 1:7 htb rate 0.2mbit ceil 1mbit
$ sudo tc filter add dev foo1 protocol ip parent 1:0 prio 5 u32 match ip src 4.5.6.7/32 flowid 1:7
$ sudo tc qdisc add dev foo1 parent 1:5 handle 20: sfq perturb 10

Mithrim ~ $ tc qdisc  show dev foo1
qdisc htb 1: root refcnt 2 r2q 10 default 0x6 direct_packets_stat 0 direct_qlen 1000
qdisc sfq 20: parent 1:5 limit 127p quantum 1514b depth 127 divisor 1024 perturb 10sec 
Mithrim ~ $ tc -g class  show dev foo1
+---(1:1) htb rate 2Mbit ceil 2Mbit burst 1600b cburst 1600b 
     +---(1:5) htb prio 0 rate 1Mbit ceil 1500Kbit burst 1600b cburst 1599b 
     +---(1:6) htb prio 0 rate 500Kbit ceil 1500Kbit burst 1600b cburst 1599b 
     +---(1:7) htb prio 0 rate 200Kbit ceil 1Mbit burst 1600b cburst 1600b 
Mithrim ~ $ tc filter show dev foo1
filter parent 1: protocol ip pref 5 u32 chain 0
...

Virtual networking
==================

## VRF

* https://cumulusnetworks.com/blog/vrf-for-linux/
  Details on the implementation

* https://lwn.net/Articles/632522/
Original patch, with exemple usages

Exemple:
  - eth1: 1.1.1.1/24: group 1, vrf 11
  - eth5: 1.1.1.1/24 (not a typo, duplicate address in different vrfs) group 1, vrf 13
  $ ip vrf exec 11 ip addr show dev eth1 #newer syntax: ip addr show vrf 11 dev eth1
          inet 1.1.1.1/24 brd 1.1.1.255 scope global eth1

  3. start ssh in group1 namespace
  $ ip netns exec group1 ip vrf exec 11 /usr/sbin/sshd -d
    ssh to 1.1.1.1 via eth1

  $ ip netns exec group1 ip vrf exec 13 /usr/sbin/sshd -d
    ssh to 1.1.1.1 via eth5
    --> same namespace but different VRFs

  4. One ssh instance handles VRFs in group1 namespace
  $ ip netns exec group1 ip vrf exec any /usr/sbin/sshd
    --> ssh to any address in the namespace works

* https://www.netdevconf.org/1.1/proceedings/slides/ahern-vrf-tutorial.pdf
Slides

* https://www.kernel.org/doc/Documentation/networking/vrf.txt

The VRF device combined with ip rules provides the ability to create virtual
routing and forwarding domains (aka VRFs, VRF-lite to be specific) in the Linux
network stack. One use case is the multi-tenancy problem where each tenant has
their own unique routing tables and in the very least need different default
gateways.

An important feature of the VRF device implementation is that it impacts only
Layer 3 and above. In addition, VRF devices allow VRFs to be nested within
namespaces. For example network namespaces provide separation of network
interfaces at the device layer, VLANs on the interfaces within a namespace
provide L2 separation and then VRF devices provide L3 separation.

Exemple
1. VRF device is created with an association to a FIB table.
   e.g, ip link add vrf-blue type vrf table 10
           ip link set dev vrf-blue up

2. An l3mdev FIB rule directs lookups to the table associated with the device.
   => 1000:	from all lookup [l3mdev-table]

   A single l3mdev rule is sufficient for all VRFs. The VRF device adds the
   l3mdev rule for IPv4 and IPv6 when the first device is created with a
   default preference of 1000. Users may delete the rule if desired and add
   with a different priority or install per-VRF rules.

   Prior to the v4.8 kernel iif and oif rules are needed for each VRF device:
       ip ru add oif vrf-blue table 10
       ip ru add iif vrf-blue table 10

3. Set the default route for the table (and hence default route for the VRF).
       ip route add table 10 unreachable default metric 4278198272

   This high metric value ensures that the default unreachable route can
   be overridden by a routing protocol suite.  FRRouting interprets
   kernel metrics as a combined admin distance (upper byte) and priority
   (lower 3 bytes).  Thus the above metric translates to [255/8192].

4. Enslave L3 interfaces to a VRF device.
       ip link set dev eth1 master vrf-blue

   Local and connected routes for enslaved devices are automatically moved to
   the table associated with VRF device. Any additional routes depending on
   the enslaved device are dropped and will need to be reinserted to the VRF
   FIB table following the enslavement.

   The IPv6 sysctl option keep_addr_on_down can be enabled to keep IPv6 global
   addresses as VRF enslavement changes.
       sysctl -w net.ipv6.conf.all.keep_addr_on_down=1

5. Additional VRF routes are added to associated table.
       ip route add table 10 ...

=> one can use 'ip vrf exec VRFNAME' to get l3 isolation like one use 'ip netns exec NETNSNAME' to get l1 isolation:
$ ip link add red type vrf table 11
$ ip link set dev red up
$ ip vrf exec red ssh 10.100.1.254
cf man 'ip-vrf'

* Complete syntax
 $ ip link add dev NAME type vrf table ID
 $ ip [-d] link show type vrf
 $ ip link set dev NAME master NAME
 $ ip link show vrf NAME #devices that have been assigned to a specific VRF
 $ ip addr show vrf NAME #show the ip adresses
 $ ip [-6] neigh show vrf NAME
 $ ip [-6] route show vrf NAME / $ ip [-6] route show table ID
 $ ip [-6] route get vrf NAME ADDRESS / $ ip [-6] route get oif NAME ADDRESS
 $ ip link set dev NAME nomaster

## Virtual interfaces

* Documentation
https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/
https://events.static.linuxfound.org/sites/events/files/slides/2016%20-%20Linux%20Networking%20explained_0.pdf

https://news.ycombinator.com/item?id=8930702 LXC container networking deep dive (flockport.com) => Extending L2 with Ethernet over GRE via ip link add testgre type gretap

* Exemples divers
- Bonded / Team: unify two physical interfaces
  # ip link add bond1 type bond miimon 100 mode active-backup
  # ip link set eth0 master bond1
  # ip link set eth1 master bond1

- VLan: VLAN, aka virtual LAN, separates broadcast domains by adding tags to network packets => needs router support to handle the vlan tags
  # ip link add link eth0 name eth0.2 type vlan id 2
  # ip link add link eth0 name eth0.3 type vlan id 3

- MACsec
MACsec (Media Access Control Security) is an IEEE standard for security in wired Ethernet LANs

### vxlan
VXLAN (Virtual eXtensible Local Area Network) is a tunneling protocol
designed to solve the problem of limited VLAN IDs (4,096).

  # ip link add vx0 type vxlan id 100 local 1.1.1.1 remote 2.2.2.2 dev eth0 dstport 4789

* Notes: vlan vs vxlan vs qinq
https://community.fs.com/blog/qinq-vs-vlan-vs-vxlan.html
https://www.quora.com/What-is-the-difference-between-VLAN-and-VXLAN

* More infos:
https://www.kernel.org/doc/Documentation/networking/vxlan.txt
https://ilearnedhowto.wordpress.com/2017/02/16/how-to-create-overlay-networks-using-linux-bridges-and-vxlans/
https://blogs.vmware.com/vsphere/2013/04/vxlan-series-different-components-part-1.html How vxlan use multicast to simulate broadcasting; and how it creates forwarding entries (https://blogs.vmware.com/vsphere/2013/05/vxlan-series-how-vtep-learns-and-creates-forwarding-table-part-5.html)

* Mode of operations: https://vincent.bernat.ch/en/blog/2017-vxlan-linux
1) Use multicast:
ip -6 link add vxlan100 type vxlan id 100 dstport 4789 local 2001:db8:1::1 \
                group ff05::100 dev eth0 ttl 5
(note: port 8472 is linux's default but the rfc specify 4789)

2) Unicast with static flooding
 ip -6 link add vxlan100 type vxlan id 100 dstport 4789 local 2001:db8:1::1
 bridge fdb append 00:00:00:00:00:00 dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 00:00:00:00:00:00 dev vxlan100 dst 2001:db8:3::1
where 2001:db8:2/3::1 are the ip addresses of the vtep (VXLAN Tunnel Endpoint)

Raccourci: https://blog.wescale.fr/2018/02/15/les-reseaux-doverlay-principes-et-fonctionnement/
  # ip link add vxlan10 type vxlan id 10 local 10.0.0.2 remote 10.0.0.3
  # ip link set vxlan10 up
  => ajoute automatiquement dans la fdb: $bridge fdb show
  00:00:00:00:00:00 dev vxlan10 dst 10.0.0.3 self permanent

  Et l'autodécouverte donne, par exemple avec un
  vm01# ip addr add 192.168.0.2/24 dev vxlan10
  vm02# ip addr add 192.168.0.3/24 dev vxlan10
  vm01# ping 192.168.0.3
  ajoute l'adresse mac de 192.168.0.3 sur la fdb
  96:3d:d7:db:24:ee dev vxlan10 dst 10.0.0.3 self
  et notre adresse mac sur la fdb de 10.0.0.3:
  2e:f0:64:67:76:9f dev vxlan10 dst 10.0.0.2 self

3) Unicast with static L2 entries
 ip -6 link add vxlan100 type vxlan id 100 dstport 4789 local 2001:db8:1::1 nolearning

 Thanks to the nolearning flag, source-address learning is disabled. Therefore, if a MAC is missing, the frame will always be sent using the all-zero entries.

 bridge fdb append 00:00:00:00:00:00 dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 00:00:00:00:00:00 dev vxlan100 dst 2001:db8:3::1
 bridge fdb append 50:54:33:00:00:09 dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 50:54:33:00:00:0a dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 50:54:33:00:00:0b dev vxlan100 dst 2001:db8:3::1

3) Unicast with static L3 entries
  In the previous example, we had to keep the all-zero entries for ARP and IPv6 neighbor discovery to work correctly. However, Linux can answer to neighbor requests on behalf of the remote nodes. When this feature is enabled, the default entries are not needed anymore (but you could keep them):

 ip -6 link add vxlan100 type vxlan id 100 dstport 4789 local 2001:db8:1::1 nolearning proxy
 ip -6 neigh add 2001:db8:ff::11 lladdr 50:54:33:00:00:09 dev vxlan100
 ip -6 neigh add 2001:db8:ff::12 lladdr 50:54:33:00:00:0a dev vxlan100
 ip -6 neigh add 2001:db8:ff::13 lladdr 50:54:33:00:00:0b dev vxlan100
 bridge fdb append 50:54:33:00:00:09 dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 50:54:33:00:00:0a dev vxlan100 dst 2001:db8:2::1
 bridge fdb append 50:54:33:00:00:0b dev vxlan100 dst 2001:db8:3::1

4) Unicast with dynamic L3 entries
via l2miss and l3miss options

* Control pane
The dynamic mode allow to have a control pane.

** Plus d'infos
Cf the book https://www.cisco.com/c/dam/en/us/td/docs/switches/datacenter/nexus9000/sw/vxlan_evpn/VXLAN_EVPN.pdf sur VXLAN + BGP EVPN
MP-BGP => comme BGP mais les infos de routage contiennent layer 2 mac +
layer 3 ip (ce qu'on appelle du EVPN).

http://www.fiber-optic-equipment.com/understanding-two-terms-evpn-vs-vxlan.html
 ie EVPN could be the control plane of VXLAN

Voir aussi les slides: https://www.netdevconf.org/2.2/slides/prabhu-linuxbridge-tutorial.pdf

Et une overview des outils modernes sous linux: ebpf, VXLAN, VRF, EVPN, MPLS…
https://cumulusnetworks.com/blog/linux-programmable-pipelines-tunnels/
Solving challenges with Linux networking, programmable pipelines and tunnels

### Tun/Tap

Tun/tap interfaces are a feature offered by Linux (and probably by other
UNIX-like operating systems) that can do userspace networking, that is,
allow userspace programs to see raw network traffic (at the ethernet or IP
level) and do whatever they like with it.
cf: https://backreference.org/2010/03/26/tuntap-interface-tutorial/
    https://www.fir3net.com/Networking/Terms-and-Concepts/virtual-networking-devices-tun-tap-and-veth-pairs-explained.html
Note: tap = layer 2 (eth), tun = layer 3 (ip)

### VETH
The VETH (virtual Ethernet) device is a local Ethernet tunnel. Devices are created in pairs, as shown in the diagram below.

Use a VETH configuration when namespaces need to communicate to the main host namespace or between each other.

Exemples:
  sudo ip link add v-eth1 type veth peer name v-peer1

  # ip netns add net1
  # ip netns add net2
  # ip link add veth1 netns net1 type veth peer name veth2 netns net2

### Bridge = virtual switch
Exemple: connect eth0 with two taps and one veth device
  # ip link add br0 type bridge
  # ip link set eth0 master br0
  # ip link set tap1 master br0
  # ip link set tap2 master br0
  # ip link set veth1 master br0

### Macvlan
With VLAN, you can create multiple interfaces on top of a single one and filter packages based on a VLAN tag. With MACVLAN, you can create multiple interfaces with different Layer 2 (that is, Ethernet MAC) addresses on top of a single one.

Before MACVLAN, if you wanted to connect to physical network from a VM or
namespace, you would have needed to create TAP/VETH devices and attach one
side to a bridge and attach a physical interface to the bridge on the host
at the same time, as shown below.

Now, with MACVLAN, you can bind a physical interface that is associated with a MACVLAN directly to namespaces, without the need for a bridge.

There are five MACVLAN types:
1. Private: doesn’t allow communication between MACVLAN instances on the same physical interface, even if the external switch supports hairpin mode.
2. VEPA: data from one MACVLAN instance to the other on the same physical interface is transmitted over the physical interface. Either the attached switch needs to support hairpin mode or there must be a TCP/IP router forwarding the packets in order to allow communication.
3. Bridge: all endpoints are directly connected to each other with a simple bridge via the physical interface.
4. Passthru: allows a single VM to be connected directly to the physical interface.
5. Source: the source mode is used to filter traffic based on a list of allowed source MAC addresses to create MAC-based VLAN associations

* Exemples:
  # ip link add macvlan1 link eth0 type macvlan mode bridge
  # ip link add macvlan2 link eth0 type macvlan mode bridge
  # ip netns add net1
  # ip netns add net2
  # ip link set macvlan1 netns net1
  # ip link set macvlan2 netns net2

- Add the host to a macvlan so it can communicate with the slaves directly:
https://unix.stackexchange.com/questions/400190/how-to-make-reachable-macvlan-aliases-in-a-different-namespaces

* Notes:
http://hicu.be/bridge-vs-macvlan

### IPVLAN

IPVLAN is similar to MACVLAN with the difference being that the endpoints have the same MAC address.
- IPVLAN L2 mode acts like a MACVLAN in bridge mode. The parent interface looks like a bridge or switch.
- In IPVLAN L3 mode, the parent interface acts like a router and packets are routed between endpoints, which gives better scalability.

=> In mode l3, needs to setup 'ip neigh' explicitely or set up routing
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/getting-started-with-ipvlan_configuring-and-managing-networking

* More on ipvlan:
https://www.kernel.org/doc/Documentation/networking/ipvlan.txt
https://hicu.be/macvlan-vs-ipvlan
https://gist.github.com/nerdalert/c0363c15d20986633fda Macvlan, Ipvlan and 802.1q Trunk Driver Notes (Seting up macvlan/ipvlan in docker)
https://gist.github.com/nerdalert/f493d475d9ad36e194d6 Quick Paste Ipvlan L3 Instructions

* Exemples:
  # ip netns add ns0
  # ip link add name ipvl1 link eth0 type ipvlan mode l2
  # ip link set dev ipvl0 netns ns0

Cf https://superuser.com/questions/1113812/how-to-configure-macvlan-interface-for-getting-the-ip
  Macvlans are not built to work on wireless interfaces.
  To circumvent this problem, you should use an ipvlan instead, which uses the mac address of the physical interface
  $ ip link add link wlan0 ipvl0 type ipvlan mode l2
  $ ip link set dev ipvl0 up
  $ ip addr add 192.168.73.201/24 dev ipvl0
  (my LAN is 192.168.73.0/24, change as needed to adapt it to your case) and you can also change the default gateway to be accessible on the new virtual interface, instead of the old, physical one:
  $ ip route del default
  $ ip route add default via 192.168.73.1 dev ipvl0 src 192.168.73.201 metric 1
  The only noteworthy comment is that I used mode L2: ipvlans have three
  modes of operation, L2,L3,L3S (never mind that it is generally said that
  they have two modes, there is also the L3S which is similar to L3 but
  allows operation of iptables/conntrack). The difference between L2 and L3
  is that L2 allows the virtual interface to be bridged with the physical
  interface, which means it can have an address in the same subnet as the
  physical interface and L2 traffic is correctly relayed. L3 mode instead
  does not relay L2 traffic, and requires configuration as an IPv4 router:
  different subnets, need to setup routes, and so on. More hassle than
  worth, most of the times.

=> Full example with a namespace:
sudo ip link add link wlp2s0 ipvl0 type ipvlan mode l2
sudo ip netns add nsip
sudo ip link set ipvl0 netns nsip
sudo ip -n nsip addr add 192.168.0.51/24 dev ipvl0
sudo ip -n nsip link set ipvl0 up
sudo ip -n nsip route add default via 192.168.0.1

### MACVTAP/IPVTAP
MACVTAP/IPVTAP is a new device driver meant to simplify virtualized bridged networking. When a MACVTAP/IPVTAP instance is created on top of a physical interface, the kernel also creates a character device/dev/tapX to be used just like a TUN/TAP device, which can be directly used by KVM/QEMU.

With MACVTAP/IPVTAP, you can replace the combination of TUN/TAP and bridge drivers with a single module:

  # ip link add link eth0 name macvtap0 type macvtap

## Tunnels
[cf to_exterieur for more tunneling and vpns]

* Documentation
https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/
    IPIP Tunnel [ip over ip]
    SIT Tunnel [IPv6/ipv4 over IPv4 tunneling mode]
    ip6tnl Tunnel [like sit but over ipv6]
    VTI and VTI6 [for ipsec]
    GRE and GRETAP [GRE could encapsulate any Layer 3 protocol with a valid Ethernet type (so multicast, icmp), unlike IPIP, which can only encapsulate IP. GRE: OSI Layer 3, GRETAP: OSI Layer 2]
    GRE6 and GRE6TAP [GRE for ipv6]
    FOU [FOU (foo over UDP) is UDP-level tunneling]
    GUE [Generic Udp encapsulation]
    GENEVE [Generic Network Virtualization Encapsulation (GENEVE) supports all of the capabilities of VXLAN, NVGRE, and STT and was designed to overcome their perceived limitations. => Encapsule ethernet over udp]
    ERSPAN and IP6ERSPAN

=> ip tunnel add mode ipip/sit/isatap/vti/gre/ip6ip6/...

* ipip
Cf https://www.netdevconf.org/0.1/docs/herbert-UDP-Encapsulation-Linux.pdf for using gre.

* udp encapsulation:
https://lwn.net/Articles/614348/ => foo over udp
  receive  $ ip fou add port 5555 ipproto 4
  transmit $  ip link add name tun1 type ipip \
       remote 192.168.1.1 local 192.168.1.2 ttl 225 \
       encap fou encap-sport auto encap-dport 5555

* fou vs gue:
http://man7.org/linux/man-pages/man8/ip-gue.8.html
The receiver infers the protocol of a packet received on a FOU UDP port to be
the protocol configured for the port.
Generic UDP Encapsulation (GUE) encapsulates packets of an IP
protocol within UDP and an encapsulation header. The encapsulation header
contains the IP protocol number for the encapsulated packet.
   Configure a FOU receive port for GRE bound to 7777
       # ip fou add port 7777 ipproto 47
   Configure a FOU receive port for IPIP bound to 8888
       # ip fou add port 8888 ipproto 4
   Configure a GUE receive port bound to 9999
       # ip fou add port 9999 gue

### Exemples
* ipip

  On Server A:
  # ip link add name ipip0 type ipip local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR
  # ip link set ipip0 up
  # ip addr add INTERNAL_IPV4_ADDR/24 dev ipip0
  Add a remote internal subnet route if the endpoints don't belong to the same subnet
  # ip route add REMOTE_INTERNAL_SUBNET/24 dev ipip0

  On Server B:
  # ip link add name ipip0 type ipip local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR
  # ip link set ipip0 up
  # ip addr add INTERNAL_IPV4_ADDR/24 dev ipip0
  # ip route add REMOTE_INTERNAL_SUBNET/24 dev ipip0

* sit

  # ip link add name sit1 type sit local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR mode any
  # ip link set sit1 up
  # ip addr add INTERNAL_IPV4_ADDR/24 dev sit1

* ip6tnl
  # ip link add name ipip6 type ip6tnl local LOCAL_IPv6_ADDR remote REMOTE_IPv6_ADDR mode any

* gre/gretap

  # ip link add name gre1 type gre local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR [seq] key KEY
  # ip link add name gretap1 type gretap local LOCAL_IPv4_ADDR remote REMOTE_IPv4_ADDR

* fou/gue
  Server A # ip fou add port 5555 ipproto 4
  Server B # ip link add name tun1 type ipip remote 192.168.1.1 local 192.168.1.2 ttl 225 encap fou encap-sport auto encap-dport 5555

  Server A # ip fou add port 5555 gue
  Server B # ip link add name tun1 type ipip remote 192.168.1.1 local 192.168.1.2 ttl 225 encap gue encap-sport auto encap-dport 5555

* Geneve
  # ip link add name geneve0 type geneve id VNI remote REMOTE_IPv4_ADDR

User space networking
=====================

* Fullnetwork stack
- https://github.com/rootless-containers/slirp4netns [used by rootless containers]
- https://www.linuxjournal.com/content/userspace-networking-dpdk
  DPDK is a fully open-source project that operates in (root) userspace. Used by Open vSwitch (OvS)

* Tun/Tap

* Switch VDE
  http://manpages.ubuntu.com/manpages/trusty/man1/vde_switch.1.html
  vde_switch - Virtual Distributed Ethernet switch

  Exemple: https://renatonel.wonderhowto.com/news/networking-virtual-machines-using-vde-0128489/
  $ sudo ip tuntap add mode tap tap0
  $ sudo vde_switch -s /tmp/vde.ctl -tap tap0
  Connect kvm to the vde switch:
  # vdeq kvm -hda local_hard_drive -net nic -net vde,sock=/tmp/vde.ctl -m 256

  More details: http://wiki.virtualsquare.org/wiki/index.php/VDE_Basic_Networking
  $ vdeq qemu -hda qemu-image -m 128 

  + Slirp: a virtual NAT router as a process
    The simplest way to connect your virtual network to the Internet is slirp. Slirp is a process that appear as a router on the virtual network. The slirp process forwards all the communications coming from the virtual network to the Internet. 
  => $ slirpvde -s /tmp/switch1 --dhcp

  Or use a tap to connect to the host network:
  # vde_switch -s /tmp/switch1 -tap tap0 -m 666

  + connect two vde switches
  $ dpipe vde_plug /tmp/switch1 = vde_plug /tmp/switch2

* Divers:
- https://github.com/snabbco/snabb
  Snabb: Simple and fast packet networking
- https://blog.scottlowe.org/2013/11/26/lxc-open-vswitch-and-gre-tunnels/

Routing and forwarding
======================

- rp_filter: cf [sysctl] pour rp_filter.
https://linuxfr.org/users/glandos/journaux/routage-avance-avec-marquage-de-paquet-et-rp_filter
https://serverfault.com/questions/932205/advanced-routing-with-firewall-marks-and-rp-filter
=> rp_filter ne regarde pas la valeur des marks pour les décisions de routing
(contrairement au vrai routing), sauf si `src_valid_mark=1`. Par contre il
regarde bien la valeur du tos.

- https://wiki.zionetrix.net/informatique:reseau:routage-internet-multi-liens

Routing daemon
--------------

https://en.wikipedia.org/wiki/Routing_Information_Protocol
https://en.wikipedia.org/wiki/Border_Gateway_Protocol

https://www.networkcomputing.com/data-centers/comparing-dynamic-routing-protocols
RIP, EIGRP and OSPF are all interior gateway protocols (IGP) while BGP is
an exterior gateway protocol (EGP). Basically, interior protocols are meant
to dynamically route data across a network that you fully control and
maintain. Exterior routing protocols are used to exchange routes between
distinctly separate networks that you have no administrative control over.

- quagga (fork of gnu zebra)
- bird routing daemon: https://bird.network.cz/?index
- scripting bgp: exabgp

Exemples
========

Modules
-------
sudo modprobe -r rt73usb rt73
sudo modprobe rt73
Forwarding
----------
see [sysctl] for other sysctls
see https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt

sysctl net.ipv4.ip_forward=1
Sysctl rules:
  conf/default/*: Change the interface-specific default settings.
  conf/all/*: Change all the interface-specific settings.
  net.ipv4.ip_forward = 1 #resets all configuration parameters to their default state
  net.ipv4.conf.all.forwarding = 1 #set all specific interfaces (including default); this seems to be equivalent to net.ipv4.ip_forward
  net.ipv4.conf.default.forwarding = 1
  net.ipv4.conf.eth0.forwarding = 1 #enable ip forwarding on this interface
  net.ipv4.conf.eth0.mc_forwarding = 0 #enable multicast routing
  net.ipv6.conf.all.forwarding = 0
  net.ipv6.conf.eth0.forwarding = 0

More details:https://utcc.utoronto.ca/~cks/space/blog/linux/IpForwardingSettings
- all/forwarding: setting this is the same as setting the global sysctl.
- default/forwarding: controls the default state of forwarding; this state gets used by interfaces that have not set a specific value. Setting the global sysctl counts as giving all existing interfaces a specific value.

Masquerading:
iptables -t nat -A POSTROUTING -o output_interface -j MASQUERADE

If we have a firewall open it for the NAT:
- Accepts all already established connection
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
- Accept input packets from our NAT:
iptables -A FORWARD -i input_interface -o output_interface -j ACCEPT

Spoof mac address
-----------------
sudo ip link set dev wlan0 down
sudo ip link set dev wlan0 address 00:08:a1:b0:a6:a2
sudo ip link set dev wlan0 up
sudo iw dev wlan0 set type managed
sudo iwpriv wlan0 set AuthMode=WPAPSK
sudo iwpriv wlan0 set EncrypType=AES
sudo iwpriv wlan0 set SSID="SSID"
sudo iwpriv wlan0 set WPAPSK="PASSWD"
sudo dhclient/dhcpcd wlan0

http://unix.stackexchange.com/questions/21841/make-some-virtual-mac-address
ip link add link eth0 name eth0.1 address 00:11:11:11:11:11 type macvlan
ip link set eth0.1 up
dhclient -v eth0.1
ip link set dev eth0.1 address 00:08:a1:b0:a6:a2
sudo ip link delete eth0.1

wowlan
------

sudo iw phy phy0 wowlan enable magic-packet
iw help wowlan

Network namespaces
------------------

https://blogs.igalia.com/dpino/2016/04/10/network-namespaces/

 # Create namespace
sudo ip netns add ns1

 # Create veth link.
sudo ip link add v-eth1 type veth peer name v-peer1

 # Add peer-1 to NS.
sudo ip link set v-peer1 netns ns1

 # Setup IP address of v-eth1.
sudo ip addr add 10.200.1.1/24 dev v-eth1
sudo ip link set v-eth1 up

 # Setup IP address of v-peer1.
sudo ip netns exec ns1 ip addr add 10.200.1.2/24 dev v-peer1
sudo ip netns exec ns1 ip link set v-peer1 up
sudo ip netns exec ns1 ip link set lo up

 # Routing
sudo ip netns exec ns1 ip route add default via 10.200.1.1

 ## Share internet access between host and NS.

 # Enable IP-forwarding.
 # echo 1 > /proc/sys/net/ipv4/ip_forward
sudo sysctl net.ipv4.ip_forward=1

 # Flush forward rules, policy DROP by default.
sudo iptables -P FORWARD DROP
sudo iptables -F FORWARD

 # Flush nat rules.
sudo iptables -t nat -F

 # Enable masquerading of 10.200.1.0.
 dev=wlp2s0 #the device connected to the internet
sudo iptables -t nat -A POSTROUTING -s 10.200.1.0/255.255.255.0 -o $dev -j MASQUERADE

 # Allow forwarding between $dev and v-eth1.
sudo iptables -A FORWARD -i $dev -o v-eth1 -j ACCEPT
sudo iptables -A FORWARD -o $dev -i v-eth1 -j ACCEPT

sudo ip netns exec ns1 bash
sudo ip netns exec ns1 sudo -u dams zsh
sudo ip netns exec ns1 su dams

 # https://www.cyberciti.biz/faq/how-to-find-my-public-ip-address-from-command-line-on-a-linux/
curl ifconfig.me

Réseaux virtuels
----------------
* https://vincent.bernat.ch/en/blog

- https://vincent.bernat.ch/fr/blog/2011-lab-reseau-uml
  user mode linux connectés par tap ou vde_switch

  Exemple tap: on crée deux taps tap-R1, tap-R2 reliés en bridge
  $ linux init=/bin/sh rootfstype=hostfs eth0=tuntap,tap-R1
  $ linux init=/bin/sh rootfstype=hostfs eth0=tuntap,tap-R2

  Avec vde_switch:
  $ vde-switch
  $ linux init=/bin/sh rootfstype=hostfs eth0=vde

- https://vincent.bernat.ch/en/blog/2011-lab-site-to-site-vpn
  BGP via bird

- https://vincent.bernat.ch/fr/blog/2018-vpn-wireguard-route
  VPN routé avec Linux et WireGuard (+BGP via bird)

- https://vincent.bernat.ch/fr/blog/2017-vpn-ipsec-route
  VPN IPsec routé avec Linux et strongSwan (+bird)
