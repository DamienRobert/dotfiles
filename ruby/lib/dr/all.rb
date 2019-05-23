#load all *.rb file in current directory
dir=File.dirname(__FILE__)
Dir.glob(File.expand_path('*.rb',dir)) do |file|
	#puts file
	begin
		require file if file != __FILE__
	rescue LoadError, Gem::LoadError
		warn "Can't load #{file}: #{$!}"
	end
end
