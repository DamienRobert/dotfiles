vim: ft=markdownlight fdm=expr

# sysctl

sysctl -a [--pattern forward] #all sysctl
sysctl -n kernel.hostname #only print the value
sysctl -p/etc/sysctl.conf #load config file
sysctl -w kernel.domainname="example.com" #-w: write

# ipv4 networking
 # Commented means it is default

 ## TCP SYN cookie protection
 ## helps protect against SYN flood attacks
 ## only kicks in when net.ipv4.tcp_max_syn_backlog is reached
 # net.ipv4.tcp_syncookies = 1
 
 ## protect against tcp time-wait assassination hazards
 ## drop RST packets for sockets in the time-wait state
 ## (not widely supported outside of linux, but conforms to RFC)
 net.ipv4.tcp_rfc1337 = 1
 
 ## tcp timestamps
 ## + protect against wrapping sequence numbers (at gigabit speeds)
 ## + round trip time calculation implemented in TCP
 ## - causes extra overhead and allows uptime detection by scanners like nmap
 ## enable @ gigabit speeds
 #net.ipv4.tcp_timestamps = 1
 net.ipv4.tcp_timestamps = 0
 
 ## source address verification (sanity checking)
 ## helps protect against spoofing attacks
 ## on by default
 # net.ipv4.conf.all.rp_filter = 2
 ## Note: rp_filter = 1 ou 2 => https://www.theurbanpenguin.com/rp_filter-and-lpic-3-linux-security/
 # 1: check that the source address is routable through the interface we received it; 2 check that it is routable through any of our interfaces
 
 ## disable ALL packet forwarding (not a router, disable it)
 # net.ipv4.ip_forward = 0
 
 ## log martian packets
 net.ipv4.conf.all.log_martians = 1
 
 ## ignore echo broadcast requests to prevent being part of smurf attacks
 ## on by default
 # net.ipv4.icmp_echo_ignore_broadcasts = 1
 
 ## optionally, ignore all echo requests
 ## this is NOT recommended, as it ignores echo requests on localhost as well
 # net.ipv4.icmp_echo_ignore_all = 0
 net.ipv4.icmp_echo_ignore_all = 1
 
 ## ignore bogus icmp errors
 #on by default
 # net.ipv4.icmp_ignore_bogus_error_responses = 1
 
 ## IP source routing (insecure, disable it)
 #off by default
 # net.ipv4.conf.all.accept_source_route = 0
 
 ## send redirects (not a router, disable it)
 # net.ipv4.conf.all.send_redirects = 1
 net.ipv4.conf.all.send_redirects = 0
 
 ## ICMP routing redirects (only secure)
 # net.ipv4.conf.all.accept_redirects = 1
 net.ipv4.conf.all.accept_redirects = 0
 #on by default for secure redirect
 # net.ipv4.conf.all.secure_redirects = 1

# Examples
## systemd sysctl.d:

* 10-arch.conf

  # Raise inotify resource limits
  fs.inotify.max_user_instances = 1024
  fs.inotify.max_user_watches = 524288

* 50-coredump.conf

  kernel.core_pattern=|/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h %e

* 50-default.conf

  # System Request functionality of the kernel (SYNC)
  #
  # Use kernel.sysrq = 1 to allow all keys.
  # See https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html for a list
  # of values and keys.
  kernel.sysrq = 16
  
  # Append the PID to the core filename
  kernel.core_uses_pid = 1
  
  # Source route verification
  net.ipv4.conf.all.rp_filter = 2
  
  # Do not accept source routing
  net.ipv4.conf.all.accept_source_route = 0
  
  # Promote secondary addresses when the primary address is removed
  net.ipv4.conf.all.promote_secondaries = 1
  
  # Fair Queue CoDel packet scheduler to fight bufferbloat
  net.core.default_qdisc = fq_codel
  
  # Enable hard and soft link protection
  fs.protected_hardlinks = 1
  fs.protected_symlinks = 1
  
  # Enable regular file and FIFO protection
  fs.protected_regular = 1
  fs.protected_fifos = 1

## Old archlinux sysctl.conf:

  # Configuration file for runtime kernel parameters.
  # See sysctl.conf(5) for more information.
  
  # Have the CD-ROM close when you use it, and open when you are done.
  #dev.cdrom.autoclose = 1
  #dev.cdrom.autoeject = 1
  
  # Protection from the SYN flood attack.
  net.ipv4.tcp_syncookies = 1
  
  # See evil packets in your logs.
  #net.ipv4.conf.all.log_martians = 1
  
  # Never accept redirects or source routes (these are only useful for routers).
  #net.ipv4.conf.all.accept_redirects = 0
  #net.ipv4.conf.all.accept_source_route = 0
  #net.ipv6.conf.all.accept_redirects = 0
  #net.ipv6.conf.all.accept_source_route = 0
  
  # Disable packet forwarding.
  net.ipv4.ip_forward = 0
  net.ipv6.conf.all.forwarding = 0
  
  # Tweak the port range used for outgoing connections.
  #net.ipv4.ip_local_port_range = 32768 61000
  
  # Tweak those values to alter disk syncing and swap behavior.
  #vm.vfs_cache_pressure = 100
  #vm.laptop_mode = 0
  #vm.swappiness = 60
  
  # Tweak how the flow of kernel messages is throttled.
  #kernel.printk_ratelimit_burst = 10
  #kernel.printk_ratelimit = 5
  
  # Reboot 600 seconds after kernel panic or oops.
  #kernel.panic_on_oops = 1
  #kernel.panic = 600
  
  # Disable SysRq key to avoid console security issues.
  kernel.sysrq = 0

## From: https://wiki.archlinux.org/index.php/Sysctl
  fs.protected_hardlinks = 1
  fs.protected_symlinks = 1
  
  # reuse/recycle time-wait sockets
  net.ipv4.tcp_tw_reuse = 1
  net.ipv4.tcp_tw_recycle = 1

## ufw sysctl

  #
  # Configuration file for setting network variables. Please note these settings
  # override /etc/sysctl.conf. If you prefer to use /etc/sysctl.conf, please
  # adjust IPT_SYSCTL in /etc/default/ufw.
  #
  
  # Uncomment this to allow this host to route packets between interfaces
  #net/ipv4/ip_forward=1
  #net/ipv6/conf/default/forwarding=1
  #net/ipv6/conf/all/forwarding=1
  
  # Turn on Source Address Verification in all interfaces to prevent some
  # spoofing attacks
  net/ipv4/conf/default/rp_filter=1
  net/ipv4/conf/all/rp_filter=1
  
  # Do not accept IP source route packets (we are not a router)
  net/ipv4/conf/default/accept_source_route=0
  net/ipv4/conf/all/accept_source_route=0
  net/ipv6/conf/default/accept_source_route=0
  net/ipv6/conf/all/accept_source_route=0
  
  # Disable ICMP redirects. ICMP redirects are rarely used but can be used in
  # MITM (man-in-the-middle) attacks. Disabling ICMP may disrupt legitimate
  # traffic to those sites.
  net/ipv4/conf/default/accept_redirects=0
  net/ipv4/conf/all/accept_redirects=0
  net/ipv6/conf/default/accept_redirects=0
  net/ipv6/conf/all/accept_redirects=0
  
  # Ignore bogus ICMP errors
  net/ipv4/icmp_echo_ignore_broadcasts=1
  net/ipv4/icmp_ignore_bogus_error_responses=1
  net/ipv4/icmp_echo_ignore_all=0
  
  # Don't log Martian Packets (impossible packets)
  net/ipv4/conf/default/log_martians=0
  net/ipv4/conf/all/log_martians=0
  
  # Change to '1' to enable TCP/IP SYN cookies This disables TCP Window Scaling
  # (http://lkml.org/lkml/2008/2/5/167)
  net/ipv4/tcp_syncookies=0
  
  #net/ipv4/tcp_fin_timeout=30
  #net/ipv4/tcp_keepalive_intvl=1800
  
  # normally allowing tcp_sack is ok, but if going through OpenBSD 3.8 RELEASE or
  # earlier pf firewall, should set this to 0
  # on by default
  net/ipv4/tcp_sack=1
  
  # Uncomment this to turn off ipv6 autoconfiguration
  #net/ipv6/conf/default/autoconf=0
  #net/ipv6/conf/all/autoconf=0
  
  # Uncomment this to enable ipv6 privacy addressing
  #net/ipv6/conf/default/use_tempaddr=2
  #net/ipv6/conf/all/use_tempaddr=2

## My old sysctl.conf (now i use sysctl.d)

  # Configuration file for runtime kernel parameters.
  # See sysctl.conf(5) for more information.
  
  # Have the CD-ROM close when you use it, and open when you are done.
  #dev.cdrom.autoclose = 1
  #dev.cdrom.autoeject = 1
  
  # Protection from the SYN flood attack.
  net.ipv4.tcp_syncookies = 1
  
  # See evil packets in your logs.
  #net.ipv4.conf.all.log_martians = 1
  
  # Never accept redirects or source routes (these are only useful for routers).
  #net.ipv4.conf.all.accept_redirects = 0
  #net.ipv4.conf.all.accept_source_route = 0
  #net.ipv6.conf.all.accept_redirects = 0
  #net.ipv6.conf.all.accept_source_route = 0
  
  # Disable packet forwarding.
  net.ipv4.ip_forward = 0
  net.ipv6.conf.all.forwarding = 0
  
  # Tweak the port range used for outgoing connections.
  #net.ipv4.ip_local_port_range = 32768 61000
  
  # Tweak those values to alter disk syncing and swap behavior.
  #vm.vfs_cache_pressure = 100
  #vm.laptop_mode = 0
  #vm.swappiness = 60
  
  # Tweak how the flow of kernel messages is throttled.
  #kernel.printk_ratelimit_burst = 10
  #kernel.printk_ratelimit = 5
  
  # Reboot 600 seconds after kernel panic or oops.
  #kernel.panic_on_oops = 1
  #kernel.panic = 600
  
  # Disable SysRq key to avoid console security issues.
  # kernel.sysrq = 0
  kernel.sysrq = 1
  
  net.ipv4.conf.all.rp_filter=1
  
  # I let ufw control the rest of the informations, the line above is still important for when I disable it
  
  ## ignore echo broadcast requests to prevent being part of smurf attacks
  #net.ipv4.icmp_echo_ignore_broadcasts = 1
  
  ## optionally, ignore all echo requests (this is the default)
  #net.ipv4.icmp_echo_ignore_all = 1
  
  ## ignore bogus icmp errors
  # net.ipv4.icmp_ignore_bogus_error_responses = 1
  
  ## IP source routing (insecure, disable it) (this is the default)
  #net.ipv4.conf.all.accept_source_route = 0
  
  ## send redirects (not a router, disable it)
  #net.ipv4.conf.all.send_redirects = 0
  
  ## ICMP routing redirects (only secure) (this is the default)
  #net.ipv4.conf.all.accept_redirects = 0
  #net.ipv4.conf.all.secure_redirects = 1

  ## Potentially usefull sysctl

  #net.ipv6.conf.eth0.disable_ipv6=1
