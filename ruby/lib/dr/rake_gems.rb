# rake task to get gem version
require 'rubygems/tasks'
require 'dr/base/utils'
require 'dr/ruby_ext/core_ext'

module Gem
  class MyTasks < Tasks

    attr_reader :version
    attr_reader :myconsole
    attr_reader :debug

    def initialize(options={})
      default_options={sign: {checksum: true, pgp: true}}
      options = default_options.deep_merge(options)
      super(options.merge(console: false), &nil) #&nil to not pass the block to super; console: false to not invoke Console.new (we want MyConsole)

      @version=(Version.new if options.fetch(:version,true))
      @console = (MyConsole.new if options.fetch(:console,true))
      @debug=(Debug.new if options.fetch(:debug,true))
      @bump_version=(BumpVersion.new if options.fetch(:bump_version,true))

      yield self if block_given?
    end

    class Debug < Task
      attr_accessor :command

      def initialize(options={})
        @command = options.fetch(:command, nil)
        super()
        define
      end

      def define
        desc "Debug my rake tasks"
        task(:debug) { debug }
      end

      def debug
        if @command
          eval(@command)
        else
          require 'pry'; binding.pry
          # @project
        end
      end
    end

    class Version < Task
      DEFAULT_COMMAND = ("ruby")

      attr_accessor :command
      attr_accessor :options

      def initialize(options={})
        @command = options.fetch(:command,DEFAULT_COMMAND)
        @options = Array(options[:options])
        super()
        yield self if block_given?
        define
      end

      # Defines the `version` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :version do
            task(name) { version(name) }
          end
        end

        desc "Get current version"
        task :version => "version:#{@project.primary_gemspec}"
      end

      def version(name=nil)
        gemspec = @project.gemspec(name)

        require_paths = gemspec.require_paths
        require_file  = gemspec.metadata.fetch('require_file', gemspec.name.gsub('-',File::SEPARATOR))

        arguments = [@command]

        # add -I options for lib/ or ext/ directories
        arguments.push(*require_paths.map { |dir| "-I#{dir}" })

        # add a -rrubygems to explicitly load rubygems on Ruby 1.8
        arguments.push('-rrubygems') if RUBY_VERSION < '1.9'

        # add an -r option to require the library
        arguments.push('-r' + require_file)

        # push on additional options
        arguments.push(*@options)

        project_name  = gemspec.metadata.fetch('project_name', DR::Utils.to_camel_case(@project.name))

        arguments.push('-e', "puts #{project_name}::VERSION")

        return run(*arguments)
      end

    end

    class BumpVersion < Task

      def initialize
        super
        yield self if block_given?
        define
      end

      # Defines the `version` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :bump_version do
            task(name) { bump_version(name) }
          end
        end

        desc "Bump version"
        task :bump_version => "bump_version:#{@project.primary_gemspec}"
      end

      def bump_version(name=nil)
        require 'pathname'
        gemspec = @project.gemspec(name)
        version_file=gemspec.files.find do |f|
          Pathname.new(f).basename.to_s=="version.rb"
        end
        if version_file
          file=Pathname.new(version_file)
          content=file.read
          content.match(/^\s*VERSION\s*=\s*['"](.*)['"]/) do |m|
            p m
            version=m[1]
            bump=Gem::Version.new(version).bump
            new_content=content.sub(/^(\s*VERSION\s*=\s*['"]).*(['"])/, "\\1#{bump}\\2")
            file.write(new_content)
          end
        end
      end

    end

    # same as console, but do not run bundler
    class MyConsole < Task #< Console
      DEFAULT_CONSOLE = 'pry'
      DEFAULT_COMMAND = (ENV['RUBYCONSOLE'] || DEFAULT_CONSOLE)

      attr_accessor :command
      attr_accessor :options

      def initialize(options={})
        super()

        @command = options.fetch(:command,DEFAULT_COMMAND)
        @options = Array(options[:options])

        yield self if block_given?
        define
      end

      def define
        @project.gemspecs.each_key do |name|
          namespace :console do
            task(name) { console(name) }
            namespace :raw do
              task(name) { console(name, raw: true) }
            end
          end
        end

        desc "Spawns an Interactive Ruby Console"
        task :console => "console:#{@project.primary_gemspec}"
        desc "Spawns a Raw (=without bundler) Interactive Ruby Console"
        namespace :console do
          task :raw => "console:raw:#{@project.primary_gemspec}"
        end
      end

      def console(name=nil, raw: false)
        gemspec = @project.gemspec(name)

        require_paths = gemspec.require_paths
        require_file  = gemspec.metadata.fetch('require_file', gemspec.name.gsub('-',File::SEPARATOR))

        arguments = [@command]

        # add -I options for lib/ or ext/ directories
        arguments.push(*require_paths.map { |dir| "-I#{dir}" })

        # add a -rrubygems to explicitly load rubygems on Ruby 1.8
        arguments.push('-rrubygems') if RUBY_VERSION < '1.9'

        # add an -r option to require the library
        arguments.push('-r' + require_file)

        # push on additional options
        arguments.push(*@options)

        if @project.bundler? and !raw
          # run under `bundle exec`
          arguments.unshift('bundle', 'exec')
        end

        return run(*arguments)
      end
    end
  end
end
