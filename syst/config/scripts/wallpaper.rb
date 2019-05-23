#if @computer[:packages].find {|p| p =~ /^lightdm/}
if has_package?("lightdm")
	walldirs=[@local_computer.file(:myfiles)+"medias/wallpaper"]
	walldirs << @computer.file(:xdg_data_home) if @computer.current?
	wallpaper=nil; logo=nil
	walldirs.each do |dir|
		f=dir+"wallpaper.png"
		wallpaper=f if f.exist?
		f=dir+"logo.svg"
		logo=f if f.exist?
	end
	logger.info "- lightdm wallpaper"
	copy_file(wallpaper,"etc/lightdm/wallpaper.png") if wallpaper.exist?
	copy_file(logo,"etc/lightdm/logo.svg") if logo.exist?
end
