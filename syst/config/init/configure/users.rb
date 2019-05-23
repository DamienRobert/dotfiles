@computer.dig(:sysinit, :groups, default: {}).each do |g, props|
	unless @computer.dig(:local_infos, :syst, :groups, g)
		opts=[]
		(gid=props[:gid]) && opts+=["-g", gid]
		chroot("groupadd  #{opts.shelljoin} #{g.shellescape}") unless @computer.dig(:local_infos, :syst, :groups, g)
	end
end

@computer.dig(:sysinit, :users, default: {}).each do |u, props|
	opts=[]
	(uid=props[:uid]) && opts+=["-u", uid]
	(comment=props[:infos]) && opts+=["--comment", comment]
	(groups=props[:groups]) && opts+=["-G", groups.join(',')]
	(shell=props[:shell]) && opts+=["-s", shell]
	# (passwd=props[:passwd]) && opts+=["--password", passwd]
	group=props[:group]||"users"

	# we first create the user if it does not exist, and then set the
	# settings. We could apply the settings on user creations, but this way
	# it should be easier to be idempotent
	chroot("useradd -m #{u.shellescape}") unless @computer.dig(:local_infos, :syst, :users, u) or u=="root"
	chroot("usermod #{opts.shelljoin} #{u.shellescape}") unless opts.empty?

	if (dir=@dir[:gen]+"users"+u).directory?
		SH.rsync(dir.to_s+"/", (@dir[:target]+"home"+u).to_s+"/", sudo: true, chown: "#{u}:#{group}", rsync_opts: ["--copy-unsafe-links"])
	end

	if (passwd=props[:passwd])
		# if password is '', 'x', '$*', '!*'
		if passwd=~/^(x?$|!|\$)/
			chroot("usermod --password #{passwd.shellescape} #{u.shellescape}")
		else
			# This fails with 'chpasswd: PAM: Module is unknown'
			# sudo("chpasswd -R #{@dir[:target]}", capture: true, stdin_data: "#{u}:#{passwd}")
			# This works but is ugly
			# chroot("sh -c 'echo #{"#{u}:#{passwd}".shellescape} | chpasswd'")
			chroot("chpasswd", capture: true, stdin_data: "#{u}:#{passwd}")
		end
	end
end
