if @computer[:syst][:laptop]
	logger.info "- powersave"
	system "DESTDIR=#{@dir[:out]} make -C #{@dir[:gen]+"../../progs/powersave"}"
end
