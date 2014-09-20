if @computer[:syst][:laptop]
	logger.info "- powersave"
	system "DESTDIR=#{@out} make -C #{@gendir+"../../progs/powersave"}"
end
