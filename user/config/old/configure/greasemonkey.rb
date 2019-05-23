if SH.find_executable('firefox')
	l=@computer.files[:scriptfiles].glob("greasemonkey/*.js", expand: true)
	SH.sh("firefox #{l.shelljoin}") unless l.empty?
end
