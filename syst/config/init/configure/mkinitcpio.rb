if @computer[:syst][:boot] and (@dir[:target]+"etc"+"mkinitcpio.conf").exist?
	archchroot("mkinitcpio -p linux")
end
