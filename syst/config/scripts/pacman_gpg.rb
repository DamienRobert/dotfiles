if has_base_package?("pacman")
	gpgdir="etc/pacman.d/gnupg"
	if @processor.present? and !(@dir[:target]+gpgdir).directory?
		(@dir[:out]+gpgdir).on_cp_r(@local_computer[:user][:systfiles]+"keyrings/archlinux")
	end
end
