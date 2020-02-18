vim: ft=markdownlight fdm=expr

# NAT

* Types of NAT
- http://www.think-like-a-computer.com/2011/09/16/types-of-nat/
- https://www.think-like-a-computer.com/2011/09/19/symmetric-nat/
  (+ details on the STUN protocol)
  https://networkengineering.stackexchange.com/questions/7781/why-stun-doesnt-work-with-symmetric-nat

* stun / turn server:
https://github.com/coturn/coturn

Stun clients: https://unix.stackexchange.com/questions/25019/checking-the-type-of-nat?rq=1

# Iptables

-F chain: flush the selected chain
-P chain accept/drop: set the policy
-S: print all rules in the selected chain
    without a chain show all chains (cf iptables-save too)

# UFW
https://wiki.archlinux.org/index.php/Uncomplicated_Firewall

ufw default deny
ufw allow from 192.168.0.0/24
ufw allow Deluge #cf ufw app list
ufw limit SSH

Check: ufw status; ufw show raw

# Conntrack

* https://home.regit.org/netfilter-en/netfilter-connmark/

Mark filtering like `ip rule` is done on the packet level. Using conntrack
connmark, one can set the mark as the connmark's mark.
Cf https://wiki.nftables.org/wiki-nftables/index.php/Matching_connection_tracking_stateful_metainformation
https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_metainformation

- zones: https://lwn.net/Articles/370152/
Virtual conntrack tables that can be used to separate connections from
different zones, allowing to handle multiple connections with equal
identities in conntrack and NAT.

- https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes#Ct

- https://superuser.com/questions/1269859/linux-netfilter-how-does-connection-tracking-track-connections-changed-by-nat
  conntrack for nat

# Nftables

* Doc
- http://en.wikipedia.org/wiki/Nftables
- https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes
- https://www.netfilter.org/projects/nftables/manpage.html

nftables is a project providing packet filtering and packet classification on Linux, and it is intended to replace existing iptables, ip6tables, arptables and ebtables frameworks. nftables is a combination of a Linux kernel engine, and a userspace utility.

- https://home.regit.org/2014/01/why-you-will-love-nftables/
- https://wiki.archlinux.org/index.php/nftables
- https://ungleich.ch/en-us/cms/blog/2018/08/18/iptables-vs-nftables/

Very nice packet flow diagram: 
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

## cmdline

* RULESET
           {list | flush} ruleset [family]

* TABLES
           {add | create} table [family] table [{ flags flags ; }]
           {delete | list | flush} table [family] table
           list tables
           delete table [family] handle handle
  list 'table': show the full content. list tables: only show table names.

* CHAINS
           {add | create} chain [family] table chain [{ type type hook hook [device device] priority priority ; [policy policy ;] }]
           {delete | list | flush} chain [family] table chain
           list chains
           delete chain [family] table handle handle
           rename chain [family] table chain newname

* RULES
           {add | insert} rule [family] table chain [handle handle | index index] statement ... [comment comment]
           replace rule [family] table chain handle handle statement ... [comment comment]
           delete rule [family] table chain handle handle

* Scripting
SETS
           add set [family] table set { type type ; [flags flags ;] [timeout timeout ;] [gc-interval gc-interval ;] [elements = { element[, ...] } ;] [size size ;] [policy policy ;] [auto-merge ;] }
           {delete | list | flush} set [family] table set
           list sets
           delete set [family] table handle handle
           {add | delete} element [family] table set { element[, ...] }

MAPS
           add map [family] table map { type type [flags flags ;] [elements = { 
element[, ...] } ;] [size size ;] [policy policy ;] }
           {delete | list | flush} map [family] table map
           list maps
           {add | delete} element [family] table map { elements = { element[, ...] } ; }

FLOWTABLES
           {add | create} flowtable [family] table flowtable { hook hook priority priority ; devices = { device[, ...] } ; }
           {delete | list} flowtable [family] table flowtable

STATEFUL OBJECTS
           {add | delete | list | reset} type [family] table object
           delete type [family] table handle handle
           list counters
           list quotas

DESCRIBE COMMAND
           describe expression

## Tables, chains and rules

* List Rules
=> see rules in table 'inet filter': `sudo nft list table inet filter`

See all rules: sudo nft list ruleset

$ sudo nft list ruleset -a # list rule handle
=> used to select where to add a rule: nft add rule filter output position 8 ip daddr 127.0.0.8 drop; or which rule to delete

* Add a rule

Add a table named filter: nft add table inet filter
(note that if the table type is not specified, default to type ip)

Then add a chain: nft add chain inet filter tcpchain

Then add rules to a chain: nft add rule inet filter tcpchain ...

Base chain: nft add chain ip foo output { type filter hook output priority 0 \; } # a non base chain do not see any packets by default
  $ nft add chain [<family>] <table-name> <chain-name> { type <type> hook <hook> priority <value> \; [policy <policy>] }

Algorithm: nftable go through each chain (by priority). Then it applies the
rules, until it find a drop (=> drop the packet), or an accept (=> go to the
next chain). If there is no matching rule, it applies the default policy.

Policies: accept (default) or drop. 

* Tables family: compared to iptables
ip 	iptables
ip6 	ip6tables
inet 	iptables and ip6tables
arp 	arptables
bridge 	ebtables 
+ new table netdev, for the ingress hook, can be used instead of `tc ingress`

* Chain types and hooks

Base chain types: filter, route, nat
- filter: all families, all hooks
- route: ip and ip6 table families, output hook
  If a packet has traversed a chain of this type and is about to be accepted, a new route lookup is performed if relevant parts of the IP header have changed. This allows to e.g. implement policy routing selectors in nftables.
- nat: ip and ip6 table families, all hooks except forwarding
    The first packet that belongs to a flow always hits this chain, follow up packets not. Therefore, never use this chain for filtering.

Hooks: ingress, prerouting, input, forward, output, postrouting
- netdev: ingress
- ip, ip6, inet, bridge: prerouting, input, forward, output, postrouting
- arp: input, output

Cf https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks
The order is as follow:
ingress -> prerouting -> [Routing decision] -> forward -> postrouting
                               |-> input -> [local process] -> output -> [Routing decision] -> postrouting

* Reloading:
    echo "flush ruleset" > /tmp/nftables
    sudo nft list ruleset >> /tmp/nftables
    sudo nft -f /tmp/nftables

* Default priorities
  https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains

    NF_IP_PRI_CONNTRACK_DEFRAG (-400): priority of defragmentation
    NF_IP_PRI_RAW (-300): traditional priority of the raw table placed before connection tracking operation
    NF_IP_PRI_SELINUX_FIRST (-225): SELinux operations
    NF_IP_PRI_CONNTRACK (-200): Connection tracking operations
    NF_IP_PRI_MANGLE (-150): mangle operation
    NF_IP_PRI_NAT_DST (-100): destination NAT
    NF_IP_PRI_FILTER (0): filtering operation, the filter table
    NF_IP_PRI_SECURITY (50): Place of security table where secmark can be set for example
    NF_IP_PRI_NAT_SRC (100): source NAT
    NF_IP_PRI_SELINUX_LAST (225): SELinux at packet exit
    NF_IP_PRI_CONNTRACK_HELPER (300): connection tracking at exit

## Rules

### Filtering

1) Overview
meta: A meta expression refers to meta data associated with a packet. 
fib: forwarding information base. Ex: filter prerouting fib saddr . iif oif missing drop
rt: routing info, like nexthop. Ex: inet filter output rt ip nexthop 192.168.0.1

Payloads: ether [daddr, saddr, type] / vlan / arp / ip / icmp / ip6 /
icmpv6 / tcp / udp / udplite / sctp / dccp / ah / esp / comp

Raw payload: @[base,offset,length] [base=th: transport header, like tcp;
nh: network header like ip; ll: link layer, like ethernet]
Ex:
- Matching destination port of both UDP and TCP 
  inet filter input meta l4proto {tcp, udp} @th,16,16 { dns, http }
 - Rewrite arp packet target hardware address if target protocol address matches a given address
  input meta iifname enp2s0 arp ptype 0x0800 arp htype 1 arp hlen 6 arp plen 4 @nh,192,32 0xc0a88f10 @nh,144,48 set 0x112233445566 accept

2) Exemples
* https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_header_fields
  Filter protocol:
ip protocol tcp #ipv4
ip6 nexthdr tcp #ipv6
meta l4proto tcp #ip4 and ip6, cf https://www.spinics.net/lists/netfilter/msg57618.html

  When in inet table:
nfproto ipv4 / ipv6 #we are actually in the ipv? case

  Filter addresses:
ip saddr 192.168.1.100 ip daddr 192.168.1.1 counter
ip6 daddr abcd::100 counter

  Fiter tcp:
tcp dport 1-1024 counter dropcp flags syn tcp option maxseg size 1-500 drop
(note that in this filter, the 'meta l4proto tcp' is implied)

  Filter tcp and udp
meta l4proto { tcp, udp } @th,16,16 53 counter packets 0 bytes 0 accept comment \"accept DNS\"

  Filter icmp:
icmp type echo-request counter drop

icmp types: echo-reply destination-unreachable source-quench redirect echo-request time-exceeded parameter-problem timestamp-request timestamp-reply info-request info-reply address-mask-request address-mask-reply, router-advertisement, router-solicitation
icmpv6 type {destination-unreachable, packet-too-big, time-exceeded,
echo-request, echo-reply, mld-listener-query, mld-listener-report,
mld-listener-reduction, nd-router-solicit, nd-router-advert,
nd-neighbor-solicit, nd-neighbor-advert, nd-redirect, parameter-problem,
router-renumbering}

Exemple: sudo nft add rule inet ploum foobar  meta nfproto ipv6 ip6 nexthdr
icmpv6 accept => this is simplified by nftable into 'ip6 nexthdr ipv6-icmp accept'

* https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_metainformation
    meta +
    - interface device name and interface device index: iifname, oifname, iif and oif.
    - interface type: iiftyte and oiftype.
    - tc handle: priority.
    - socket user and group identifier: skuid and skgid.
    - packet length: length.

* https://wiki.nftables.org/wiki-nftables/index.php/Matching_connection_tracking_stateful_metainformation

   ct +
   -  State information: new, established, related and invalid (+untracked). In this regard, there is no changes with iptables. -> ct state 
      Ex: ct state established,related
   - The conntrack mark.
      Ex: ct mark 1234
   - Status information: expected, seen-reply, assured, confirmed, snat, dnat, dying.

* https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings

icmp type echo-request limit rate 10/second accept
equivalently:
icmp type echo-request limit rate over 10/second drop

3) Routing exemples

* https://wiki.nftables.org/wiki-nftables/index.php/Routing_information
nft add rule filter postrouting ip daddr 192.168.1.0/24 rt nexthop != 192.168.0.1 drop

General syntax is: rt key operator expression, where:
    key: classid, nexthop
    operator: eq, neq, gt, lt, gte, lte, vmap, map

The fib statement can be used to obtain the output interface from the route table based on either source or destination address of a packet.
This can be used to e.g. add reverse path filtering, or eg. drop if not coming from the same interface packet arrived on:

Par exemple `fib saddr oif` regarde la (output) routing interface de
l'addresse source. `fib saddr . iif oif` regarde la routing interface de
l'adresse source via l'interface entrée (ie c'est non nul ssi elle passe
bien par la iif).

Exemple: implémenter rp_filter=1
$ nft add rule x prerouting fib saddr . iif oif eq 0 drop

Comme avant sauf qu'en plus on n'accepte que le forwarding entrant via eth0
$ nft add rule x prerouting fib saddr . iif oif eq "eth0" accept

Implémenter rp_filter=2
$ nft add rule x prerouting fib saddr oif accept

Only accept packets to addresses configured in the same interface
$ nft add rule x prerouting fib daddr . iif type local accept

Regarder le routing via une mark que l'on a mise:
$ nft add rule x prerouting meta mark set 0xdead fib daddr . mark type vmap {
                blackhole : drop,
                prohibit : drop,
                unicast : accept
        }

Autre exemple, cf https://unix.stackexchange.com/questions/524293/why-linux-allows-connection-on-a-different-interface-ip-even-if-forwarding-is-di
If the address is not local nor broadcast nor multicast to the interface packet came from then drop it.
$ nft add rule inet filter input fib daddr . iif type != { local, broadcast, multicast } drop

Exemples in man nft,
=> on peut aussi spécifier `oif exists/missing`
   # drop packets without a reverse path
   filter prerouting fib saddr . iif oif missing drop
   # match if route exists
   filter input fib daddr . iif oif exists]
   # drop packets to address not configured on ininterface
   filter prerouting fib daddr . iif type != { local, broadcast, multicast } drop

### Actions

* Verdict statement
- accept: Accept the packet and stop the remain rules evaluation.
- drop: Drop the packet and stop the remain rules evaluation.
- queue: Queue the packet to userspace and stop the remain rules evaluation.
  https://wiki.nftables.org/wiki-nftables/index.php/Queueing_to_userspace
  Allows userspace to determine the policy for this packet
- continue: Continue the ruleset evaluation with the next rule.
- return: Return from the current chain and continue at the next rule of the last chain. In a base chain it is equivalent to accept
- jump <chain>: Continue at the first rule of <chain>. It will continue at the next rule after a return statement is issued
- goto <chain>: Similar to jump, but after the new chain the evaluation will continue at the last chain instead of the one containing the goto statement<Paste>

* Settings things
- payload: ip forward ip dscp set 42
- extension header: 
  tcp flags syn tcp option maxseg size set 1360
  # set a size based on route information:
  tcp flags syn tcp option maxseg size set rt mtu
- ct {mark | event | label | zone} set value # conntrack
- meta {mark | priority | pkttype | nftrace} set value # meta infos

* Extra action:
- log, log level emerg, log level alert
  https://wiki.nftables.org/wiki-nftables/index.php/Logging_traffic
  % nft add rule filter input tcp dport 22 ct state new log prefix \"New SSH connection: \" accept
- reject $ nft add rule filter input reject #by default: an ICMP/ICMPv6 port unreachable packet is sent to the origin.
  reject with icmp type host-unreachable net-unreachable prot-unreachable port-unreachable net-prohibited host-prohibited admin-prohibited
  reject with icmpv6 type no-route admin-prohibited addr-unreachable port-unreachable
  ip protocol tcp reject with tcp reset
  reject with icmpx type host-unreachable no-route admin-prohibited port-unreachable (= in inet table, both for ipv4 and ipv6)
- counter, counter packets 0 bytes 0 (init counter state)
- limit rate [over] <value> <unit> [burst <value> <unit>]
  https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings
  Explanation of burst:
  https://community.ui.com/questions/limit-rate-and-limit-burst/88d4411f-6055-45ab-aa15-2c4bf0666707?page=1
  => the implementation uses a "token bucket" algorithm, so the "burst time" is tied to the observed rate. Burst = size of token bucket, rate limit: speed the bucket is emptied.
- nat: dnat [to] 192.168.3.2, snat [to] 192.168.3.2, masquerade / masquerade persistent,fully-random,random / masquerade to :1024, masquerade to :1024-2048, redirect to :2222
- flow offload @flowtable
- dup to device / dup to address device device 
- fwd to device [ingress hook]
- {add | update} @setname { expression [timeout timeout] [comment string] }

* Jump vs goto:
https://wiki.nftables.org/wiki-nftables/index.php/Jumping_to_chain
% nft add rule ip filter input ip protocol tcp jump tcp-chain
- jump: packet will continue to the next rule of the chain after
- goto: packet will not return to the calling chain, instead the default policy of the calling chain is applied

* Exemples:
- add rate limiting:
sudo nft add rule inet filter input tcp dport ssh limit rate 6/minute accept
- ban ip:
sudo nft add rule inet filter input ip saddr 59.45.79.69 counter drop

### Changing packets

* https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)

Stateful NAT => need both {pre,post}routing chain for the automatic
translation in the other direction:

% nft add table nat
% nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
% nft add chain nat postrouting { type nat hook postrouting priority 100 \; }

SNAT
% nft add rule nat postrouting ip saddr 192.168.1.0/24 oif eth0 snat 1.2.3.4

DNAT
% nft add rule nat prerouting iif eth0 tcp dport { 80, 443 } dnat 192.168.1.120

MASQUERADE = snat where the source address is automagically set to the address of the output interface.
% nft add rule nat postrouting masquerade

REDIRECT: By using redirect, packets will be forwarded to local machine. Is a special case of DNAT where the destination is the current machine. 

% nft add rule nat prerouting redirect
% nft add rule nat prerouting tcp dport 22 redirect to 2222

Nat flags:
- random: randomize source port mapping.
- fully-random: full port randomization.
- persistent: gives a client the same source-/destination-address for each connection.

% nft add rule nat postrouting masquerade random,persistent
% nft add rule nat postrouting ip saddr 192.168.1.0/24 oif eth0 snat 1.2.3.4 fully-random

For stateless nat, one can simply mangle packets.

* https://wiki.nftables.org/wiki-nftables/index.php/Mangle_packet_header_fields
* https://wiki.nftables.org/wiki-nftables/index.php/Mangle_TCP_options
For mangle: one has to use notrack because mangling breaks connection
tracking.

% nft add table raw
% nft add chain raw prerouting {type filter hook prerouting priority -300\;}

% nft add rule raw prerouting tcp dport 8080 tcp dport set 80 notrack
% nft add rule ip6 raw prerouting ip6 daddr fd00::1 ip6 daddr set fd00::2 notrack
% nft add rule ip raw prerouting ip protocol tcp ip daddr set 192.168.1.100 tcp dport set 10 notrack
% nft add rule ip6 raw prerouting ip6 nexthdr tcp ip6 daddr set fe00::1 tcp dport set 10 notrack

* https://wiki.nftables.org/wiki-nftables/index.php/Duplicating_packets
% nft add rule mangle prerouting dup to 172.20.0.2 device eth1
% nft add rule mangle prerouting dup to ip saddr map { 192.168.0.1 : 172.20.0.2, 192.168.0.1 : 172.20.0.3 }

* Meta information

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_metainformation

- Mark
% nft add rule route output mark set 123

  Set the conntrack mark to the packet mark:
% nft add rule filter forward meta mark set 1 #packet mark=1
% nft add rule filter forward ct mark set mark #set ct mark to 1
  Other way: ct mark -> mark
% nft add rule filter forward meta mark set ct mark

- Priority
% nft add table mangle
% nft add chain postrouting {type route hook output priority -150\; }
% nft add rule mangle postrouting tcp sport 80 meta priority set 1

- Trace packet
% nft add rule filter forward udp dport 53 meta nftrace set 1

% nft add rule filter forward ip saddr 192.168.1.1 meta nftrace set 1 meta priority set 2 meta mark set 123

https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection_tracking_metainformation

notrack: skip connection tracking for matching packets. 

ct helpers:
table filter {
      ct helper sip-5060 {
             type "sip" protocol udp;
      }
      ct helper ftp-standard {
             type "ftp" protocol tcp;
      }
      chain c {
      }
}

nft add rule x y ct helper set udp dport map { \
                        69 : "tftp-69", \
                        5060 : "sip-5060" }

## Scripting

* https://wiki.nftables.org/wiki-nftables/index.php/Scripting

nft -f accept both a "table like format" or a "command like format". Plus
we can set variables.

- table like format:
  #!/usr/sbin/nft -f
  define ntp_servers = { 84.77.40.132, 176.31.53.99, 81.19.96.148, 138.100.62.8 }
  
  #flush table nat
  table ip nat {
  	chain prerouting {
  		type filter hook prerouting priority 0; policy accept;
                  ip saddr $ntp_servers counter
  	}
  
  	chain postrouting {
  		type filter hook postrouting priority 100; policy accept;
  	}
  }

- command like format
  #!/usr/sbin/nft -f

  define ntp_servers = { 84.77.40.132, 176.31.53.99, 81.19.96.148, 138.100.62.8 }

  add table filter
  add chain filter input { type filter hook input priority 0; }
  add rule filter input ip saddr $ntp_servers counter

- include 'filename'

- symbolic variables
           define int_if1 = eth0
           define int_if2 = eth1
           define int_ifs = { $int_if1, $int_if2 }
           filter input iif $int_ifs accept

* https://wiki.nftables.org/wiki-nftables/index.php/Sets

  # Add a set to the table filter
% nft add set filter blackhole { type ipv4_addr\;}
% nft add element filter blackhole { 192.168.3.4 }
% nft add element filter blackhole { 192.168.1.4, 192.168.1.5 }
% nft add rule ip input ip saddr @blackhole drop #use the set

% nft list set filter myset #see the set

  # One can set flags and timeout
% nft add set filter daddrs {type ipv4_addr \; flags timeout \; elements={192.168.1.1 timeout 10s, 192.168.1.2 timeout 30s} \;}
  For timeout, see https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts

* https://wiki.nftables.org/wiki-nftables/index.php/Intervals

% nft add rule filter input ip daddr 192.168.0.1-192.168.0.250 drop
% nft add rule filter input tcp ports 1-1024 drop
% nft add rule ip filter input ip saddr { 192.168.1.1-192.168.1.200, 192.168.2.1-192.168.2.200 } drop
% nft add rule ip filter forward ip daddr vmap { 192.168.1.1-192.168.1.200 : jump chain-dmz, 192.168.2.1-192.168.20.250 : jump chain-desktop }


* https://wiki.nftables.org/wiki-nftables/index.php/Maps
* https://wiki.nftables.org/wiki-nftables/index.php/Dictionaries

% nft add rule ip nat prerouting dnat tcp dport map { 80 : 192.168.1.100, 8888 : 192.168.1.101 }

% nft add map nat porttoip  { type inet_service: ipv4_addr\; }
% nft add element nat porttoip { 80 : 192.168.1.100, 8888 : 192.168.1.101 }
% nft add rule ip nat postrouting snat tcp dport map @porttoip

- vmap: like map, but contains verdict as values
% nft add rule ip filter input ip protocol vmap { tcp : jump tcp-chain, udp  : jump udp-chain , icmp : jump icmp-chain }

% nft add map filter mydict { type ipv4_addr : verdict\; }
% nft add element filter mydict { 192.168.0.10 : drop, 192.168.0.11 : accept }
% nft add rule filter input ip saddr vmap @mydict

* https://wiki.nftables.org/wiki-nftables/index.php/Concatenations

% nft add rule ip filter input ip saddr . ip daddr . ip protocol { 1.1.1.1 . 2.2.2.2 . tcp, 1.1.1.1 . 3.3.3.3 . udp} counter accept

% nft add map filter whitelist { type ipv4_addr . inet_service : verdict \; }
% nft add element filter whitelist { 1.2.3.4 . 22 : accept}
% nft add rule filter input ip saddr . tcp dport vmap @whitelist

% nft add rule ip nat prerouting dnat ip saddr . tcp dport map { 1.1.1.1 . 80 : 192.168.1.100, 2.2.2.2 . 8888 : 192.168.1.101 }

* Dynamic changing of sets and maps
https://wiki.nftables.org/wiki-nftables/index.php/Meters
https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path
=> Useful for ban lists

There are two main operations: add and update, which differs in how they modify any previous element timeout. The update command refreshes the element timeout for each packet seen, while add does not. 

* https://wiki.nftables.org/wiki-nftables/index.php/Math_operations
=> Number generator and hashing

* https://wiki.nftables.org/wiki-nftables/index.php/Stateful_objects
For quotas and specific counters

% nft add counter filter https-traffic
% nft add rule filter output tcp dport https counter name https-traffic
% nft add rule filter output counter name tcp dport map { \
          https : "https-traffic", \
          80 : "http-traffic", \
          25 : "foo-counter", \
          50 : "foo-counter", \
          107 : "foo-counter" \
  }

Note that ct helpers are also statefull objects.

Exemples:
% nft add counter ip filter mycounterd102 packets 697173 bytes 850761603
% nft reset counters table ip filter

https://serverfault.com/questions/971633/how-to-reset-nftable-counter
=> Bug 1314 - nft reset quotas does not reset anonymous quotas

* https://wiki.nftables.org/wiki-nftables/index.php/Flowtable
For network stack bypass

## Exemples

* Exemple nat + forwarding (cf ~/script/netns)

  nft add table ip nat
  nft add chain ip nat prerouting \{ type nat hook prerouting priority 0 \; \}
  nft add chain ip nat postrouting \{ type nat hook postrouting priority 100 \; \}
  nft add rule ip nat postrouting oifname $dev ip saddr $peer_ip/$mask counter masquerade

  nft add table inet filter
  nft add chain inet filter forward \{ type filter hook forward priority 0 \; policy drop \; \}
  nft add rule inet filter forward iifname $dev oifname $veth ct state related,established counter accept
  nft add rule inet filter forward iifname $veth oifname $dev counter accept

  => nft list ruleset
table ip nat {
	chain prerouting {
		type nat hook prerouting priority filter; policy accept;
	}

	chain postrouting {
		type nat hook postrouting priority srcnat; policy accept;
		oifname "wlp2s0" ip saddr 10.200.1.0/24 counter packets 7 bytes 739 masquerade
	}
}
table inet filter {
	chain forward {
		type filter hook forward priority filter; policy drop;
		iifname "wlp2s0" oifname "v-eth1" ct state established,related counter packets 7792205 bytes 7745108594 accept
		iifname "v-eth1" oifname "wlp2s0" counter packets 6110542 bytes 1920155245 accept
	}
}

* ipv4/ipv6 Simple & Safe Firewall:
sudo nft -f /etc/nftables.conf
$ cat /etc/nftables.conf:
  # ipv4/ipv6 Simple & Safe Firewall
  # you can find examples in /usr/share/nftables/
  table inet filter {
    chain input {
      type filter hook input priority 0;

      # allow established/related connections
      ct state {established, related} accept

      # early drop of invalid connections
      ct state invalid drop

      # allow from loopback
      iifname lo accept

      # allow icmp
      ip protocol icmp accept
      ip6 nexthdr icmpv6 accept

      # allow ssh
      tcp dport ssh accept

      # everything else
      reject with icmpx type port-unreachable
    }
    chain forward {
      type filter hook forward priority 0;
      drop
    }
    chain output {
      type filter hook output priority 0;
    }
  }

* Exemples from the arch wiki
   [Here they use 'type filter hook input priority 0; policy drop;'
   so there is no need for the reject at the end]

To add to the input chain:

   tcp dport {ssh, http} accept
   tcp dport { 22, 80, 443 } ct state new accept
   # HTTP (ports 80 & 443)
   tcp dport { http, https } accept

   # limit rate
   ip protocol icmp icmp type echo-request limit rate over 10/second burst 4 packets  drop
   ip6 nexthdr icmpv6 icmpv6 type echo-request limit rate over 10/second burst 4 packets drop
   tcp dport ssh ct state new limit rate 15/minute accept #instead of the other ssh rule

   # only accept specific icmp types
   ip6 nexthdr icmpv6 icmpv6 type { destination-unreachable, packet-too-big, time-exceeded, parameter-problem, mld-listener-query, mld-listener-report, mld-listener-reduction, nd-router-solicit, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert, ind-neighbor-solicit, ind-neighbor-advert, mld2-listener-report } accept #see https://serverfault.com/questions/801131/my-nftables-rules-blocks-ipv6 for a minimal list
   ip protocol icmp icmp type { destination-unreachable, router-solicitation, router-advertisement, time-exceeded, parameter-problem } accept
   ip protocol igmp accept

	chain forward {
		type filter hook forward priority 0; policy drop;
	}

	chain output {
		type filter hook output priority 0; policy accept; #default
	}

* Advanced exemples:
https://wiki.nftables.org/wiki-nftables/index.php/Classic_perimetral_firewall_example
https://wiki.nftables.org/wiki-nftables/index.php/Port_knocking_example

## Advanced

* https://wiki.nftables.org/wiki-nftables/index.php/Classification_to_tc_structure_example

=> the 'meta priority' indicate the tc class handle to forward the packet
to

Ex: meta priority none ip saddr @priority_set meta priority set ip daddr map @group_114_prio counter packets 0 bytes 0

     packet:
        source address 8.8.8.8
        destination address 10.20.255.50
        meta priority none - matches packet only when there is no priority - tc class id - set yet
        ip saddr @priority_set - matches packet only when source IP address is listed in the set named priority_set - in our case 8.8.8.8 or 8.8.4.4 - can be subnet too
        meta priority set ip daddr map @group_114_prio - sets priority to packet based on its destination address, which is read from map named group_114_prio - sets priority to 1:ffd9

   map group_114 {
       type ipv4_addr : classid
       flags interval
       elements = { 10.20.255.50 : 1:ffd8, 10.20.255.90 : 1:ffd5,
                     10.20.255.130 : 1:ffd2 }
   }   

* https://wiki.nftables.org/wiki-nftables/index.php/Flowtable 

table inet x {

    flowtable f {
        hook ingress priority 0 devices = { eth0, eth1 };
    }

    chain y {
        type filter hook forward priority 0; policy accept;
        ip protocol tcp flow offload @f
        counter packets 0 bytes 0
    }
}

Plus de doc (cf les liens là bas):
https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt

# BPF

* In systemd

- IP based epf filter in systemd
  http://0pointer.net/blog/ip-accounting-and-access-lists-with-systemd.html

- Rejected port based filtering pr
  https://github.com/systemd/systemd/pull/7626
  BPF port-based firewall #7626 

- Attach custom bpf programs:
  https://news.ycombinator.com/item?id=20839478
  BPF port-based firewall for systemd services (kailueke.gitlab.io)
=> https://kailueke.gitlab.io/systemd-custom-bpf-firewall/
   https://kailueke.gitlab.io/systemd-bpf-firewall-loader/

* bpfilter
- https://www.mail-archive.com/netfilter-devel@vger.kernel.org/msg11130.html

Attacks
=======

firewall pour ssh
-----------------

Example of an attack:
  systemd[1]: Started OpenSSH Per-Connection Daemon (59.45.79.69:26254).
  sshd[15906]: User root from 59.45.79.69 not allowed because none of user's groups are listed in AllowGroups
  sshd[15906]: input_userauth_request: invalid user root [preauth]
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=59.45.79.69  user=root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: pam_tally(sshd:auth): Tally overflowed for user root
  sshd[15906]: Failed password for invalid user root from 59.45.79.69 port 26254 ssh2
  sshd[15906]: error: maximum authentication attempts exceeded for invalid user root from 59.45.79.69 port 26254 ssh2 [preauth]
  sshd[15906]: Disconnecting: Too many authentication failures [preauth]
  sshd[15906]: PAM 5 more authentication failures; logname= uid=0 euid=0 tty=ssh ruser= rhost=59.45.79.69  user=root
  sshd[15906]: PAM service(sshd) ignoring max retries; 6 > 3

- 'Tally overflow': /var/log/faillog shows that the user has already too many tries and is temped banned
- 'maximum authentication attempts exceeded': ssh allows the user 6 tries to authenticate, but pam only allow 3 anyway [hardcoded] and replies an error to the other 3 auth attempt

Prevent attacks [from older to newer]: denyhosts, fail2ban, sshguard
https://wiki.archlinux.org/index.php/sshguard

aircrack
--------

sudo airmon-ng start wlan0
sudo airodump-ng -c 11 -w data-capture wlan0mon
sudo aireplay-ng -3 -b 00:1a:2b:62:49:45 -h C8:02:10:06:01:5F wlan0mon
