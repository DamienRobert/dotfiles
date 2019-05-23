#!/usr/bin/env ruby
require 'pathname'

#note on gem paths: cf rubygems//path_support.rb

#if GEM_HOME is not defined it is set to Gem.default_dir 
#=> /usr/lib/ruby/gems/2.5.0

#if GEM_PATH is not defined it is set to Gem.default_path
#=> ["/home/dams/.gem/ruby/2.5.0", "/usr/lib/ruby/gems/2.5.0"]
#    ~~~
#    path << user_dir if user_home && File.exist?(user_home) => "/home/dams/.gem/ruby/2.5.0"
#    path << default_dir
#    path << vendor_dir if vendor_dir and File.directory? vendor_dir => /usr/lib/ruby/vendor_ruby/gems/2.5.0
#    ~~~
# GEM_HOME is then added to GEM_PATH (bug: it should probably be prepended...)
# More precisely, @path is set to $GEM_PATH (+ default_path $GEM_PATH ends
# with ':'), $GEM_HOME
# eg Gem.paths: <= def Gem.paths; @paths ||= Gem::PathSupport.new(ENV); end

# => #<Gem::PathSupport:0x000055ff94c768b8
# @home="/home/dams/opt/pkgmgr/gems", <= def Gem.dir; paths.home; end
# @path=
#  ["/home/dams/opt/pkgmgr/gems",
#   "/home/dams/mine/ruby/core_gems",
#   "/home/dams/.gem/ruby/2.5.0",
#   "/usr/lib/ruby/gems/2.5.0"],

#
#if --user is used, GEM_HOME is replaced by Gem.user_dir, cf ':user_install' in rubygems//installer.rb
#
#Use Gem.clear_paths to reset the gem environment

module DR
	class ChRuby
		module Helper
			def path_to_array(path)
				ar=if path.is_a?(Enumerable)
					path
				else
					path.to_s.split(Gem.path_separator)
				end
				ar.map {|a| Pathname.new(a.to_s)}
			end

			def join_path(array)
				array.join(Gem.path_separator)
			end

			def add_to_path(dir, path)
				path=path_to_array(path)
				path.unshift(dir) unless path.include?(dir)
				return path
			end

			def remove_on_path(dir, path)
				path.reject {|p| p.to_s ==dir.to_s }
			end
		end

		module ClassHelper
			def localised_gem_dir(parent)
				ruby_engine=defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
				ruby_version=RUBY_VERSION
				Pathname.new(parent)+ruby_engine+ruby_version
			end

			def gem_infos
				r=[]
				gem_path=Gem.path
				gem_dir=Gem.dir
				r<< "[#{gem_dir}]" unless gem_path.include?(gem_dir)
				gem_path.each do |gp|
					r << (gp == gem_dir ? "[#{gp}]" : gp)
				end
				r.join(':')
			end
		end

		include Helper
		extend ClassHelper
		private :path_to_array, :add_to_path, :remove_on_path, :join_path

		def initialize
			prepare_gem_path
			@path=path_to_array(ENV['PATH'])
			@ruby_root=ENV['RUBY_ROOT'] && Pathname.new(ENV['RUBY_ROOT']) #for new rubies
		end

		private def bin_dir(dir)
			Pathname.new(dir.to_s)+"bin"
		end

		private def prepare_gem_path
			#de not use Gem.path: it is already expanded. But if GEM_PATH has a
			#trailing colon, we want to keep it in case we switch rubies
			#gem_dir=Pathname.new(Gem.dir)
			#gem_path=path_to_array(Gem.path)
			@gem_home=ENV['GEM_HOME'] && Pathname.new(ENV['GEM_HOME'])
			gem_path=ENV['GEM_PATH']||[]
			gem_path.end_with?(':') && @trailing_colon=true
			@gem_path=path_to_array(gem_path)
		end

		def push_gem_dir(dir)
			dir=Pathname.new(dir.to_s)
			@gem_path=add_to_path(@gem_home, @gem_path)
			@gem_home=dir
			@path=add_to_path(bin_dir(dir), @path)
		end
		def push_global_gem_dir(dir)
			push_gem_dir(self.class.localised_gem_dir(dir))
		end

		def pop_gem_dir
			@path=remove_on_path(bin_dir(@gem_home), @path)
			@gem_home=@gem_path.shift
		end

		def export_env
			gem_path=join_path(@gem_path)
			gem_path<<':' if @trailing_colon
			env={"GEM_HOME"=>@gem_home.to_s,
				"GEM_PATH"=>gem_path,
				"PATH"=>join_path(@path)}
			env["RUBY_ROOT"]=@ruby_root if @ruby_root
			env
		end

		private def export(value)
			value.to_s.inspect
		end

		def export_gem_env
			export_env.each do |k,v|
				puts "#{k}=#{export(v)}"
			end
		end

		def ch_ruby(ruby_root=:system)
			#unlike chruby.sh we don't tweak gem paths here.
			#to install localised gems just use 'gem install --user'
			#the Gem.default_dir, Gem.user_dir of the new ruby will be
			#automatically available if GEM_PATH is empty or ends with a ':'.
			#Otherwise assume that the user does not want to modify it.
			if ruby_root==:system
				#reset
				@path=remove_on_path(bin_dir(@ruby_root), @path) if @ruby_root
				@ruby_root=nil
			else
				@ruby_root=ruby_root
				@path=add_to_path(bin_dir(@ruby_root), @path)
			end
		end

	end
end

if __FILE__ == $0
	gem=DR::ChRuby.new
	require 'optparse'
	OptionParser.new do |opt|
		opt.banner="Modify gem env variables"
		opt.on("--infos", "Show current gem dirs") do |v|
			return puts gem.class.gem_infos
		end
		opt.on("--push gem_dir", "Push a new gem dir") do |v|
			gem.push_gem_dir(v)
			# push $GEM_HOME to $GEM_PATH and set $GEM_HOME=v
		end
		opt.on("--pop", "Pop gem dir") do |v|
			gem.pop_gem_dir
			# pop $GEM_PATH to $GEM_HOME
		end
		opt.on("--push-global global_gem_dir", "Push a new dir containing localised gems dir") do |v|
			gem.push_global_gem_dir(v)
			# push $GEM_HOME to $GEM_PATH and set $GEM_HOME=v/ruby_engine/ruby_version
		end
		opt.on("--ruby", "=[RUBY]", "Change ruby") do |v|
			# add to $PATH and set $RUBY_ROOT
			v=:system if v==true #remove $RUBY_ROOT from PATH and clear it
			gem.ch_ruby(v)
		end
	end.parse!
	if ARGV.empty?
		gem.export_gem_env
	else
		args=ARGV
		args=[ENV['SHELL'] || "/bin/sh"] if args==['shell']
		require 'shellwords'
		puts "# Executing #{args.shelljoin}"
		exec(gem.export_env, *args)
	end
end
