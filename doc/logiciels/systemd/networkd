vim: ft=markdownlight fdm=expr

interface names
===============

On can set up names in '/etc/udev/rules.d/80-net-setup-link.rules':
    ACTION=="remove", GOTO="net_name_slot_end"
    SUBSYSTEM!="net", GOTO="net_name_slot_end"
    NAME!="", GOTO="net_name_slot_end"
    
    ATTR{address}=="8c:dc:d4:d6:49:87", NAME="eth0"
    ATTR{address}=="80:19:34:0c:f6:48", NAME="wlan0"
    
    LABEL="net_name_slot_end"
[Note: using 'eth0' is a bad idea because it races with the kernel own
name]

this masks the system file in /usr:
    SUBSYSTEM!="net", GOTO="net_setup_link_end"
    IMPORT{builtin}="path_id"
    ACTION!="add", GOTO="net_setup_link_end"
    IMPORT{builtin}="net_setup_link"
    NAME=="", ENV{ID_NET_NAME}!="", NAME="$env{ID_NET_NAME}"
    LABEL="net_setup_link_end"

One can also use a .link file (cf systemd.link) in /etc/systemd/network:
     [Match]
     MACAddress=00:a0:de:63:7a:e6
     [Link]
     Name=dmz0
By default the setting is /usr/lib/systemd/network/99-default.link
     [Link]
     NamePolicy=kernel database onboard slot path
     MACAddressPolicy=persistent

I like the default en* name policy so usually I change nothing

systemd-resolved
=================

sudo ln -snf /run/systemd/resolv/resolv.conf /etc/resolv.conf

       systemd-resolved synthesizes DNS resource records (RRs) for the
       following cases:

       ·   The local, configured hostname is resolved to all locally
           configured IP addresses ordered by their scope, or — if none are
           configured — the IPv4 address 127.0.0.2 (which is on the local
           loopback) and the IPv6 address ::1 (which is the local host).

       ·   The hostnames "localhost" and "localhost.localdomain" (as well as
           any hostname ending in ".localhost" or ".localhost.localdomain")
           are resolved to the IP addresses 127.0.0.1 and ::1.

       ·   The hostname "_gateway" is resolved to all current default routing
           gateway addresses, ordered by their metric. This assigns a stable
           hostname to the current gateway, useful for referencing it
           independently of the current network configuration state.

       ·   The mappings defined in /etc/hosts are resolved to their configured
           addresses and back, but they will not affect lookups for
           non-address types (like MX).

systemd-resolve --status / resolvectl status
systemd-resolve somemachine.local / resolvectl query ...

wlan
====

sudo cp wpa_supplicant-wlan0-basic.conf /etc/wpa_supplicant/wpa_supplicant-wlan0
sudo systemctl enable wpa_supplicant@wlan0.service

dhcp
====
man systemd.network:
       DHCP=
           Enables DHCPv4 and/or DHCPv6 client support. Accepts "yes", "no",
           "ipv4", or "ipv6".
           Note that DHCPv6 will by default be triggered by Router
           Advertisement, if that is enabled, regardless of this parameter. By
           enabling DHCPv6 support explicitly, the DHCPv6 client will be
           started regardless of the presence of routers on the link, or what
           flags the routers pass. See "IPv6AcceptRouterAdvertisements=".
       IPv6AcceptRouterAdvertisements=
           Force the setting of the accept_ra (router advertisements) setting
           for the interface. When unset, the kernel default is used, and
           router advertisements are accepted only when local forwarding is
           disabled for that interface. When router advertisements are
           accepted, they will trigger the start of the DHCPv6 client if the
           relevant flags are passed, or if no routers are found on the link.
           Takes a boolean. If true, router advertisements are accepted, when
           false, router advertisements are ignored, independently of the
           local forwarding state.

Bridge
======

https://wiki.archlinux.org/index.php/Network_bridge
https://wiki.archlinux.org/index.php/Systemd-networkd#Bridge_interface

- Create a virtual bridge interface
  /etc/systemd/network/MyBridge.netdev
  [NetDev]
  Name=br0
  Kind=bridge
- Bind ethernet to bridge
  /etc/systemd/network/MyEth.network
  [Match]
  Name=en*
  [Network]
  Bridge=br0
- Bridge network
  /etc/systemd/network/MyBridge.network
  [Match]
  Name=br0
  [Network]
  DHCP=ipv4
- Add option to boot the container
  As we want to give a separate IP for host and container, we need to Disconnect networking of the container from the host. To do this, add this option --network-bridge=br0 to your container boot command.
  # systemd-nspawn --network-bridge=br0 -bD /path_to/my_container

Result on host:
3: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 14:da:e9:b5:7a:88 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.87/24 brd 192.168.1.255 scope global br0
       valid_lft forever preferred_lft forever
    inet6 fe80::16da:e9ff:feb5:7a88/64 scope link 
       valid_lft forever preferred_lft forever
6: vb-MyContainer: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast master br0 state UP group default qlen 1000
    link/ether d2:7c:97:97:37:25 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::d07c:97ff:fe97:3725/64 scope link 
       valid_lft forever preferred_lft forever
On container:
2: host0: <BROADCAST,MULTICAST,ALLMULTI,AUTOMEDIA,NOTRAILERS,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 5e:96:85:83:a8:5d brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.73/24 brd 192.168.1.255 scope global host0
       valid_lft forever preferred_lft forever
    inet6 fe80::5c96:85ff:fe83:a85d/64 scope link 
       valid_lft forever preferred_lft forever

containers
==========
~systemdlib/network/ contains:
80-container-host0.network # container: dhcp on host0
80-container-ve.network # host: dhcp server + ip masquerade on ve-*

These file configure the ve-* interfaces to act as a dhcp server, while
host0 in a container has DHCP, LinkLocalAddressing and LLDP

- 80-container-host0.network
[Match]
Virtualization=container
Name=host0
[Network]
DHCP=yes
LinkLocalAddressing=yes
LLDP=yes
EmitLLDP=customer-bridge
[DHCP]
UseTimezone=yes

- 80-container-ve.network
[Match]
Name=ve-*
Driver=veth
[Network]
 # Default to using a /28 prefix, giving up to 13 addresses per container.
Address=0.0.0.0/28
LinkLocalAddressing=yes
DHCPServer=yes
IPMasquerade=yes
LLDP=yes
EmitLLDP=customer-bridge

- 80-container-vz.network #For `systemd-nspawn --network-bridge=br0`
[Match]
Name=vz-*
Driver=bridge
...

udev
====
udevadm test-builtin net_setup_link /class/net/ve-arch-test
udevadm info /sys/class/net/ve-arch-test

$ udevadm test-builtin net_setup_link /class/net/eth0              ⚡1
calling: test-builtin
=== trie on-disk ===
tool version:          224
file size:         7049244 bytes
header size             80 bytes
strings            1762716 bytes
nodes              5286448 bytes
Load module index
timestamp of '/etc/systemd/network' changed
Parsed configuration file /usr/lib/systemd/network/99-default.link
Created link configuration context.
ID_NET_DRIVER=e1000e
Config file /usr/lib/systemd/network/99-default.link applies to device eth0
ID_NET_LINK_FILE=/usr/lib/systemd/network/99-default.link
ID_NET_NAME=enp0s25
Unload module index
Unloaded link configuration context.

$ udevadm info /sys/class/net/eth0
P: /devices/pci0000:00/0000:00:19.0/net/eth0
E: DEVPATH=/devices/pci0000:00/0000:00:19.0/net/eth0
E: ID_BUS=pci
E: ID_MODEL_FROM_DATABASE=Ethernet Connection I218-LM
E: ID_MODEL_ID=0x155a
E: ID_NET_NAME_MAC=enx8cdcd4d64987
E: ID_NET_NAME_PATH=enp0s25
E: ID_OUI_FROM_DATABASE=Hewlett Packard
E: ID_PCI_CLASS_FROM_DATABASE=Network controller
E: ID_PCI_SUBCLASS_FROM_DATABASE=Ethernet controller
E: ID_VENDOR_FROM_DATABASE=Intel Corporation
E: ID_VENDOR_ID=0x8086
E: IFINDEX=3
E: INTERFACE=eth0
E: SUBSYSTEM=net
E: SYSTEMD_ALIAS=/sys/subsystem/net/devices/eth0
E: TAGS=:systemd:
E: USEC_INITIALIZED=6083328
