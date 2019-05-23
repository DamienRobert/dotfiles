@dir[:out].cd do
	links=%w(doc maint progs ruby script syst user user/config user/config/dotfiles).map {|x| Pathname.new("mine")+x}
	links.each { |l| symlink(l) }

	symlink(".vim/vimrc", ".vimrc", check: false)
	symlink(".zsh/.zprofile", check: false)
	symlink(".zsh/.zshrc", check: false)
	symlink(".config/git/config", ".gitconfig" ,check: false)
	symlink("../.local/share/applications/mimeapps.list",".config/mimeapps.list")

	Pathname.glob("data/*").each do |dir|
		next if !dir.directory?
		symlink(dir, clobber: false)
	end
	symlink("var/tmp", clobber: false)
end
