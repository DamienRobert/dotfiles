pkgs=Packages.new(@computer).pkgslist
if pkgs.find {|p| p =~ /^lightdm/}
	logger.info "- lightdm wallpaper"
	FileUtils.mkdir_p(@out+"etc/lightdm")
	FileUtils.cp("#{ENV['HOME']}/mine/wallpaper/wallpaper.png",@out+"etc/lightdm/wallpaper.png")
end
