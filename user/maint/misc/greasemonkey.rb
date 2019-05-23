if SH.find_executable('firefox')
	## Since GM4.0, importing files://...user.js scripts do not work, cf
	## https://github.com/greasemonkey/greasemonkey/issues/2612
	## Solution: read them from github directly
	# l=@computer.files[:scriptfiles].glob("greasemonkey/**/*.js", expand: true)

	l=["https://github.com/DamienRobert/greasemonkey/raw/master/google_link.user.js", "https://raw.githubusercontent.com/inDream/DownAlbum/master/DownAlbum.user.js"]

	SH.sh("firefox #{l.shelljoin}") unless l.empty?
end

