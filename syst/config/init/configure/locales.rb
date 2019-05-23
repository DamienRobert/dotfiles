if (@dir[:target]+"etc"+"locale.gen").exist?
	chroot("locale-gen")
end
