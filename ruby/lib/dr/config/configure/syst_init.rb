#!/usr/bin/env ruby
require 'dr/config/configure/syst_config'

# Computer root and disk:
# 1) in syst/generate.rb#initialize, the computer root is set to opts[:root]:
#   @computer=Computer.new(computer, infos: {root: opts[:root]}) if opts[:root]
# => so syst/generate.rb --root=foo will set the root to foo
# Of course we could the standard computer option parsing: syst/generate.rb -c foobar!root=foo

# 1bis) This is also set in self.create:
#   infos[:root]=opts.fetch(:root, "/mnt/image")
#   disk=opts.fetch(:disk, infos[:root])
#   infos[:sysinit][:disk]=disk #can be set via syst/init.rb --disk=...
#   c=Computer.new(compname, infos: infos)
# => so syst/generate.rb --create=foo will create foo and set foo's root
# => syst/generate.rb --root bar --create=foo will create foo and set foo's root to bar

# 2) The target dir is set to the root in generate.rb#set_dir
#   @dir[:target]||=@computer.root

# 3) This target is used in `bootstrap` to set the mountpoint and disk:
#   @computer[:sysinit][:mountpoint]||=@dir[:target]
#   @computer[:sysinit][:disk]||=@opts[:disk]

# 4) And these are used in partitions:
# In partitions(**opts):
#   opts[:disk]||=@computer.dig(:sysinit, :disk)
#   opts[:mountpoint]||=@computer.dig(:sysinit, :mountpoint)

# Note that the mountpoint is where the image is mounted. This is not used
# if we don't have a device. The @dir[:target] is were we commit files in
# ./generate.rb and where we configure things:
# syst/generate.rb#chroot/archchroot use @dir[:target].
# Finally @computer.root is used for local_informations, so we could
# imagine it being distinct from @dir[:target] if we want our current local
# informations for a new computer.
# It is a good idea that all three directory coincide, but not required.

=begin
$ ./init.rb --disk="/tmp/arch_img.raw:size=2G" --create="arch_virtual" --build
This creates a arch_virtual computer, whose root is in/mnt/image

Then ProcessActions.process_actions is called, which call Process::Squel#dispatch (and not process, because we changed the default in process_files.rb), which calls Process::Squel#process_actions, which sends each defined action.
=end

module DR
	module Process
		class SystInit < Syst
			def set_dir
				@dir[:gen]||=@local_computer.file(:systfiles)+"config"+"init"
				@dir[:destname]||="slash-init"
				super
			end

			attr_accessor :prepare, :prepare_done
			attr_writer :partitions
			def initialize(computer="local",**opts)
				super
				@prepare=nil
				@prepare_done=[]
				bootstrap_infos
				yield self if block_given?
				bootstrap
			end

			def bootstrap_infos
				@users=
					{"dams"=> 
						{:uid=>1000,
						:gid=>100,
						:passwd => '$6$b1v37XaB$OmuydX0KX8E7GXshkpGhcuo73g68uFHyo9Q1WkomsoVhoa5HxbnQFejDboGTkUbyvc7OKP2rM2uVwRHSzyqka1',
						:info=>"Damien Robert",
						:home=>"/home/dams",
						:shell=>"/bin/zsh",
						:groups=>["wheel", "sshc", "users"]},
					"dina"=>
						{:uid=>1001,
						:gid=>100,
						:passwd => "$6$qVbNIhe2$TQuFIf0WLp0lXmxeIYOnhXKZXgjlQV.2dcAa8R97hSkpdYVLY2a40sIkDMls14B3u4SRCLVdqJDjElwxRgNni/",
						:info=>"Blandine Belin",
						:groups=>["users"]},
					"toto"=>
						{:uid=>1002,
						:gid=>1002,
						:info=>"Dummy User",
						:home=>"/home/toto",
						:passwd => '$6$.XyEDrqK$m/8kVCgeTPi/MXtzkpcDBBaXbMcMyiSph6uNKnQuXfEkmQDJnW.YdzArGwJ2PwvNQqaB4WQndOY.6KRibA5e/.',
						:groups=>["users"]},
					"root"=>{passwd: '$6$DaueAhJn$SdSZqI/kcdTV9tDWOtzE1uobjH548VS0ZLs8hZNt5VYRDTyhdHOxfXJyPy.WZdthBFSsUNCJSxFcLixoFm6p91'}}
				@groups={"sshc"=>{:gid=>2000}}
				# default=proc { |hash, key| hash[key] = Hash.new }
				# @users.default_proc= default
				# @groups.default_proc= default
			end

			# bootstrap settings for @computer
			def bootstrap
				@computer[:sysinit]||={}

				# configure users and groups
				users=@users.slice_with_default(*@computer.dig(:sysinit, :newusers, default: []), default: {})
				@computer.add_to_key(:sysinit,:users, users, uniq: true)
				allgroups=@computer.dig(:sysinit, :users).map {|_u, props| props[:groups]}.flatten.compact
				allgroups-=%w(users wheel) #already existing groups
				groups=@groups.slice_with_default(*(@computer.dig(:sysinit, :newgroups, default: [])+allgroups), default: {})
				@computer.add_to_key(:sysinit,:groups,groups, uniq: true)

				@computer[:sysinit][:mountpoint]||=@dir[:target]
				@computer[:sysinit][:disk]||=@opts[:disk]
				@computer
			end

			# process.pacstrap("-S", "git", pacstrap: @computer.file(:scriptfiles)+"archlinux"+"mypacstrap")
			def pacstrap(*pkgs, hostcache: true, opts: [], pacman_opts: [], pacstrap: "pacstrap")
				if pkgs.empty?
					warn "Pacstrap: no packages were given"
					return false
				end
				conffile=nil
				[@dir[:dest]+"slash", @dir[:out]].each do |d|
					c=(d+"etc/pacman.conf")
					conffile=c if c.exist?
				end
				opts << "-c" if hostcache
				opts+=["-C", conffile] if conffile
				pacman_opts << "--needed"
				#-MG: don't copy mirrorlist and gnupg
				SH.sh("#{pacstrap.shellescape} -MG #{opts.shelljoin} #{@dir[:target].shellescape} #{pacman_opts.shelljoin} #{pkgs.shelljoin}", sudo: true)
				pkgs
			end

			# pacstrap force -Sy, sometimes we want more control
			def pacman(*args)
				SH.sh("pacman --sysroot #{@dir[:target].shellescape} #{args.shelljoin}", sudo: true)
			end

			# we call the helpers each time we call partitions, so that if
			# @partitions is updated we still get the correct result
			# note that once the disk and mountpoint have been specified, they
			# are not overwritten (except if update_disk==true; I did not need
			# an update_mountpoint option). So the default :disk and :mountpoint
			# options in :sysinit are harmless once we specified things like in
			# do_prepare
			def partitions(**opts)
				opts[:disk]||=@computer.dig(:sysinit, :disk)
				opts[:mountpoint]||=@computer.dig(:sysinit, :mountpoint)
				@partitions=partitions_helper(@partitions||Marshal.load(Marshal.dump(@computer.dig(:sysinit,:partitions))), **opts)
				@partitions = yield @partitions, **opts if block_given?
				@partitions
			end

			# allow to set the disk once we have it
			# set the mountpoints from the rel_mountpoint once we have the root mountpoint
			private def partitions_helper(partitions, disk: nil, mountpoint: nil, update_disk: false)
				partitions={} if partitions.nil?
				partitions.each do |k,v|
					v[:name]||=k.to_s unless v.key?(:name) #so that we can disallow :name by setting it to nil
					v[:disk]=disk if disk and (!v.key?(:disk) or update_disk)
				end
				if mountpoint
					partitions.each do |_k,v| 
						rel_mountpoint=v[:rel_mountpoint]
						if rel_mountpoint
							partmountpoint=Pathname.new(mountpoint)+rel_mountpoint
							v[:mountpoint]||=partmountpoint.to_s
						end
					end
				end
				partitions
			end

			# Note that we only need to create subvolume like partition (ie
			# subvolumes we will mount to specific folders). Normal subvolumes in
			# normal position can be created via
			# SH.make_dir_or_subvolume(subvol_position) in the pre_install hook
			# @exemple
			# {rootleaf: {label: "slash", parttype: :"x86-64_root", fstype: "btrfs", subvol: "/", rel_mountpoint: DR::Computer::ROOTLEAF, subvolumes: {slash: {subvol: "slash", rel_mountpoint: '.', default_subvolume: true}, home: {subvol: "slash/home"}, data: {subvol: "slash/data"}}}}
			def create_subvolumes(partitions=self.partitions, tmpmount: "/tmp/.mount", update_partitions: true, dryrun: false, check: true)
				# partitions=partitions.values if partitions.is_a?(Hash)
				tmpmount=Pathname.new(tmpmount)
				subvols={}
				partitions.each do |name, partition|
					if partition[:subvolumes]
						# 1) mount the / subvolume
						# Here we may have already set a default subvolume, so we need
						# to be carefull to mount the / subvolume
						!dryrun and SH.mount([partition.merge(mountoptions: 'subvol=/', mountpoint: tmpmount)]) do
							#subvolumes is a hash, so sorting the keys is annonying
							#subvolumes=partition[:subvolumes].sort { |p1, p2| Pathname.new(p1[:path]) <=> Pathname.new(p2[:path]) }
							#we assume that the user specified the subvolumes in a correct order
							# 2) create the subvolumes
							partition[:subvolumes].each do |_subname, subvol|
								dir=tmpmount+subvol[:subvol]
								SH.make_btrfs_subvolume(dir, check: check)
								SH.sh("btrfs subvolume set-default #{dir.shellescape}", sudo: true) if subvol[:default_subvolume]
							end
						end
						# 3) update @partitions with a new device for each subvolume created
						# This is used to mount the correct subvolume during do_mount,
						# since SH.mount look at the :subvol option
						partition[:subvolumes].each do |subname, subvol|
							subvols[:"#{name}_#{subname}"]=subvol.dup
							# copy the relevant values from the parent to the subvolume
							[:disk, :devname, :mountoptions, :label, :uuid, :partlabel, :partuuid, :parttype, :fstype, :name].each do |k|
								subvols[:"#{name}_#{subname}"][k]||=partition[k] if partition.key?(k)
							end
						end
					end
				end
				@partitions.merge!(subvols) if update_partitions
				subvols
			end

			def make_raw_disk(img, size: "1G")
				img=Pathname.new(img)
				SH.make_raw_image(img, size) unless img.exist?
				disk,closedisk=SH.losetup(img)
				puts "- losetup => #{disk}"
				SH.sh("partprobe #{disk.shellescape}", sudo: true) if disk
				return disk, closedisk
			end

			def do_mount(&b)
				# handle paritions which have :mountpoint
				mount, close_mount=SH.mount(partitions, &b)
				@close||=[]
				@close << lambda {@prepare_done.delete(:do_mount)}
				@close << close_mount
				mount
			end
			def do_umount
				SH.umount(partitions)
			end
			def do_partitions
				# handle partitions which have at least one of these key:
				# partnum partstart partlength partlabel partattributes parttype
				SH.make_partitions(partitions)
			end
			def do_fs
				# handle partitions which have :fstype
				SH.make_fs(partitions)
			end

			def do_install_packages
				pacstrap(*list_packages(:arch_abs))
			end

			def self.device_info(disk)
				disk, options=SimpleParser.parse_name_options(disk.to_s, arg_split:':')
				disk=Pathname.new(disk)
				disktype = if disk.directory?
					:directory
				elsif disk.to_s.start_with?("/dev/") # we have a device
					:device
				elsif disk.to_s.end_with?(".raw") or disk.to_s.end_with?(".img") # we want an image
					:image
				else #we want a directory
					:subvol
				end
				return Pathname.new(disk), disktype, options
			end

			# return the @device, or nil if we are working on a dir or subvol
			def get_device(disk)
				disk, disktype, options = self.class.device_info(disk)
				case disktype
				when :device
					device=disk
				when :image
					device, close_device=make_raw_disk(disk, **options.slice(:size))
					@close||=[]
					@close << lambda { remove_instance_variable(:@device) }
					@close << close_device
				when :subvol #:directory => the dir is already there
					SH.make_dir_or_subvolume(disk)
					# no device
				end
				@device=device
			end

			attr_reader :device
			def do_prepare(disk=@computer[:sysinit][:disk], force: false, **opts, &b)
				logger.info "# Prepare"
				bootstrap #TODO: do we still need to call it?
				opts=@opts.merge(opts)
				disk=@dir[:target] if disk.nil?
				unless defined?(@device)
					get_device(disk)
				end
				if @device
					partitions(disk: @device, update_disk: true, &b)
					# normally the code is written so that partitions and fs do not get overwritten, but be extra careful
					@prepare||=prepare_default_actions
					actions=@prepare
					actions-=@prepare_done unless force
					actions.each do |action|
						process_action(action, **opts) && @prepare_done << action
					end
				end
			end

			# do_partitions, do_fs, create_subvolumes, do_mount
			def prepare_default_actions
				r=[]
				r << :do_partitions if partitions.any? do |_k,v|
					%i(partnum partstart partlength partlabel partattributes parttype).any? {|k| v.key?(k)}
				end
				r << :do_fs if partitions.any? do |_k,v|
					v.key?(:fstype)
				end
				r << :create_subvolumes if partitions.any? do |_k,v|
					v.key?(:subvolumes)
				end
				r << :do_mount if partitions.any? do |_k,v|
					v.key?(:mountpoint)
				end
			end

			def full
				@full ||= Syst.new(@computer)
			end
			def full_generate(**opts)
				full.process_action(:generate, msg: "full generate", **opts)
			end
			def full_diff(**opts)
				full.process_action(:diff, msg: "full diff", **opts)
			end
			def full_commit(**opts)
				full.process_action(:commit, msg: "full commit", **opts)
			end
			def full_configure(**opts)
				full.process_action(:configure, msg: "full configure", **opts)
			end

			# install hooks
			def pre_install(**opts)
			end
			def post_install_packages(**opts)
			end
			def post_install(**opts)
			end

			def do_install(**opts)
				logger.info "# Install"
				bootstrap #TODO: do we still need to call it?
				opts=opts.merge(@opts)
				opts[:diff]=opts[:pause] != false unless opts.key?(:diff)
				generate #we generate first to have pacman.conf
				full_generate(**opts)
				pre_install(**opts)
				process_action(:do_install_packages,**opts)
				post_install_packages(**opts)
				process_action(:diff, msg: "init diff", **opts) if opts[:diff]
				process_action(:commit, msg: "init commit", **opts)
				full_diff(**opts) if opts[:diff]
				full_commit(**opts)
				full_configure(**opts)
				# we do this at the end because this is where we run ~backup
				process_action(:configure, msg: "init configure", **opts)
				if present? and @computer.dig(:syst, :boot)
					# we relaunch this script for the autodetection of the kernels + snapshots
					@computer.refresh_local(local: :files) # Update machine-id
					@computer[:syst][:machine_id]=@computer.dig(:local_infos, :syst, :machine_id)
					process_script(@dir[:scripts]+"bootloader.rb", **opts)
					process_action(:diff, msg: "New init diff", **opts) if opts[:diff]
					process_action(:commit, msg: "New init commit", **opts)
				end
				post_install(**opts)
			end

			def do_clean
				logger.info "# Cleaning"
				@close||=[]
				@close=@close.reverse.reject { |close| close.call }.reverse
			end

			def do_all(**opts, &b)
				begin
					do_prepare(**opts, &b)
					do_install(**opts)
				ensure
					do_clean
				end
			end

			def do(prepare: true, prepare_block: nil, **opts)
				begin
					do_prepare(**opts, &prepare_block) if prepare
					yield self if block_given?
				ensure
					do_clean if block_given?
				end
			end

			class <<self
				def partitions
					# we use a function rather than a constant to be able to modify
					# the partitions afterwards
					{boot: {parttype: :boot, partlength: "+100M", fstype: "vfat", rel_mountpoint: 'boot', mountoptions: ['fmask=133']},
					slash_ext4: {parttype: :"x86-64_root", fstype: "ext4", rel_mountpoint: '.'},
					swap: {parttype: :swap, partlength: "+128M", fstype: "swap"},
					rootleaf: {label: "slash", parttype: :"x86-64_root", fstype: "btrfs", subvol: "/", rel_mountpoint: DR::Computer::ROOTLEAF, subvolumes: {slash: {subvol: "slash", rel_mountpoint: '.', default_subvolume: true}, home: {subvol: "slash/home"}, data: {subvol: "slash/data"}}},
					}
				end

				def create(compname, **opts)
					infos={}; infos[:sysinit]={}
					infos[:root]=opts.fetch(:root, "/mnt/image")
					disk=opts.fetch(:disk, infos[:root])
					infos[:sysinit][:disk]=disk
					disk, disktype, _diskoptions = self.device_info(disk)

					systtypes=[]
					case disktype
					when :image
						if disk.to_s.end_with?(".img") # we want a container image
							systtypes <<  :archcontainer
						else #the disk ends with .raw
							systtypes << :archvirtual
							systtypes += %i(pacman ssh shell)
						end
					when :directory,:subvol
						systtypes <<  :archcontainer
					end
					infos.add_to_key(:attributes, :syst_types, systtypes)

					c=Computer.new(compname, infos: infos)
					c[:syst][:type]||=:bare
					part=self.partitions

					# partitions
					case disktype
					when :device, :image
						partitions=self.partitions_from_image(disk)
						p partitions
						unless partitions #the partitions don't yet exist
							fstype=opts.fetch(:fstype, :ext4)
							if c.attribute?(:syst_types, :boot)
								case fstype
								when :ext4
									partitions={ boot: part[:boot], slash: part[:slash_ext4]}
								when :btrfs
									partitions={ boot: part[:boot], rootleaf: part[:rootleaf]}
								end
							else
								case fstype
								when :ext4
									partitions={ slash: part[:slash_ext4]}
								when :btrfs
									partitions={ rootleaf: part[:rootleaf]}
								end
							end
						end
						c.add_key(:sysinit, :partitions, partitions)
					end

					# other options
					# c.add_key(:sysinit, :backup, true) if c.any_attribute?(:syst_types,%i(client server))
					c.add_key(:sysinit, :newusers, ["dams", "toto", "dina", "root"]) if c.attribute?(:syst_types,%i(client))
					c
				end

				# @exemple
				# process=DR::Process::SystInit.create_process("arch_virtual", disk: "/tmp/arch-img.raw:size=2G") do |p|
				#   p.computer[:sysinit][:newusers]=["dams", "provision"]
				# end
				# process.do_all(pause: false)
				def create_process(*args,init_opts: {},**opts,&b)
					c=self.create(*args,**opts)
					self.new(c, **init_opts, &b)
				end

				def partitions_from_image(img)
					parts={}
					SH.partition_infos(img)&.each_with_index do |v,i|
						if (parttype=v[:parttype])
							case (sym=SH.partition_type(parttype, mode: :symbol))
							when :boot
								v[:rel_mountpoint]||='boot'
							when :home
								v[:rel_mountpoint]||='home'
							when :x86_root, :"x86-64_root", :arm64_root, :arm32_root
								v[:rel_mountpoint]||='.'
							end
						end
						v[:name]=nil #we don't want to set up name otherwise it counts as a (non existant) label and the disks won't be found
						parts[sym||i]=v
					end
					parts.empty? ? nil : parts
				end

				def process_args(*args,**opts)
					super do |opt,opts|
						opt.separator("\nInit System options")
						opt.on("--disk=disk/image/subvolume", "Set disk image") do |v|
							opts[:disk]=v
						end
						opt.on("--create=name", "Create a new computer") do |v|
							opts[:computers] ||=[]
							opts[:computers] << self.create(v, **opts)
						end
						opt.on("--[no-]prepare", "Prepare disk") do |v|
							if v
								opts[:actions]<<:do_prepare
							else
								opts[:actions].delete(:do_prepare)
							end
						end
						opt.on("--[no-]install", "Install and configure") do |v|
							if v
								opts[:actions]<<:do_install
							else
								opts[:actions].delete(:do_install)
							end
						end
						opt.on("--[no-]build", "Prepare and install") do |v|
							if v
								opts[:actions]<<:do_all
							else
								opts[:actions].delete(:do_all)
							end
						end
						yield(opt,opts) if block_given?
					end
				end
			end

		end
	end
end

if __FILE__ == $0
	DR::Process::SystInit.process_args(*ARGV)
end

=begin
- generate:
   files: locale.gen, vconsole.conf, xorg.conf.d/00-keyboard.conf
   scripts: bootloader, firstboot (hostname, machine-info, locale.conf, localtime), fstab
- configure: bootctl install, locale-gen, mkinitcpio -p linux, users (from :sysinit), backup (if [:sysinit][:backup])
=end
