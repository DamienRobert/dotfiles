if @computer.dig(:syst,:boot) and Array(@computer.dig(:syst,:bootloader)).include?("systemd-boot")
	opts=["--path=#{@dir[:target]+"boot"}"]
	opts<<"--no-variables" unless @processor.current?
	SH.sh("bootctl #{opts.shelljoin} update", sudo: true)
end
