vim: ft=markdownlight fdm=expr

- https://github.com/containers 
  repo of podman, skopeo, buildah...
- https://github.com/opencontainers
  runc, runtime-spec (runtime-tools to work with the spec), image-spec (image-tools to work with the spec)
  cf http://events17.linuxfoundation.org/sites/events/files/slides/OCI_Runtime_Tools_for_Container_Standardization_v3.pdf

Documentation
=============

- https://www.opencontainers.org/
  OCI currently contains two specifications: the Runtime Specification (runtime-spec) and the Image Specification (image-spec)
- Terminologie: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/
- https://lwn.net/Articles/741897/
The Open Container Initiative (OCI) now specifies most of the above under a few specifications:
  - the Image Specification (often referred to as "OCI 1.0 images") which defines the content of container images
  - the Runtime Specification (often referred to as CRI 1.0 or Container Runtime Interface) describes the "configuration, execution environment, and lifecycle of a container"
  - the Container Network Interface (CNI) specifies how to configure network interfaces inside containers, though it was standardized under the Cloud Native Computing Foundation (CNCF) umbrella, not the OCI
- https://blog.osones.com/le-point-sur-les-container-runtimes.html
- https://coreos.com/rkt/docs/latest/rkt-vs-other-projects.html

Podman
======

=> pacman -S podman
  Packages (7) cni-plugins-0.8.1-1  conmon-1:0.3.0-1  ostree-2019.2-1
               runc-1.0.0rc8-1  skopeo-0.1.37-1  slirp4netns-0.3.0-1
               podman-1.4.4-1

Documentation
-------------

* Références sur cri-o/podman
- https://jvns.ca/blog/2016/10/02/i-just-want-to-run-a-container/ Nice but a bit old summary
- https://www.infoq.com/articles/container-runtimes-kubernetes Runtime for kubernetes
- https://www.reddit.com/r/kubernetes/comments/9y89wu/a_comparison_of_container_runtimes/ Nice discussion
- https://kubic.opensuse.org/blog/2018-03-25-podman/ Quick overview of podman
- https://developers.redhat.com/blog/2019/02/21/podman-and-buildah-for-docker-users/ Longer overview of podman and buildah
- https://blog.openshift.com/crictl-vs-podman/ Nice graphs explaning the different roles of cri-o vs podman
- https://discussion.fedoraproject.org/t/what-does-fedora-coreos-mean-for-fedora-and-rkt/78/7 Features from rkt (systemd/machinectl integration) missing from podman

* Intégration podman et systemd:
- https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container/
- https://opensource.com/article/18/10/podman-more-secure-way-run-containers (exemple de l'utilisation d'auditctl)

* Rootless
- https://opensource.com/article/19/2/how-does-rootless-podman-work
- https://github.com/containers/libpod/blob/master/docs/tutorials/rootless_tutorial.md

Usage
-----

* Tutorial
- https://github.com/containers/libpod/blob/master/docs/tutorials/podman_tutorial.md
  podman ps [-a], inspect, logs, top, diff
         checkpoint, restore, pause, unpause, stop
         pull/push, rm, rmi
  podman init / create. create: create container from image; init: init an existing container
  podman start / run [-i] [automatically call create/init if needed]
  podman mount
  podman commit f299 foo

  Clean up: podman rm -af; podman rmi -af

Docker
======

-> dockerd: high level demon
-> containerd: low level demon: construit l'image container image (par exemple peut utiliser overlayfs)
-> runC: low level command to run the container
The Docker daemon prepares the image as an Open Container Image (OCI) bundle and makes an API call to containerd to start the OCI bundle. containerd then starts the container using runC.

* Docker storage driver
- https://docs.docker.com/storage/storagedriver/select-storage-driver/
  => aufs, devicemapper, overlay and overlay2, btrfs, zfs

* Small docker images with alpine
https://www.wezm.net/technical/2019/02/alpine-linux-docker-infrastructure/
http://blog.viraptor.info/post/creating-containers-by-hand

Container Runtime Interface (CRI)
=================================

- dockerd (via docker-shim), containerd:
  https://kubernetes.io/blog/2018/05/24/kubernetes-containerd-integration-goes-ga/
- cri-o https://cri-o.io/ Lightweight Container Runtime (OCI complient) for Kubernetes
- https://github.com/oracle/railcar
  RailCar: Rust implementation of the Open Containers Initiative oci-runtime
- systemd-nspawn
- podman: https://podman.io/ Interface cli pour gérer les images containers
  = alternative au cli docker
  (ie cri-o est utilisé directement par kubernetes, podman est pour
  lancer un container en ligne de commande sans kubernetes)
- https://github.com/projectatomic/bwrap-oci
  Run an OCI container using Bubblewrap

OCI images
==========

Build images
------------
+ buildah: https://buildah.io/ build container images
- https://umo.ci/ [=tar for containers images]
  https://www.cyphar.com/blog/post/20161129-umoci-new-oci-image-tool
  umoci intends to be a complete manipulation tool for OCI images. In particular, it should be seen as a more end-user-focused version of the oci-image-tools provided by the OCI [https://github.com/opencontainers/image-tools]. The hope is that all of this tooling will eventually be merged with the upstream repository, so that it is always kept up-to-date by the Open Container Initiative community.
  => used by Orca as a builder
- docker: buildkit, cf https://events.linuxfoundation.org/wp-content/uploads/2017/11/Comparing-Next-Generation-Container-Image-Building-Tools-OSS-Akihiro-Suda.pdf
- by hand, using ostree: https://bcksp.blogspot.com/2018/02/diy-docker-using-skopeoostreerunc.html
- https://github.com/wagoodman/dive
  A tool for exploring each layer in a docker image
- other tools: orca-build, img, diy, buildah, oci-image-tool
  https://www.projectatomic.io/blog/2018/03/the-many-ways-to-build-oci-images/

Buildah
-------

Exemple of using buildah: https://github.com/containers/buildah/blob/master/docs/tutorials/01-intro.md
$ buildah from archlinux/base => /var/lib/containers/storage

newcontainer=$(buildah from scratch)
scratchmnt=$(buildah mount $newcontainer) #/var/lib/containers/storage/overlay/b78d0e11957d15b5d1fe776293bd40a36c28825fb6cf76f407b4d0a95b2a200d/merged

buildah from voidlinux/voidlinux #=> buildah images: new images
buildah from alpine
 # Note: alpine has 1 layer, voidlinux 2

buildah run alpine-working-container sh

/var/lib/containers/storage
---------------------------

overlay-images: where the images are stored
  images.json: manifest
  aef799541.../
    manifest: contain the config and layers digest 'application/vnd.docker.distribution.manifest.v2+json'
    +2 files =c2..., one which is equal to the manifest, the other which
    looks like a config.json

overlay-containers: where the running containers are
  containers.json: manifest
  the dirs either have userdata/buildah.json (when building with buildah) or userdate/config.json

overlay-layers: where the layer images are
  03901b4a2ea88eeaad62dbe59b072b28b6efa00491962b8741081c5df50c65e0.tar-split.gz a layer of an image
  layers.json: contain the layers (the one in overlay-layers) + the ones in this dir

overlay: where the overlay mount are done
  cf https://docs.docker.com/storage/storagedriver/overlayfs-driver/
  for the structure

Skopeo
------

+ https://github.com/containers/skopeo
  Work with remote images registries - retrieving information, images, signing content [=rsync for containers images]. Used by podman
=> podman+buildah+skopeo Intégrés sous openshift: https://www.openshift.com

Inspect docker.io image
skopeo inspect docker://voidlinux/voidlinux

Copy:
skope copy docker://alpine containers-storage:alpine => store in /var/lib/containers

skopeo copy docker://alpine dir:alpine
alpine/
  version => Directory Transport Version: 1.1
  manifest => the manifest: config = 961... layers=9d48
  961...: config (in json)
  9d... tar.gzip

skopeo copy docker://alpine docker-archive:alpine_docker
  => a tar archive; which extract in dir
  This is the old format for docker images

skopeo copy docker://alpine oci:alpine_oci
  index.json [this is an application/vnd.oci.image.index.v1+json] => manifests":[{"mediaType":"application/vnd.oci.image.manifest.v1+json","digest":"sha256:7ba025acbb303459ac3a5bad7f8dfa844b3d33ac55504aac47a6d712740c1787","size":348,"platform":{"architecture":"amd64","os":"linux"}}]}
  and then in blobs/sha256/7ba: "config":{"mediaType":"application/vnd.oci.image.config.v1+json" ... "layers":[{"mediaType":"application/vnd.oci.image.layer.v1.tar+gzip"
Note: skopeo copy docker://alpine oci:alpine:latest
  => adds in index.json "annotations":{"org.opencontainers.image.ref.name":"latest"}

skopeo copy docker://alpine oci-archive:alpine_oci_archive
  => a tar of the alpine_oci dir

To use with runc / systemd-nspawn --oci-bundle=
one needs to call oci-image-tool unpack busybox-oci busybox-bundle
or umoci unpack --image opensuse:latest opensuse_bundle

Essentially this is just a dir with a
config.json and a rootfs/ directory.

Containers tools
================
- https://github.com/justone/dockviz
  Visualizing Docker data
