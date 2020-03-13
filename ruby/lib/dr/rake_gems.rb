# rake task to get gem version
require 'rubygems/tasks'
require 'dr/base/utils'
require 'dr/ruby_ext/core_ext'

module Gem
  class Tasks
    class Project
      # monkey patch to detect .git file pseudo symlinks
      alias old_initialize initialize
      def initialize(root=Dir.pwd)
        old_initialize(root)
                @scm, _ = SCM_DIRS.find do |scm,dir|
                    # File.directory?(File.join(@root,dir))
                    File.file?(File.join(@root,dir))
                  end
      end
    end

    class Task < Rake::TaskLib
      # not used
      def capture(command,*arguments)
        require 'shellwords'
        show_command = [command, *arguments].join(' ')
        debug show_command

        r=`#{[command,*arguments].shelljoin}`
        unless $?.success?
          error "Command failed: #{show_command}"
          abort
        end
        return r
      end
    end

    module SCM
      class Tag < Task
        def version(name=nil)
          version_tag(@project.gemspec(name).version)
        end
      end
    end
  end

  class Tasks
    module TaskHelper
      def version(name=nil)
        @project.gemspec(name).version
      end

      def multi_task(prefix,names, definee: prefix)
        task definee => names.map { |name| "#{prefix}:#{name}" }
      end
      def gemspec_tasks(name, definee: name)
        multi_task name, @project.gemspecs.keys, definee: definee
      end
      def project_name(name=nil)
        gemspec=@project.gemspec(name)
        gemspec.metadata.fetch('project_name', DR::Utils.to_camel_case(gemspec.name))
      end
    end
    class Task
      prepend TaskHelper
    end
  end

  class MyTasks < Tasks

    attr_reader :version, :debug, :bump_version, :copyright, :changelog, :prepare, :push_github, :infos

    def initialize(options={})
      default_options={sign: {checksum: true, pgp: true}}
      options = default_options.deep_merge(options)
      super(options.merge(console: false, release: false, push: false), &nil) #&nil to not pass the block to super; console: false to not invoke Console.new (we want MyConsole)

      @version=(Version.new if options.fetch(:version,true))
      @console = (MyConsole.new if options.fetch(:console,true))
      @push = (MyPush.new if options.fetch(:push,true))
      @debug=(Debug.new if options.fetch(:debug,true))
      @bump_version=(BumpVersion.new if options.fetch(:bump_version,true))
      @copyright=(Copyright.new if options.fetch(:copyright,true))
      @changelog=(Changelog.new if options.fetch(:changelog,true))
      @prepare=(Prepare.new if options.fetch(:prepare,true))
      @push_github = (MyPush.new(host: "https://rubygems.pkg.github.com/damienrobert", hostname: "github") if options.fetch(:push_github,true))
      @infos = (Infos.new if options.fetch(:infos,true))
      # needs to be at end so that tasks are defined
      @release = (MyRelease.new if options.fetch(:release,true))
      klass=self
      instance_variables.each do |i|
        instance_variable_get(i).define_singleton_method(:tasks) do
          klass
        end
      end

      yield self if block_given?
    end

    class Debug < Task
      attr_accessor :command

      def initialize(options={})
        @command = options.fetch(:command, nil)
        super()
        yield self if block_given?
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

    class Infos < Task
      def initialize(options={})
        super()
        yield self if block_given?
        define
      end

      # Defines the `version` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :infos do
            task(name) { info(name) }
          end
        end

        desc "Get infos"
        gemspec_tasks :infos
        desc "Get release"
        task "infos:releases" do
          system("git --no-pager tag -l 'v*'")
        end
      end

      def info(name=nil)
        gemspec = @project.gemspec(name)
        r=""
        name=gemspec.name
        version=gemspec.version
        # project=gemspec.metadata.fetch('project_name', nil)
        project=project_name(name)
        r="#{name} (#{version})"
        r+=" [#{project}]" if project
        puts r
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
            task(name) { get_version(name) }
          end
          namespace "version:raw" do
            task(name) { get_version(name, raw: true) }
          end
        end

        desc "Get current version"
        task :version => "version:#{@project.primary_gemspec}"
        desc "Get current version (via a ruby call)"
        task "version:raw" => "version:raw:#{@project.primary_gemspec}"
        desc "Get all versions"
        gemspec_tasks :version, definee: :versions
      end

      def get_version(name=nil, raw: false)
        gemspec = @project.gemspec(name)

        if raw
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

          # project_name  = gemspec.metadata.fetch('project_name', DR::Utils.to_camel_case(@project.name))
          project_name  = project_name(name)

          arguments.push('-e', "puts #{project_name}::VERSION")

          #v=capture(*arguments); puts v; return v
          return run(*arguments)
        else
          puts version(name)
        end
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
          namespace "version:bump" do
            task(name, [:version]) do |t, args|
              # args.with_defaults(:version => nil) #nil is already the default
              args.with_defaults(:version => true)
              bump_version(name, bump_version: args[:version])
            end
          end
        end

        desc "Bump version"
        task "version:bump", [:version] => "version:bump:#{@project.primary_gemspec}"
      end

      def bump_version(name=nil, bump_version: nil)
        require 'pathname'
        gemspec = @project.gemspec(name)
        version_file=gemspec.files.find do |f|
          Pathname.new(f).basename.to_s=="version.rb"
        end
        if version_file
          file=Pathname.new(version_file)
          content=file.read
          content.match(/^\s*VERSION\s*=\s*['"](.*)['"]/) do |m|
            version=m[1]
            if bump_version == :minor or bump_version == "minor"
              bump=bump_version
              version=Gem::Version.new(version)
              # version.bump
              # Grmpf => reimplement the code to not remove the minor version
              # Here we bump the minor minor version
              segments = version.segments
              segments.pop while segments.any? { |s| String === s }
              #segments.pop if segments.size > 1
              segments[-1] = segments[-1].succ
              bump= Gem::Version.new segments.join(".")
            elsif bump_version == "false" or bump_version == "no"
              bump=version
            elsif bump_version.is_a?(String)
              bump = bump_version
            elsif version
              version=Gem::Version.new(version)
              # Here we bump the minor version, but add back the minor minor version
              bump=version.bump
              segments=bump.segments + [0]
              bump= Gem::Version.new segments.join(".")
            else
              bump=version
            end
            puts "Version: #{version} => #{bump}"
            new_content=content.sub(/^(\s*VERSION\s*=\s*['"]).*(['"])/, "\\1#{bump}\\2")
            file.write(new_content)
            gemspec.version=bump #don't forget to update the gemspec
          end
        end
      end

    end

    # same as console, but do not run bundler if called via console:raw
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

    class Copyright < Task
      DEFAULT_NAME="Damien Robert"
      attr_accessor :options

      def initialize(options={})
        default_options={ name: DEFAULT_NAME, verbose: :full, year: true }
        @options = default_options.merge(options)
        super()
        yield self if block_given?
        define
      end

      # Defines the `copyright` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :copyright do
            task(name) { copyright(name, bump: false) }
          end
          namespace "copyright:bump" do
            task(name) { copyright(name, bump: true) }
          end
        end

        desc "Get copyright"
        gemspec_tasks :copyright
        # task :copyright => "copyright:#{@project.primary_gemspec}"
        desc "Bump copyright"
        gemspec_tasks "copyright:bump"
        # task "copyright:bump" => "copyright:bump:#{@project.primary_gemspec}"
      end

      def copyright(name=nil, bump: false)
        require 'pathname'
        gemspec = @project.gemspec(name)
        gemspec.files.map do |f|
          if Pathname.new(f).basename.to_s =~ /^LICENSE|README|COPYING/
            require 'dr/misc/copyright'
            DR::Copyright.change_files(f, dryrun: !bump, **options)
          end
        end
      end
    end

    class Changelog < Task
      ChangeLogFile="ChangeLog.md"
      attr_accessor :changelog_file
      attr_accessor :changelog_options

      def initialize(options={})
        @changelog_file=options[:changelog] || ChangeLogFile
        @changelog_options=options[:cli] || ""
        super()
        yield self if block_given?
        define
      end

      # Defines the `changelog` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :changelog do
            task(name) { changelog(name) }
          end
        end

        desc "Update changelog"
        task :changelog => "changelog:#{@project.primary_gemspec}"
      end

      def changelog(name=nil)
        version=self.tasks.scm[:tag].version
        # require 'pry'; binding.pry
        tag=`git tag -l #{version}`
        if !tag.empty?
          diff_changelog(name)
        else
          system("git tag #{version}")
          diff_changelog(name)
          system("git tag -d #{version}")
        end
      end

      def diff_changelog(name)
        require 'tempfile'
        require 'pathname'
        gemspec = @project.gemspec(name)
        file=gemspec.files.find do |f|
          Pathname.new(f).basename.to_s == changelog_file
        end || changelog_file
        changelog=`git my changelog -- #{@changelog_options}`
        t=Tempfile.new("changelog")
        t << changelog
        t.close
        system("vimdiff #{file} #{t.path}")
      ensure
        t.delete
      end
    end

    class Prepare < Task

      def initialize
        super
        define
      end

      # Defines the `prepare` task.
      def define
        @project.gemspecs.each_key do |name|
          namespace :prepare do
            task name, [:version] => [ :test, "version:bump:#{name}", "copyright:bump:#{name}", "changelog:#{name}" ]
          end
        end

        desc "Prepare release\n This calls version:bump[version], copyright:bump, changelog"
        #task :prepare, [:version] => "prepare:#{@project.primary_gemspec}"
        task :prepare, [:version] => ["prepare:#{@project.primary_gemspec}", "prepare:commit"]

        desc "Commit with 'Bump version and update ChangeLog.md'"
        task 'prepare:commit' do
          version=self.tasks.scm[:tag].version
          system("git commit -aem 'Bump to version #{version} and update ChangeLog.md'")
        end
      end
    end

    class MyRelease < Task
      def initialize(options={})
        super()
        yield self if block_given?
        define
      end

      def define
        @project.gemspecs.each_key do |name|
          task :release => [
            "build:#{name}",
            'scm:tag',
            'scm:push',
            "push:#{name}",
            "push:github:#{name}",
            "sign:#{name}"
          ].select { |name| task?(name) }
        end

        desc "Performs a release"
        task :release => [
          :build,
          'scm:tag',
          'scm:push',
          :push,
          'push:github',
          :sign
        ].select { |name| task?(name) }
      end
    end

    class MyPush < Push
      attr_accessor :host, :key, :hostname, :taskname

      def initialize(options={})
        @hostname = options[:hostname] || :rubygems
        if @hostname != :rubygems
          @taskname = options[:taskname] || "push:#{@hostname}"
          @key = options[:key] || @hostname
        else
          @taskname = options[:taskname] || "push"
          @key = options[:key]
        end
        super
      end

      def define
        task :validate

        namespace @taskname do
          @project.builds.each do |build,packages|
            path = packages[:gem]

            task build => [:validate, path] do
              status "Pushing #{File.basename(path)} to #{@hostname} ..."
              push(path)
            end
          end
        end

        desc "Push to #{@hostname}"
        gemspec_tasks @taskname

        # backwards compatibility for Hoe
        task :publish => :push if @hostname == :rubygems
      end

      def push(path)
        arguments = ['gem', 'push', path]
        arguments.push('--host', @host) if @host
        arguments.push('--key', @key) if @key

        return run(*arguments)
      end
    end
  end
end
