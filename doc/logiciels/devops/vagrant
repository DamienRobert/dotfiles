vim: ft=markdownlight fdm=expr

Vagrant Boxes
=============

Vagrant Boxes List:
https://wiki.archlinux.org/index.php/Vagrant#Base_Boxes_for_Vagrant
https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=&q=archlinux
http://www.vagrantbox.es/

Ex of archlinux vagrant box:
-> https://github.com/Dreamscapes/atlas-archlinux

Add a box:
  $ vagrant box add archlinux-test http://vagrant.srijn.net/archlinux-x64-2014-01-07.box
-> la box est dans ~/.vagrant.d/boxes

Packer:
 $ pacaur -y packer-io
    cd ~/opt/vagrant
    git clone ~/var/dist/packer-arch .
    packer-io build -only=virtualbox-iso arch-template.json
    vagrant box add arch packer_arch_virtualbox.box

Some packer configs:
- https://github.com/elasticdog/packer-arch [archlinux box, forked to ~progs/packer-arch]
- https://github.com/SocialGeeks/packer-boxes [several boxes, including archlinux]
- By chef: https://github.com/chef/bento [the vagrant images are also available]

Create a box from a VirtualBox image:
vagrant package [--vagrantfile FILE] --base my-virtual-machine

From an imported box:
vagrant box repackage arch virtualbox 0 -> package.box

Vagrant
=======

vagrant init arch
#vagrant's ssh does not understand ECDSA
SSH_AUTH_SOCK= vagrant up
vagrant ssh

# All the boxes:
~/opt/vagrant/packer-arch/packer_arch_virtualbox.box (540MO)
  arch vagrant box made by packer
  the folder also contains archlinux install iso in packer_cache (548MO)
~/.vagrant.d/boxes/ (546MO)
  boxes imported by vagrant (to get back the original .box format use 'vagrant box repackage')
  clean them via vagrant box remove
~/VirtualBox\ VMs/ (1.1GO) (or ~/var/spool/VirtualBox)
  boxes set up by vagrant up
  clean space via vagrant destroy
  (get a box from a running vm via 'vagrant package')

Settings
========

Disable default shared folder:
https://docs.vagrantup.com/v2/synced-folders/basic_usage.html
config.vm.synced_folder "./", "/vagrant", disabled: true

Packer
======

Exemple of provisioners:
(this connects via ssh, uploads the script and runs it.
For this ssh has to be available; this is annoying and I prefer to configure everything in "builders" in arch-template.json)

    "builders": [
        {
            "type":     "null",
            "host":     "127.0.0.1",
            "ssh_username": "foo",
            "ssh_password": "bar"
        }
    ],
    "provisioners": [
      {
        "type" : "shell",
        "scripts": [
          "install-box.sh"
        ]
      }
    ],

vagrant can read lzma files; to generate them:
gunzip packer_myarch_2014.08.01_virtualbox-iso_virtualbox.box.gz
xz -9 packer*
(maybe put a 0 compression level to remove the need for the first step?)
This goes from 544M uncompressed to 538M gzip to 518M xz

Note: https://github.com/aspring/racker
A ruby dsl for packer

Vagrantfile
===========

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "arch"
  config.ssh.default.private_key_path = "#{ENV['HOME']}/mine/syst/ssh/provision_id_rsa"


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./", "/vagrant", disabled: true

  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.
  config.vm.provision "ansible" do |ansible|
    #ex: https://coderwall.com/p/txsqcq
    ansible.playbook = "ansible/site.yml"
  end
end

Plugins
=======

vagrant+qemu (more precisely libvirt): https://github.com/pradels/vagrant-libvirt/
