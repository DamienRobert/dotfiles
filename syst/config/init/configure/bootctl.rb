if @computer.dig(:syst,:boot) and [*@computer.dig(:syst,:bootloader)].include?("systemd-boot")
	opts=["--path=#{@dir[:target]+'boot'}"]
	opts<<"--no-variables" unless @processor.current? and @computer.dig(:sysinit, :efivars)
	SH.sh("bootctl #{opts.shelljoin} install", sudo: true)
end
