begin
	require 'erubis'
rescue LoadError
	unless $LOAD_PATH.include?("#{ENV['HOME']}/mine/ruby/erubis")
		$LOAD_PATH << "#{ENV['HOME']}/mine/ruby/erubis"
		require 'erubis'
	end
end

__END__
This file was to load the erubis gem that I put in
mine/ruby/erubis.

The 00README was:
These files are copied from the erubis-2.7.0 gems.
This is to use erubis on computers where rubygems is not installed.

All copyright and licences informations should be obtained from
http://www.kuwata-lab.com/erubis/

Now I prefer to use GEM_PATH, and waiting for gem to support a trailing ':' at GEM_PATH, cf config/gem_path to set things up correctly.
