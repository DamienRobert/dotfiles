if @computer.dig(:sysinit,:backup)

	timestamp=Time.now.strftime('%F')

	if (rootleaf=@dir[:target]+DR::Computer::ROOTLEAF).directory?
		fsinfos=SH.stat_filesystem(rootleaf)
		if fsinfos[:fstype]=="btrfs"
			snapshot=rootleaf+"@snapshots"
			snapshot.sudo_mkpath unless snapshot.directory?
			snapshotdest=snapshot+"slash-init-#{timestamp}"
			SH.sh("btrfs subvolume snapshot -r #{@dir[:target].shellescape} #{snapshotdest.shellescape}", sudo: true) unless snapshotdest.directory?
		end
	end

	boot=@dir[:target]+"boot"
	if (boot+"vmlinuz-linux").exist?
		bootinit=boot+"@snapshots"+"archlinux-init-#{timestamp}"
		bootinit.sudo_mkdir unless bootinit.directory?
		files=%w(vmlinuz-linux initramfs-linux.img initramfs-linux-fallback.img).map {|f| boot+f}
		# bootinit.on_cp(*files) #we need sudo
		SH.sh("cp #{files.shelljoin} #{bootinit.shellescape}", sudo: true)
	end
end
