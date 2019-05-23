# TODO: symlink(hardlink: true) does not work because the hardlink needs to
# exist, but it exists in commit: not in out:
# Furthermore "tmp/plam".on_ln("../ploum") looks for ploum from the
# current directory...

file=@dir[:target]+".local/share/Arena Tracker"
if file_exist?(file)
	file.chdir do |dir|
		dir.on_ln("../../../mine/config/files/ArenaTracker/ArenaTrackerDecks.json")
	end
end
