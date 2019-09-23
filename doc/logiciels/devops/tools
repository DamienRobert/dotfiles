vim: ft=markdownlight fdm=expr

Tools
=====

* Configuration manager: chef, puppet, salt, ansible
* VPS: Digital Ocean, linode, RamNode, OVH, LunaNode
* Integration continue: travis (github), jenkins
* Monitoring: ganglia
* Cloud configuration: https://cloud-init.io/

* Non root containers:
Cf https://rootlesscontaine.rs/ [tools described there are used by buildah and podman]
=> https://github.com/mgoltzsche/ctnr rootless runc-based container engine

Namespace wrappers:
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

Tools for non root containers:
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

Xephyr: version moderne de Xnest, supportant les extensions X modernes

Protocols: nx, rdp (windows), vnc, spice
  ssh -X/ssh -Y

xpra: rootless (ie la fenêtre s'affiche dans le wm hote) + winswitch (gui helper)

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
- chef/habitat: https://medium.com/@bdangit/habitat-and-docker-c8b19d7e5d8c
  Build applications to run anywhere and manage them throughout their lifecycle.
  Habitat is open source software that creates platform-independent build artifacts and provides built-in deployment and management capabilities.
  A modern version of omnibus, cf https://discourse.chef.io/t/habitat-vs-omnibus/12983/3

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

Virtual box
===========

openstack: le cloud open source

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

binary packagers
================

- snap (ubuntu), flatpak (was xdg-app),  guix/nix, 0install, slackware build tools, gentoo (https://wiki.gentoo.org/wiki/Project:Prefix), Suse open build service, appimage...
cf https://www.reddit.com/r/linux/comments/4ohvur/nix_vs_snap_vs_flatpak_what_are_the_differences/, https://github.com/probonopd/AppImageKit/wiki/Similar-projects
- bubblewrap: bubblewrap is a lightweight setuid sandbox application developed from Flatpak (=used by flatpak to run in a sandbox); firejail: another sandbox
  Note: bubblewrap uses namespaces, snap and appimage uses apparmor
- Containers: lxc, systemd-nspawn, docker

Note: flatpak uses libostree, cf https://ostree.readthedocs.io/en/latest/

* guix https://www.gnu.org/software/guix/
  can build pack and docker images: https://guix-hpc.bordeaux.inria.fr/blog/2017/10/using-guix-without-being-root/
  => In the absence of user namespaces, we can resort to PRoot
