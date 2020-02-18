vim: ft=markdownlight fdm=expr

# DNS entries

* https://en.wikipedia.org/wiki/List_of_DNS_record_types

A = ipv4
AAAA = ipv6
NS = nameserver (design an authoritative dns)
MX = mail exchange record
TXT = arbitrary text
URL = Can be used for publishing mappings from hostnames to URIs. 
PTR = Pointer to a canonical name. Unlike a CNAME, DNS processing stops and just the name is returned. The most common use is for implementing reverse DNS lookups, but other uses include such things as DNS-SD. 

Reverse dns:
dig 4.4.8.8.in-addr.arpa #reverse dns for 8.8.4.4
Ipv6: IPv6 address 2001:db8::567:89ab is b.a.9.8.7.6.5.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa
shortcut: dig -x 8.8.4.4, dig -x 2001:db8::567:89ab

* https://en.wikipedia.org/wiki/CNAME_record

- CNAME = "symlink"

  NAME                    TYPE   VALUE
  --------------------------------------------------
  bar.example.com.        CNAME  foo.example.com.
  foo.example.com.        A      192.0.2.23

- DNAME= like CNAME but for the subdomain (strictly)

foo.example.com.        DNAME  bar.example.com.
bar.example.com.        A      192.0.2.23
xyzzy.bar.example.com.  A      192.0.2.24
*.bar.example.com.      A      192.0.2.25

An A record lookup for foo.example.com will return no data because a DNAME is not a CNAME and there is no A record directly at foo.
However, a lookup for xyzzy.foo.example.com will be DNAME mapped and return the A record for xyzzy.bar.example.com, which is 192.0.2.24. Lastly, a request for foobar.foo.example.com would be DNAME mapped and return 192.0.2.25. 

* reserved tlds
https://tools.ietf.org/id/draft-chapin-rfc2606bis-00.html

Legacy reserved: test example invalid localhost
Additional reserved: .local .localdomain .domain .lan .home .host .corp

* Testing dnssec:
$ drill sigfail.verteiltesysteme.net
$ drill sigok.verteiltesysteme.net

Tools
=====

cf aussi [local] pour le réglage de nsswitch.conf

- Reverse ip lookup:
  https://reverseip.domaintools.com/
  https://www.shodan.io/host/186.2.163.171

## /etc/hosts

- /etc/hosts.
  192.168.0.11 feanor.home.lan. feanor

  Note: this also allow to have a fqdn for the local host
  eg if /etc/hostname is feanor, then hostname -f is feanor.home.lan
  (unfortunately for this we need to put an explicit ip address)
  [Note: another way to have a fqdn is to put "feanor.ploum" in
  /etc/hostname. But in this case `hostname` is feanor.ploum, we would need
  to use `hostname -s` to get feanor]

- user host file: $HOSTALIASES
  $ echo 'g www.google.com' >> ~/.hosts
  Note: http://blog.tremily.us/posts/HOSTALIASES/ 
  The HOSTALIASES file maps alias names to canonical host names, but the canonical name must be resolvable. You can't specify an IP address as the target.
  => so be wary of an ip alias, it get passed to the dns server and may fail
  (but dnsmasq does support direct ipv4 queries) 
  Cf https://unix.stackexchange.com/questions/226260/hostaliases-file-with-an-ip-address
  => use xip.io: host 10.10.0.1.xip.io => 10.10.0.1
  Note: it also only work for alias names, ie without a dot, not for
  'ploum.plam' aliases

xip.io alternatives: https://moss.sh/free-wildcard-dns-services/
=> sslip.io: support ipv6

## nss

- Query using nss:
getent hosts www.google.com #the adress used by the dns from nsswitch.conf
getent ahosts www.google.com #return all adresses

nsswitch.conf: hosts: files mymachines myhostname resolve [!UNAVAIL=return] dns

files: /etc/hosts, /etc/passwd and /etc/group

https://www.freedesktop.org/software/systemd/man/nss-myhostname.html
- The local, configured hostname is resolved to all locally configured IP
  addresses ordered by their scope, or — if none are configured — the IPv4
  address 127.0.0.2 (which is on the local loopback) and the IPv6 address
  ::1 (which is the local host).
- The hostnames "localhost" and "localhost.localdomain" (as well as any
  hostname ending in ".localhost" or ".localhost.localdomain") are resolved
  to the IP addresses 127.0.0.1 and ::1.
- The hostname "_gateway" is resolved to all current default routing gateway
  addresses, ordered by their metric. This assigns a stable hostname to the
  current gateway, useful for referencing it independently of the current
  network configuration state.

https://www.freedesktop.org/software/systemd/man/nss-mymachines.html
The container names are resolved to the IP addresses of the specific container, ordered by their scope.


## dig / drill
* dig # goes through resolv.conf [dig is from bind]
dig google.com
dig A google.com / dig AAAA google.com #ipv4/ipv6
dig MX google.com / dig -t ANY inria.fr #all records
dig @1.1.1.1 sci-hub.se #request through 1.1.1.1 cloudflare server
dig|drill @localhost -p 5300 google.com
dig +short www.google.com #=> only the answer

Options:
-x => reverse dns
  dig @1.1.1.1 -x 128.93.162.84 is a shortcut for the query:
  84.162.93.128.in-addr.arpa.	IN	PTR
+trace: dig +trace www.example.com => enable recursive resolution and show the recursive lookups
+qr: show query

flags: cf https://metebalci.com/blog/a-short-practical-tutorial-of-dig-dns-and-dnssec/
    QR: 0=Query, 1=response
    OPCODE: 0000=query
    AA: Authoritative Answer (set by the server)
    TC: message is TrunCated (set by the server)
    RD: Recursion Desired (set by the client and copied to the response)
    RA: Recursion Available (set by the server)
    AD: Authenticated Data, DNSSEC flag (set by the server)
    CD: Checking Disabled, DNSSEC flag (set by the client, copied to the response)
    RCODE, 4-bits: 0000=NOERROR.

* host: like dig, but with a human friendry format
host google.com #show A, AAAA and MX records
  google.com has address 216.58.204.142
  google.com has IPv6 address 2a00:1450:4007:815::200e
  google.com mail is handled by 30 alt2.aspmx.l.google.com.
  google.com mail is handled by 40 alt3.aspmx.l.google.com.
host google.com 1.1.1.1 #equivalent of dig @1.1.1.1 google.com
Options:
- host -v is very similar to dig
  This show all the lookups done (by default: A, AAAA, MX)
- host -a is equivalent to `-v -t ANY`

* nslookup google.com #older version of host/dig

* ldns package: -> drill
  drill [ OPTIONS ] name [ @server ] [ type ] [ class ]

## resolvectl

- resolvectl:
  resolvectl query www.0pointer.net
  resolvectl query 85.214.157.71 #reverse lookup
  resolvectl query -p llmnr doriath #llmnr
  resolvectl query -p mdns doriath.local #mdns
  resolvectl --legend=no -t MX query yahoo.com
  resolvectl service _xmpp-server._tcp gmail.com #srv or dns-sd service
  resolvectl openpgp zbyszek@fedoraproject.org #openpgp via OPENPGPKEY record, cf https://blog.webernetz.net/pgp-key-distribution-via-dnssec-openpgpkey/
  resolvectl tlsa tcp fedoraproject.org:443 #tls certificate via TLSA
  resolvectl tlsa fedoraproject.org #the default is tcp and 443 port

  More details on srv: https://en.wikipedia.org/wiki/SRV_record
    _service._proto.name. TTL class SRV priority weight port target.<Paste>

  resolvectl status / statistics

Configuration:
Domains=foo bar #search domain, ie query ploum will search for ploum.foo, ploum.bar. Note the this implies the routing ~foo ~bar
       =~foo ~bar #routing-only domains do not append foo/bar, but state that ploum.foo should lookup in this interface
  => ~.: causes all DNS traffic which does not match another configured domain routing entry to be routed to DNS servers specified for this interface

DNSDefaultRoute= #do we send dns queries through this interface for domains that do not match the configured interface domain? The default is true if the link has no routing-only domains (not matching "~.") configured

cf systemd-resolved(8):
       •   If a query does not match any configured search/route-only domain
           (neither per-link nor global), it is sent to all DNS servers that
           are configured on links with the "DNS default route" option set, as
           well as the globally configured DNS server.

- llmnr/mdns: cf [local]

# Resolvconf

https://roy.marples.name/projects/openresolv
http://manpages.ubuntu.com/manpages/bionic/man5/interface-order.5.html

* resolv.conf
nameserver ip_address
domain local_domain
search search_list
sortlist
options

 The domain and search keywords are mutually exclusive.   If  more  than
 one instance of these keywords is present, the last instance wins.

 The  search keyword of a system's resolv.conf file can be overridden on
 a per-process basis by setting the environment variable LOCALDOMAIN  to
 a space-separated list of search domains.

 The  options keyword of a system's resolv.conf file can be amended on a
 per-process basis by setting the environment variable RES_OPTIONS to  a
 space-separated  list  of resolver options.

* resolvconf (man 8 resolvconf pour avoir le man de openresolv plutôt que celui de resolvectl), man resolvconf.conf
     resolvconf solves this by letting the daemon send their resolv.conf(5)
     file to resolvconf via stdin(4) with the argument -a interface[.protocol]

resolvconf -v => the curernt configuration
resolvconf -p => the interface is marked as private, so the corresponding
nameserver is not added to NAMESERVERS

Usage:
  # resolv.conf from bge0
  search foo.com
  nameserver 1.2.3.4
  
  # resolv.conf from tap0
  domain bar.org
  nameserver 5.6.7.8

We will have
DOMAIN=bar.org
DOMAINS="foo.com:1.2.3.4 bar.org:5.6.7.8"
SEARCH="foo.com bar.org"
NAMESERVERS="1.2.3.4 5.6.7.8"
If bge0 was marked private it would still be in DOMAINS but not in NAMESERVERS

Then this output is consumated by scripts like
/usr/lib/resolvconf/unbound
/usr/lib/resolvconf/libc is in charge of updating /etc/resolv.conf
and it calls /usr/lib/resolvconf/libc.d/* scripts

Servers
=======

* Public servers
https://luadns.com/ [Free for 3 domains and 30 hosts]
https://www.duckdns.org/ [free dynamic dns]

* Servers
- rubydns
- unbound/ https://wiki.archlinux.org/index.php/unbound
  https://calomel.org/unbound_dns.html
- nsd: authoritative
  https://wiki.archlinux.org/index.php/NSD

## Unbound

* Default archlinux conf:
server:
  use-syslog: yes
  do-daemonize: no
  username: "unbound"
  directory: "/etc/unbound"
  trust-anchor-file: trusted-key.key

* May add:
  prefetch: yes #default no
  root-hints root.hints #otherwise use the compiled builtins
                        #update: # curl --output /etc/unbound/root.hints https://www.internic.net/domain/named.cache

* Testing:
Unbound-host uses the unbound validating  resolver  to  query  for  the
       hostname and display results (so like dig, but queries the root dns
       directly)
       By default it reads no configuration file whatsoever.  It  attempts  to reach  the  internet  root servers.  With -C an unbound config file and with -r resolv.conf can be read
  -v  Enable  verbose output and it shows validation results, on every line.
  -C configfile
unbound-host -C /etc/unbound/unbound.conf -v sigok.verteiltesysteme.net #dnssecure
 unbound-host -C /etc/unbound/unbound.conf -v sigfail.verteiltesysteme.net #dnssecure faile

* Type of zones:
- stub: send query to other nameserver. The other nameserver is
  authoritative, so you have to perform recursive processing yourself.
- forward: send query to other nameserver.  The other nameserver is a
  recursive (caching) server.  So it performs recursion for you.
- local-zone: local data.
  Eg local-zone example.com redirect => answer all queries for this domain with a specific ip address, useful for (government enforced) blocking of sites, or making facebook.com go to 127.0.0.1 to keep the kids away from it, since it also blocks blabla.facebook.com and so on.
- auth-zone: authority zone

* Private address:
private-address: 10.0.0.0/8 => can never return this range
private-domain: "example.com" => this domain can return private address. Note that local-zone can have private addresses too
domain-insecure: do not use dnssec for these domains (typically used with private-domain)

* local-zone: set up a zone served by unbound
  local-data: the data corresponding to the zone

local-zone: <zone> <type>
              Configure  a  local zone. The type determines the answer to give
              if there is no  match  from  local-data.
local-data: "<resource record string>"
local-data-ptr: "IPaddr name"
            Configure  local data shorthand for a PTR record with the reversed
            IPv4 or IPv6 address and the host name.

- type: deny, refuse, static, transparent, typetransparent, redirect,
  inform/inform_deny,inform_redirect,
  always_transparent/always_deny/always_refuse/always_nxdomain, noview, [nodefault]

  Exemple: to blacklist a domain
  local-zone: "<domain>" redirect
  local-data: "<domain> A 0.0.0.0"

- Options:
The default zones are localhost, reverse 127.0.0.1 and ::1, the  onion,
test,  invalid  and  the  AS112  zones. The AS112 zones are reverse DNS
zones for private use and reserved IP addresses for which the servers on
the internet cannot provide correct answers.

Exemple: the default for localhost is
                 local-zone: "localhost." redirect
                 local-data: "localhost. 10800 IN NS localhost."
                 local-data: "localhost. 10800 IN
                     SOA localhost. nobody.invalid. 1 3600 1200 604800 10800"
                 local-data: "localhost. 10800 IN A 127.0.0.1"
                 local-data: "localhost. 10800 IN AAAA ::1"

unblock-lan-zones: <yes or no>
  If  enabled,  then  for private address space, the reverse lookups are no
  longer filtered. When enabled, only localhost, 127.0.0.1 reverse and ::1
  reverse zones are configured with default  local  zones.
  [so this is like doing `local-zone: "10.in-addr.arpa." nodefault ...`
  for all the private ip ranges]
insecure-lan-zones: <yes or no>
  Default is disabled.  If enabled, then reverse lookups in  private
  address space are not validated. This is usually required whenever
  unblock-lan-zones is used.

* stub-zone
stub-zone:
     name: "home.lan"
     stub-addr: 10.0.0.111@53

* forward-zone
forward-zone:
  name: "."
  forward-addr: 8.8.8.8
  forward-addr: 8.8.4.4

### Example conf

  ## Authoritative, validating, recursive caching DNS
  ## unbound.conf -- https://calomel.org

server:
  # log verbosity
    verbosity: 1 #default

  # specify the interfaces to answer queries from by ip-address.  The default
  # is to listen to localhost (127.0.0.1 and ::1).  specify 0.0.0.0 and ::0 to
  # bind to all available interfaces.  specify every interface[@port] on a new
  # 'interface:' labeled line.  The listen interfaces are not changed on
  # reload, only on restart.
    interface: 127.0.0.1 #default to localhost

  # port to answer queries from
    port: 53 #default

  # Enable IPv4, "yes" or "no".
    do-ip4: yes #default

  # Enable IPv6, "yes" or "no".
    do-ip6: no #default

  # Enable UDP, "yes" or "no".
    do-udp: yes #default

  # Enable TCP, "yes" or "no". If TCP is not needed, Unbound is actually
  # quicker to resolve as the functions related to TCP checks are not done.i
  # NOTE: you may need tcp enabled to get the DNSSEC results from *.edu domains
  # due to their size.
    do-tcp: yes #default

  # control which client ips are allowed to make (recursive) queries to this
  # server. Specify classless netblocks with /size and action.  By default
  # everything is refused, except for localhost.  Choose deny (drop message),
  # refuse (polite error reply), allow (recursive ok), allow_snoop (recursive
  # and nonrecursive ok)
    access-control: 10.0.0.0/8 allow
    access-control: 127.0.0.0/8 allow
    access-control: 192.168.0.0/16 allow

  # Read  the  root  hints from this file. Default is nothing, using built in
  # hints for the IN class. The file has the format of  zone files,  with  root
  # nameserver  names  and  addresses  only. The default may become outdated,
  # when servers change,  therefore  it is good practice to use a root-hints
  # file.  get one from https://www.internic.net/domain/named.root 
    root-hints: "/var/unbound/etc/root.hints"

  # enable to not answer id.server and hostname.bind queries.
    hide-identity: yes

  # enable to not answer version.server and version.bind queries.
    hide-version: yes

  # Will trust glue only if it is within the servers authority.
  # Harden against out of zone rrsets, to avoid spoofing attempts. 
  # Hardening queries multiple name servers for the same data to make
  # spoofing significantly harder and does not mandate dnssec.
    harden-glue: yes #default

  # Require DNSSEC data for trust-anchored zones, if such data is absent, the
  # zone becomes  bogus.  Harden against receiving dnssec-stripped data. If you
  # turn it off, failing to validate dnskey data for a trustanchor will trigger
  # insecure mode for that zone (like without a trustanchor).  Default on,
  # which insists on dnssec data for trust-anchored zones.
    harden-dnssec-stripped: yes #default

  # Use 0x20-encoded random bits in the query to foil spoof attempts.
  # http://tools.ietf.org/html/draft-vixie-dnsext-dns0x20-00
  # While upper and lower case letters are allowed in domain names, no
  # significance is attached to the case. That is, two names with the same
  # spelling but different case are to be treated as if identical. This
  # means calomel.org is the same as CaLoMeL.Org which is the same as
  # CALOMEL.ORG.
    use-caps-for-id: yes #default to no

  # the time to live (TTL) value lower bound, in seconds. Default 0.
  # If more than an hour could easily give trouble due to stale data.
    cache-min-ttl: 3600 #default 0

  # the time to live (TTL) value cap for RRsets and messages in the
  # cache. Items are not cached for longer. In seconds.
    cache-max-ttl: 86400 #default 3600

  # perform prefetching of close to expired message cache entries.  If a
  # client requests the dns lookup and the TTL of the cached hostname is
  # going to expire in less than 10% of its TTL, unbound will (1st) return
  # the ip of the host to the client and (2nd) pre-fetch the dns request
  # from the remote dns server. This method has been shown to increase the
  # amount of cached hits by local clients by 10% on average.
    prefetch: yes #default no

  # number of threads to create. 1 disables threading. This should equal
  # the number of CPU cores in the machine. Our example machine has 4 CPU
  # cores.
    num-threads: 4


  ## Unbound Optimization and Speed Tweaks ###
  # the number of slabs to use for cache and must be a power of 2 times the
  # number of num-threads set above. more slabs reduce lock contention, but
  # fragment memory usage.
    msg-cache-slabs: 8
    rrset-cache-slabs: 8
    infra-cache-slabs: 8
    key-cache-slabs: 8

  # Increase the memory size of the cache. Use roughly twice as much rrset
  # cache memory as you use msg cache memory. Due to malloc overhead, the
  # total memory usage is likely to rise to double (or 2.5x) the total
  # cache memory. The test box has 4gig of ram so 256meg for rrset allows a
  # lot of room for cacheed objects.
    rrset-cache-size: 256m #default 4m
    msg-cache-size: 128m #default 4m

  # buffer size for UDP port 53 incoming (SO_RCVBUF socket option). This
  # sets the kernel buffer larger so that no messages are lost in spikes in
  # the traffic.
    so-rcvbuf: 1m #default 0 (system value)
  ## Unbound Optimization and Speed Tweaks ###

  # Enforce privacy of these addresses. Strips them away from answers.  It may
  # cause DNSSEC validation to additionally mark it as bogus.  Protects against
  # 'DNS Rebinding' (uses browser as network proxy).  Only 'private-domain' and
  # 'local-data' names are allowed to have these private addresses. No default.
    private-address: 192.168.0.0/16
    private-address: 172.16.0.0/12
    private-address: 10.0.0.0/8
    # Unbound conf: consider to add for default private  addresses  for  10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 169.254.0.0/16 fd00::/8 and fe80::/10

  # Allow the domain (and its subdomains) to contain private addresses.
  # local-data statements are allowed to contain private addresses too.
    private-domain: "home.lan"

  # If nonzero, unwanted replies are not only reported in statistics, but also
  # a running total is kept per thread. If it reaches the threshold, a warning
  # is printed and a defensive action is taken, the cache is cleared to flush
  # potential poison out of it.  A suggested value is 10000000, the default is
  # 0 (turned off). We think 10K is a good value.
    unwanted-reply-threshold: 10000

  # IMPORTANT FOR TESTING: If you are testing and setup NSD or BIND  on
  # localhost you will want to allow the resolver to send queries to localhost.
  # Make sure to set do-not-query-localhost: yes . If yes, the above default
  # do-not-query-address entries are present.  if no, localhost can be queried
  # (for testing and debugging). 
    do-not-query-localhost: no #default yes

  # File with trusted keys, kept up to date using RFC5011 probes, initial file
  # like trust-anchor-file, then it stores metadata.  Use several entries, one
  # per domain name, to track multiple zones. If you use forward-zone below to
  # query the Google DNS servers you MUST comment out this option or all DNS
  # queries will fail.
  # auto-trust-anchor-file: "/var/unbound/etc/root.key"

  # Should additional section of secure message also be kept clean of unsecure
  # data. Useful to shield the users of this validator from potential bogus
  # data in the additional section. All unsigned data in the additional section
  # is removed from secure messages.
    val-clean-additional: yes #default

  # Blocking Ad Server domains. Google's AdSense, DoubleClick and Yahoo
  # account for a 70 percent share of all advertising traffic. Block them.
  # local-zone: "doubleclick.net" redirect
  # local-data: "doubleclick.net A 127.0.0.1"
  # local-zone: "googlesyndication.com" redirect
  # local-data: "googlesyndication.com A 127.0.0.1"
  # local-zone: "googleadservices.com" redirect
  # local-data: "googleadservices.com A 127.0.0.1"
  # local-zone: "google-analytics.com" redirect
  # local-data: "google-analytics.com A 127.0.0.1"
  # local-zone: "ads.youtube.com" redirect
  # local-data: "ads.youtube.com A 127.0.0.1"
  # local-zone: "adserver.yahoo.com" redirect
  # local-data: "adserver.yahoo.com A 127.0.0.1"
  # local-zone: "ask.com" redirect
  # local-data: "ask.com A 127.0.0.1"


  # Unbound will not load if you specify the same local-zone and local-data
  # servers in the main configuration as well as in this "include:" file. We
  # suggest commenting out any of the local-zone and local-data lines above if
  # you suspect they could be included in the unbound_ad_servers servers file.
  #include: "/etc/unbound/unbound_ad_servers"

  # locally served zones can be configured for the machines on the LAN.

    local-zone: "home.lan." static

    local-data: "firewall.home.lan.  IN A 10.0.0.1"
    local-data: "laptop.home.lan.    IN A 10.0.0.2"
    local-data: "xboxone.home.lan.   IN A 10.0.0.3"
    local-data: "ps4.home.lan.       IN A 10.0.0.4"
    local-data: "dhcp5.home.lan.     IN A 10.0.0.5"
    local-data: "dhcp6.home.lan.     IN A 10.0.0.6"
    local-data: "dhcp7.home.lan.     IN A 10.0.0.7"

    local-data-ptr: "10.0.0.1  firewall.home.lan"
    local-data-ptr: "10.0.0.2  laptop.home.lan"
    local-data-ptr: "10.0.0.3  xboxone.home.lan"
    local-data-ptr: "10.0.0.4  ps4.home.lan"
    local-data-ptr: "10.0.0.5  dhcp5.home.lan"
    local-data-ptr: "10.0.0.6  dhcp6.home.lan"
    local-data-ptr: "10.0.0.7  dhcp7.home.lan"

  # Unbound can query your NSD or BIND server for private domain queries too.
  # On our NSD page we have NSD configured to serve the private domain,
  # "home.lan". Here we can tell Unbound to connect to the NSD server when it
  # needs to resolve a *.home.lan hostname or IP.
  #
  # private-domain: "home.lan"
  # local-zone: "0.0.10.in-addr.arpa." nodefault
  # stub-zone:
  #      name: "home.lan"
  #      stub-addr: 10.0.0.111@53

  # If you have an internal or private DNS names the external DNS servers can
  # not resolve, then you can assign domain name strings to be redirected to a
  # seperate dns server. For example, our comapny has the domain
  # organization.com and the domain name internal.organization.com can not be
  # resolved by Google's public DNS, but can be resolved by our private DNS
  # server located at 1.1.1.1. The following tells Unbound that any
  # organization.com domain, i.e. *.organization.com be dns resolved by 1.1.1.1
  # instead of the public dns servers.
  #
  # forward-zone:
  #    name: "organization.com"
  #    forward-addr: 1.1.1.1        # Internal or private DNS

  # Use the following forward-zone to forward all queries to Google DNS,
  # OpenDNS.com or your local ISP's dns servers for example. To test resolution
  # speeds use "drill calomel.org @8.8.8.8" and look for the "Query time:" in
  # milliseconds.
  forward-zone:
   name: "."
   forward-addr: 1.1.1.1@53#one.one.one.one
   forward-addr: 8.8.8.8@53#dns.google
   forward-addr: 9.9.9.9@53#dns.quad9.net
   forward-addr: 1.0.0.1@53#one.one.one.one
   forward-addr: 8.8.4.4@53#dns.google
   forward-addr: 149.112.112.112@53#dns.quad9.net

### Example conf with private zone
private-address: 192.168.0.0/24
private-domain: "home.lan"
domain-insecure: "home.lan"
unblock-lan-zones: yes #or just nodefault the 192.168 zone
insecure-lan-zones: yes

local-zone: "home.lan" static
local-data: "dns.home.lan IN A 192.168.0.228"
local-data: "gate.home.lan IN A 192.168.0.1"
local-data-ptr: "192.168.0.228 dns.home.lan"
local-data-ptr: "192.168.0.1 gate.home.lan"

forward-zone:
name: "."
forward-addr: 192.168.0.1

Public dns
==========

- https://www.techradar.com/news/best-dns-server
- https://www.internetsociety.org/blog/2018/07/a-deeper-dive-into-public-dns-resolver-quad9/

* Cloudflare dns: 1.1.1.1 and 1.0.0.1
                  2606:4700:4700::1111 2606:4700:4700::1001
                  dns4torpnlfs2ifuz2s2yf3fc7rdmsbhm6rw75euj35pac6ap25zgqad.onion.

* google dns: 8.8.8.8, 8.8.4.4
              2001:4860:4860::8888 and 2001:4860:4860::8844

* Quad 9: Secure 9.9.9.9, 2620:fe::fe; Unsecured 9.9.9.10, 2620:fe::10

* Divers (marchent encore?)
  David Madore: regulus.xn--kwg.net, 212.85.152.99
  neuf.fr (212.30.96.108, 213.203.124.146)
  198.41.0.4 : a.root-servers.net

* Adguard:
Default: 176.103.130.130, 176.103.130.131 2a00:5a60::ad1:0ff 2a00:5a60::ad2:0ff
         sdns://AQIAAAAAAAAAFDE3Ni4xMDMuMTMwLjEzMDo1NDQzINErR_JS3PLCu_iZEIbq95zkSV2LFsigxDIuUso_OQhzIjIuZG5zY3J5cHQuZGVmYXVsdC5uczEuYWRndWFyZC5jb20
         dns.adguard.com, https://dns.adguard.com/dns-query

Family (safe search): 176.103.130.132 176.103.130.134 2a00:5a60::bad1:0ff 2a00:5a60::bad2:0ff
         sdns://AQIAAAAAAAAAFDE3Ni4xMDMuMTMwLjEzMjo1NDQzILgxXdexS27jIKRw3C7Wsao5jMnlhvhdRUXWuMm1AFq6ITIuZG5zY3J5cHQuZmFtaWx5Lm5zMS5hZGd1YXJkLmNvbQ dns-family.adguard.com https://dns-family.adguard.com/dns-query

* https://dns.watch/index
84.200.69.80
resolver1.dns.watch

84.200.70.40
resolver2.dns.watch

2001:1608:10:25::1c04:b12f
resolver1.dns.watch
Explicit v6 FQDN: resolver1v6.dns.watch

2001:1608:10:25::9249:d69b
resolver2.dns.watch
Explicit v6 FQDN: resolver2v6.dns.watch

Some ip address
===============

Resolution of quatramaran.salle-s.org is 188.165.201.225
Resolution of quatramaran.salle-s.org is 2001:41d0:2:92e1:0:0:0:0

Resolution of phare.normalesup.org is 129.199.129.80
Resolution of phare2.normalesup.org is 129.199.129.81

google.com has address 5.226.127.173 5.226.127.174 5.226.127.180 5.226.127.181 5.226.127.187 5.226.127.146 5.226.127.152 5.226.127.153 5.226.127.159 5.226.127.160 5.226.127.166 5.226.127.167
google.com has IPv6 address 2a00:1450:4016:802::100e

ipinfo
======

See https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script for a list of services that provide the current ip.

* From https://news.ycombinator.com/item?id=10235974

  $ curl ipinfo.io
  {
    "ip": "208.54.39.206",
    "hostname": "mce2736d0.tmodns.net",
    "city": "Los Angeles",
    "region": "California",
    "country": "US",
    "loc": "34.0522,-118.2437",
    "org": "AS21928 T-Mobile USA, Inc.",
    "postal": "90013",
    "phone": 213
  }
  

Or just your IP
  $ curl ipinfo.io/ip
  208.54.39.206

Or any other field (eg. city)
  $ curl ipinfo.io/city
  Los Angeles

Or lookup another IP
  $ curl ipinfo.io/8.8.8.8
  {
    "ip": "8.8.8.8",
    "hostname": "google-public-dns-a.google.com",
    "city": "Mountain View",
    "region": "California",
    "country": "US",
    "loc": "37.3860,-122.0838",
    "org": "AS15169 Google Inc.",
    "postal": "94040",
    "phone": 650
  }

Or a specific field for that IP:
  $ curl ipinfo.io/8.8.8.8/org
  AS15169 Google Inc.

* From https://www.wireguard.com/quickstart/#demo-server
$ curl zx2c4.com/ip
163.172.161.0
demo.wireguard.com
curl/7.49.1

Crypto
======

DNSSEC: legacy encryption
DNSCurve and DNSCrypt: curve25519

https://dnscurve.io/faq/differences-between-dnscurve-and-dnssec.html
https://security.stackexchange.com/questions/91725/dnscrypt-vs-dnscurve
=> dnscrypt is for stub resolvers, dnscurve for recursive resolvers
https://umbrella.cisco.com/blog/2010/02/23/opendns-dnscurve/zz
