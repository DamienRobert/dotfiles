vim: ft=markdownlight fdm=expr

Tools
=====

* Configuration manager: chef, puppet, salt, ansible
* VPS: Digital Ocean, linode, RamNode, OVH, LunaNode
* Integration continue: travis (github), jenkins
* Monitoring: ganglia
* Cloud configuration: https://cloud-init.io/

## Services

* Hashicorp:
- https://www.hashicorp.com/products/terraform/
  Cloud Infrastructure Automation
  Infrastructure as code for provisioning, compliance, and management of any cloud, infrastructure, and service.
- https://www.hashicorp.com/products/consul/
  Connect and Secure Any Service
  A multi-cloud service networking platform to connect and secure services across any runtime platform and public or private cloud.
- https://www.hashicorp.com/products/vault/
  Manage Secrets and Protect Sensitive Data
- https://www.hashicorp.com/products/nomad/
  Deploy and Manage Any Containerized, Legacy, or Batch Application
  Nomad is an easy-to-use, flexible, and performant workload orchestrator that enables organizations to deploy applications on any infrastructure at scale.

* Chef
- https://docs.chef.io/chef_overview/
  Chef infra = chef workstation + client nodes
- https://github.com/inspec/inspec
  Chef InSpec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.
- https://github.com/chef/omnibus
  Easily create full-stack installers for your project across a variety of platforms.
  https://scoutapm.com/blog/omnibus-tutorial-package-a-standalone-ruby-gem
- https://www.habitat.sh/
  Omnibus makes platform-native packages (deb/rpm/etc.), Hab uses its own format, which means:
  chef/habitat: https://medium.com/@bdangit/habitat-and-docker-c8b19d7e5d8c
  Build applications to run anywhere and manage them throughout their lifecycle.
  Habitat is open source software that creates platform-independent build artifacts and provides built-in deployment and management capabilities.
  A modern version of omnibus, cf https://discourse.chef.io/t/habitat-vs-omnibus/12983/3

## Non root containers:
Cf https://rootlesscontaine.rs/ [tools described there are used by buildah and podman]
=> https://github.com/mgoltzsche/ctnr rootless runc-based container engine

* Namespace wrappers:
+ https://github.com/rootless-containers/rootlesskit
  kind of Linux-native "fake root" utility, made for mainly running Docker and Kubernetes as an unprivileged user
  RootlessKit creates user_namespaces(7) and mount_namespaces(7), and executes newuidmap(1)/newgidmap(1) along with subuid(5) and subgid(5).
  RootlessKit also supports isolating network_namespaces(7) with userspace NAT using "slirp". Kernel NAT using SUID-enabled lxc-user-nic(1) is also experimentally supported.
  Projects using RootlessKit
  - Docker/Moby
  - Usernetes: Docker & Kubernetes, installable under a non-root user's $HOME.
  - k3s: Lightweight Kubernetes
  - BuildKit: Next-generation docker build backend
- https://github.com/giuseppe/become-root
  minimal tool for creating a new user namespace with multiple UIDs/GIDs mapped inside

* Tools for non root containers:
+ patchelf https://nixos.org/patchelf.html
  PatchELF is a small utility to modify the dynamic linker and RPATH of ELF executables.
+ https://proot-me.github.io/
  PRoot is a user-space implementation of chroot, mount --bind, and binfmt_misc. (uses ptrace)
  -> used by junest: The lightweight Arch Linux based distro that runs upon any Linux distros without root access.
  Voir aussi https://github.com/rootless-containers/PRoot
  Fork of proot for supporting `user.rootlesscontainers` xattr so as to support persistent `chown(2)`
- mbox: http://pdos.csail.mit.edu/mbox/ [undeveloped]
  Mbox is a lightweight sandboxing mechanism that any user can use without special privileges in commodity operating systems.
+ slirp: userspace networking
  cf https://github.com/rootless-containers/slirp4netns
  slirp4netns: User-mode networking for unprivileged network namespaces

X forwarding
============

- Xephyr: version moderne de Xnest, supportant les extensions X modernes

- Protocols: nx, rdp (windows), vnc, spice
  ssh -X/ssh -Y

+ xpra: rootless (ie la fenêtre s'affiche dans le wm hote) + winswitch (gui helper)

VNC/Spice: Remmina, vinagre (gnome); VNC: tigervnc, tightvnc; NX: x2go
  https://en.wikipedia.org/wiki/Comparison_of_remote_desktop_software
  http://www.techradar.com/news/5-of-the-best-linux-remote-desktop-clients

Containers
==========

* Containers:
- libvirt-lxc, lxc
- systemd-nspawn/machinectl
  casync: Content-Addressable Data Synchronization Tool http://0pointer.net/blog/casync-a-tool-for-distributing-file-system-images.html 
  mkosi: create legacy-free OS images
  Note: since systemd 242, nspawn understand the OCI interface
- docker / [rkt] / podman. Cf [docker]
  [Depuis que CoreOs a été racheté par redhat, rkt est deprecated.]
  runC: low level, used by docker and podman
  singularity: "docker for hpc"

* Containers orchestration:
  - kubernetes
    https://jvns.ca/blog/2017/10/10/operating-a-kubernetes-network/
    https://jvns.ca/blog/2017/10/05/reasons-kubernetes-is-cool/
    https://www.reddit.com/r/kubernetes/comments/7y54n6/deploying_the_control_plane_kubelet_manifests_vs/ -> https://github.com/kelseyhightower/kubernetes-the-hard-way
    video: https://www.driftingruby.com/episodes/introduction-to-kubernetes
    Minikube: https://github.com/kubernetes/minikube Run Kubernetes locally
  - https://helm.sh/
    The package manager for Kubernetes
    Helm is the best way to find, share, and use software built for Kubernetes.
  - openshift: red hat distribution for kubernetes

Virtual machines
================

* openstack: le cloud open source

* Virtual: hashicorp/vagrant
  To achieve its magic, Vagrant stands on the shoulders of giants. Machines are provisioned on top of VirtualBox, VMware, AWS, or any other provider. Then, industry-standard provisioning tools such as shell scripts, Chef, or Puppet, can be used to automatically install and configure software on the machine.

* Provision:
  - hashicorp/terraform => Infrastructure as code
  - hashicorp/packer => build virtual machines
    https://github.com/elasticdog/packer-arch: un packer pour archlinux
  - https://pulumi.io/
     Cloud Native Infrastructure as Code
     Build software for any cloud using your favorite language. 
     https://pulumi.io/reference/vs/terraform.html

Virtual Box
-----------

https://wiki.archlinux.org/index.php/VirtualBox

### Configuration

~/.config/VirtualBox/VirtualBox.xml
sudo modprobe vboxdrv #Load virtual box kernel module

* VirtualBox Folders

 #this is ~/VirtualBox\ VMs by default which is ugly
VBOXDIR=$HOME/var/spool/VirtualBox
vboxmanage setproperty machinefolder $VBOXDIR
mkdir -p $VBOXDIR && chattr +C $VBOXDIR

* Run
VirtualBox --startwm ArchVM
VBoxHeadless --startwm ArchVM

* VBoxManage

VBoxManage modifyvm "VM name" --natpf1 "guestssh,tcp,,44601,,22"
VBoxManage modifyvm "VM name" --natpf1 "guestsshinit,tcp,,44699,,2222"
 #ssh redirection (done automatically by vagrant: local:2222->guest:22)

* Uefi: VBoxManage modifyvm "VM name" --firmware efi
cf https://www.virtualbox.org/manual/ch03.html#efi

### Image conversion

https://en.wikibooks.org/wiki/QEMU/Images#Converting_image_formats
https://wiki.archlinux.org/index.php/VirtualBox#Disk_image_format_conversion

Tools to convert images:
https://www.virtualbox.org/manual/ch08.html#vboxmanage-clonevdi
- VBoxManage clonehd
- VBoxManage convertfromraw [was convertdd]

Ex: Convert from qemu image:
    qemu-img convert WindowsXP.img -O raw WindowsXP.raw
    VBoxManage convertfromraw WindowsXP.raw WindowsXP.vdi
    VBoxManage modifyvdi WindowsXP.vdi compact
Directly with recent qemu: qemu-img convert -O vdi test.qcow2 test.vdi

###  Networking
https://www.virtualbox.org/manual/ch06.html
- Not attached
- Network Address Translation (NAT) [Default]
- NAT Network: like a home router, grouping the systems using it into a network and preventing systems outside of this network from directly accessing systems inside it
- Bridged networking
- Internal networking: connect only to the other wms
- Host-only networking: connect to the host via a bridge, but not to the
  external network

Quemu
-----

https://wiki.archlinux.org/index.php/QEMU
http://wiki.qemu.org/download/qemu-doc.html

Uefi: install the ovmf firmware
Images: https://en.wikibooks.org/wiki/QEMU/Images

Qemu networking: http://wiki.qemu.org/Documentation/Networking
The default is User Networking (SLIRP) [NAT Like]

### Examples

BIOS=/usr/share/ovmf/ovmf_x64.bin
exec qemu-system-x86_64 \
     -display none \
     -machine accel=kvm \
     -m 256 \ #256MO ram
     -bios $BIOS \
     -netdev user,hostfwd=tcp::10022-:22,hostfwd=tcp::12345-:12345 \
     $@
 #Use the host linux kernel:
qemu \
    -kernel /boot/vmlinuz-linux \
    -initrd /boot/initramfs-linux-fallback.img \
    -append "root=/dev/sda2 console=tty0 console=ttyS0 rw systemd.unit=multi-user.target" \

BIOS=/usr/share/ovmf/ovmf_x64.bin
qemu-system-x86_64 -machine accel=kvm -m 256 -bios $BIOS -drive format=raw,file=/var/lib/machines/archlinux.raw
qemu-system-x86_64 -machine accel=kvm -m 256 -kernel /boot/vmlinuz-linux -initrd /boot/initramfs-linux-fallback.img -append "root=/dev/sda2 rw" -drive format=raw,file=/var/lib/machines/archlinux.raw

### Options

-snapshot
    Write to temporary files instead of disk image files. In this case, the raw disk image you use is not written back. You can however force the write back by pressing <C-a s> (see section Disk Images). 
-serial dev
    Redirect the virtual serial port to host character device dev. The default device is vc in graphical mode and stdio in non graphical mode. 
-enable-kvm
    Enable KVM full virtualization support. This option is only available if KVM support is enabled when compiling. [Deprecated in favor of -machine accel=kvm]
-smp n
    Simulate an SMP system with n CPUs
-cpu model
-net nic
    Create a new Network Interface Card and connect it to VLAN n (n = 0 is the default).
-net user
    Use the user mode network stack which requires no administrator privilege to run.

binary packagers
================

- guix/nix, slackware build tools, gentoo (https://wiki.gentoo.org/wiki/Project:Prefix), Suse open build service, 
- Images: snap (ubuntu), flatpak (was xdg-app), appimage, 0install...
  cf https://www.reddit.com/r/linux/comments/4ohvur/nix_vs_snap_vs_flatpak_what_are_the_differences/, https://github.com/probonopd/AppImageKit/wiki/Similar-projects
  Note: flatpak uses libostree, cf https://ostree.readthedocs.io/en/latest/
- sandbox: bubblewrap (lightweight setuid sandbox application developed used by flatpak); firejail: another sandbox
  Note: bubblewrap uses namespaces, snap and appimage uses apparmor
- Containers: lxc, systemd-nspawn, docker

* guix https://www.gnu.org/software/guix/
  [cf logiciels/guix]
  can build pack and docker images: https://guix-hpc.bordeaux.inria.fr/blog/2017/10/using-guix-without-being-root/
  => In the absence of user namespaces, we can resort to PRoot
