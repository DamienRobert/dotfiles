rubydir = [ENV['MYRUBY'], File.join(ENV['HOME'],"ruby"), File.join(ENV['MYFILES'] || "#{ENV['HOME']}/mine", "ruby")].find do |ruby|
	ruby && Dir.exist?(ruby)
end

load_path=File.join(rubydir, "lib")
load_paths=[load_path.to_s]

if defined?(Gem)
	require_relative "gem_path"
else
	load_paths+=Dir.glob(File.join(load_path,"../core_gems/gems/*/lib"))
end

load_paths.each do |l|
	$LOAD_PATH << l unless $LOAD_PATH.include?(l)
end
