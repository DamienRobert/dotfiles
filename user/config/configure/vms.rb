def chattr(dir)
	puts "- chattr: #{dir}"
	dir=Pathname.new(dir)
	dir.mkpath
	dir.chattr("+C")
end

@dir[:target].cd do
	if SH.find_executable("vboxmanage")
		chattr("var/spool/VirtualBox")
		SH.sh("vboxmanage setproperty machinefolder #{@computer.file(:homepath)+"var/spool/VirtualBox"}")
	end
	if SH.find_executable("vagrant")
		chattr("var/spool/vagrant.d")
		puts "- symlink: .vagrant.d"
		Pathname.new(".vagrant.d").on_ln_s("var/spool/vagrant.d", rm: :symlink)
	end
end
