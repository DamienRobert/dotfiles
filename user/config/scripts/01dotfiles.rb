def handle_dotfiles(dotfiles)
	# The level gives up to which directory we descend before symlinking
	# We check the wanted level on the current dir, and if not specified on
	# its parent, and so on.
	# -1 means descend all the ways down to files
	conf={"/" => 1} # default to 1 level
	%w(.cpan .config .electrum .flrn .gem .gnome2 .mpd .mplayer .mpv .ncmpcpp .ssh).each { |squel| conf["/"+squel]=1 }
	%w(.cups .local .subversion bin).each { |squel| conf["/"+squel]=-1 }

  # .config/... dirs
	%w(pacman git mcomix).each {|confsquel| conf["/.config/#{confsquel}"]=1}
	%w(calibre fontconfig gtk-3.0 xfce4).each {|confsquel| conf["/.config/#{confsquel}"]=-1}

	conf["/.local/share/lolcate"]=-1

	unless dotfiles.directory?
		warn "#{dotfiles} is not a directory" 
		return nil
	end
	process = Proc.new do |item|
		key=(Pathname.new("/")+item).ascend.find {|k| conf.key?(k.to_s)}
		value=conf[key.to_s]
		recurse = (value == -1 or item.depth < key.depth + value)
		absitem=dotfiles+item
		# puts "Item: #{item}. Config: #{key} => #{value}, recurse: #{recurse}"
		if absitem.directory? and not absitem.symlink? and recurse
			(@dir[:out]+item).mkpath
			absitem.entries.each { |c| process.(item+c) }
		else
			rel=(Pathname.home+item).rel_path_to(absitem)
			# puts "On #{@dir[:out]+item} link to #{rel}"
			(@dir[:out]+item).on_ln_s(rel)
		# symlink
		end
	end
	process.(Pathname.new(''))
end

dotfiles=@local_computer.file(:dotfiles, check: true, fallback: :home)

if dotfiles
	handle_dotfiles(dotfiles)
	handle_dotfiles(dotfiles.append_name("-local")+@computer.name)
	hosttype=@computer.dig(:user,:hosttype)
	handle_dotfiles(dotfiles.append_name("-local")+hosttype) if hosttype && hosttype != @computer.name
end
