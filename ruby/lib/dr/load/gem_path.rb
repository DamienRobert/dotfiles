#configure gem path
rubydir = [ENV['MYRUBY'], File.join(ENV['HOME'],"ruby"), File.join(ENV['MYFILES'] || "#{ENV['HOME']}/mine", "ruby")].find do |ruby|
	ruby && Dir.exist?(ruby)
end

coregem=File.join(rubydir, "core_gems")
Gem.path << coregem

# In Gem.paths=(env) we have 
#   @paths = Gem::PathSupport.new ENV.to_hash.merge(target)
#   Gem::Specification.dirs = @paths.path
# Indeed Gem::Specification.dirs is memoized so we need to set it again after we update paths. In doubt I call .reset which will also reset hooks
Gem::Specification.reset
