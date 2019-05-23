masked=[]
masked << "85-tlp.rules" if has_package?("tlp")
masked.each do |mask|
	symlink("/dev/null",Pathname.new("etc/udev/rules.d")+mask)
end
