#external symlinks meaning symlinks that only make sense for a local install
@processor.break_if_notpresent
@dir[:commit].cd do
	links=%w(posts website ViePratique).map {|x| Pathname.new("perso")+x}+
		%w(magma Work).map {|x| Pathname.new("pro")+x}+
		[Pathname.new("latex/texmf")]
	links.each { |l| symlink(l, clobber: false) }

	# symlink(".cache/@comps/#{@computer.name}", "@computer")
	mkdir(".cache/cpanm"); write_symlink(".cpanm", ".cache/cpanm")
	mkdir(".cache/cpan/build"); mkdir(".cpan"); write_symlink(".cpan/build", "../.cache/cpan/build")
	symlink("Downloads/dwhelper", clobber: false)

	if runtime=@computer.file(:xdg_runtime_dir)
		symlink(runtime+"gvfs", ".gvfs", clobber: false)
		symlink(runtime, "run", clobber: false)
	end
	symlink("/run/media/#{ENV['USER']}", "media", clobber: false)

	data=Pathname.new("data")
	large=Pathname.new("large")
	var=Pathname.new("data/var")
	if data.directory?
		#symlink("../home", "data/home", clobber: false)
		symlink("..", "data/home", clobber: false)
		symlink("home/large", "data/large", clobber: false) if large.directory?
		Pathname.glob("data/*").each do |dir|
			next if !dir.directory? or %w(home large).include?(dir.basename.to_s)
			symlink(dir, clobber: false)
		end
	end
	if large.directory?
		#symlink("../home", "large/home", clobber: false)
		symlink("..", "large/home", clobber: false)
		symlink("home/data", "large/data", clobber: false) if data.directory?
	end
	if var.directory?
		symlink("../home/.cache", "data/var/cache", clobber: false)
		symlink("../home/.local/share", "data/var/share", clobber: false)
	end
end

# directories
@dir[:out].cd do
	Pathname.new(".cache/homeassistant").mkpath
end
