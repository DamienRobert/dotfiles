vim: foldmethod=expr ft=markdownlight
gvim -p lib/**/*.rb test/**/*.rb

# Default bundled gems:

~rubysyslib/gems $ ls 2.5.0/specifications/default
bigdecimal-1.3.4.gemspec  fiddle-1.0.0.gemspec      psych-3.0.2.gemspec
cmath-1.0.0.gemspec       fileutils-1.0.2.gemspec   scanf-1.0.0.gemspec
csv-1.0.0.gemspec         gdbm-2.0.0.gemspec        sdbm-1.0.0.gemspec
date-1.0.0.gemspec        io-console-0.4.6.gemspec  stringio-0.0.1.gemspec
dbm-1.0.0.gemspec         ipaddr-1.2.0.gemspec      strscan-1.0.0.gemspec
etc-1.0.0.gemspec         json-2.1.0.gemspec        webrick-1.4.2.gemspec
fcntl-1.0.0.gemspec       openssl-2.1.0.gemspec     zlib-1.0.0.gemspec

# Gems
## Gems versions
  gem 'rake', '>= 1.1.a', '< 2' #specify which version to use before 'require'
Version should be from Gem::Requirement, it can use the operators "=, !=, >, <, >=, <=, ~>"

## Gemrc
Prevent installing documentation: 'gem: --no-document'

From http://stackoverflow.com/questions/1381725/how-to-make-no-ri-no-rdoc-the-default-for-gem-install/7662245#7662245:
'gem: --no-document' or 'gem: --document=rdoc' [http://guides.rubygems.org/command-reference/]
(To remove doc just remove ~gemdir/doc/*, to reinstall doc just do 'gem rdoc --all' / 'gem rdoc --all --overwrite --rdoc --ri')

## Installing Gems
--user-install:
  gem install --user [ou --user-install] installe les gems dans ~/.gem/ruby/2.2.0/ (la version de ruby est localisée)
  Attention, dans archlinux /etc/gemrc rajoute cette option par défaut
  => mettre dans .gemrc: 'gem: --no-user-install'

--env-shebang:
  Gems installed as a non-root user via `gem install` will be installed into
  `~/.gem/$ruby/X.Y.Z`.  By default, RubyGems will use the absolute path to the
  currently selected ruby for the shebang of any binstubs it generates.  In some
  cases, this path may contain extra version information (e.g.
  `ruby-2.0.0-p451`).  To mitigate potential problems when removing rubies, you
  can force RubyGems to generate binstubs with shebangs that will search for
  ruby in your `$PATH` by using `gem install --env-shebang` (or the equivalent
  short option `-E`).  This parameter can also be added to your gemrc file.

## Gems paths
Gem.default_dir => "/usr/lib/ruby/gems/2.2.0" #used if GEM_HOME not set
Gem.default_path => ["/home/dams/.gem/ruby/2.2.0", "/usr/lib/ruby/gems/2.2.0"] #used if GEM_PATHS is not set. Update: I did a pr so that it is used also when GEM_PATHS ends with ':'
Gem.dir => "/home/dams/opt/pkgmgr/gems" #GEM_HOME
Gem.path => ["/home/dams/.gem/ruby/2.2.0", "/usr/lib/ruby/gems/2.2.0", "/home/dams/opt/pkgmgr/gems"]
Gem.user_dir => "/home/dams/.gem/ruby/2.2.0" #used for --user [not configuratble]
Gem.bindir => "/home/dams/opt/pkgmgr/gems/bin" #for --bindir
Gem.spec_cache_dir => "/home/dams/.gem/specs" #GEM_SPEC_CACHE
Gem.default_spec_cache_dir

See the paths: gem env, or gem env gempath
[Note: the advantage of gem install --user is that it install to a
repository localized with ruby version, in contrast of GEM_HOME]

Get the user path via shell (from chruby.sh and gem_home.sh):
~~~ sh
  eval "$(ruby - <<EOF
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'};"
puts "ruby_version=#{RUBY_VERSION};"
EOF
)"
  gem_dir="$HOME/.gem/$ruby_engine/$ruby_version"
  export GEM_HOME="$gem_dir"
  export GEM_PATH="$gem_dir${GEM_PATH:+:}$GEM_PATH"
  export PATH="$gem_dir/bin${PATH:+:}$PATH"
~~~

# Gem creation / Gem plugins
## Rake tasks
La gem rubygems-tasks permet de faire des Rakefile avec:
  require 'rubygems/tasks'
  Gem::Tasks.new(sign: {checksum: true, pgp: true},
                 build: {tar: true}, scm: {status: false})
ce qui active
  rake build build:gem build:tar
       scm scm:status scm:push scm:tag
       sign sign:checksum sign:pgp
       console install push release

Notes: 
- par défaut build:tar et sign:checksum, sign:pgp ne sont pas activés
- scm:status est activé par défaut mais du coup il refuse de faire quoi que ce soit si le repo est dirty. En effet, il a pour alias :validate, et la task :validate est invoquée par push, build, scm:push, scm:tag
- sign:pgp signe le .gem et le .tar s'il est construit
- console lance $RUBYCONSOLE dans l'env et sinon irb
- install installe la gem
- push pushe sur rubygems
- release fait build, scm:tag, scm:push, push, sign (pour les tasks qui sont activées)

En détail: 
tar -> run 'tar', 'czf', path, *gemspec.files
gem -> Gem::Package.build(gemspec) = gem build package.gemspec
sign -> run 'gpg', '--sign', '--detach-sign', '--armor', path
push -> gem push package.gem

=> "dr/rake_gems"
définit les rubygems-tasks avec d'autres défauts:
{sign: {checksum: true, pgp: true}}
définit un console:raw et aussi :version, :debug, :bump_version

Other rake tasks [ore and rubygems-tasks seems the best ones]:
- rubygems/package_task: http://docs.ruby-lang.org/en/2.1.0/Gem/PackageTask.html
[just provide a 'package' task which together with 'gem build' to build the
gem can also provide tar or zip of the files of the gem]
Note: - rubygems-tasks 'build' task calls Gem::Package.build(gemspec)
       so it uses the rubygems build task, just like Gem/PackageTask
      - the Gem::PackageTask 'package' task hardlink the files in
        pkg/foo-version before creating the gems from it; it does not use
        the files in the current directory directly

- bundler/gem_tasks:
bundler gem ploum -> scaffold a gem
rake -T
rake build    # Build ploum-0.1.0.gem into the pkg directory
rake install  # Build and install ploum-0.1.0.gem into system gems
rake release  # Create tag v0.1.0 and build and push ploum-0.1.0.gem to Rub...

## Ore/Mine
[une alternative à 'ore' est 'gemsmith': https://github.com/bkuhlmann/gemsmith]
Pour créer un dossier pour la gem:
 oremine monprojet --bin --github-actions

Note: J'ai configuré ~/.ore pour avoir par défaut
  --default, qui active (cf default/template.ym):
  --markdown --gemspec_yml --git --minitest --rubygems_taks --yard
  and some custom templates
  (=> base, bundler_light, gem_badge)
    - bundler_light = comme bundler, mais sans la dépendance à bundler dans development_dependencies

Try to update a template: [--no-scm]
THOR_MERGE=meld oremine --no-default --github-actions .

Variables disponibles dans les templates (cf generator.rb):
@root, @project_dir, @name, @scm,
@modules, @module_depth, @module,
@namespace, @namespace_dirs, @namespace_path, @namespace_dir
@author, @email, @safe_email, @homepage, @uri, @bug_tracker
@markup, @markup_ext, @date, @year, @month, @day
@ignore, @dependencies, @development_dependencies
@generated_dirs, @generated_files

My templates: ~/.ore/templates
Ore default templates: ~gems/ore/data/ore/templates
  apache/   code_climate/      git/   minitest/  rubygems_tasks/
  bin/      gem/               gpl/   mit/       test_unit/
  bsd/      gem_package_task/  hg/    rdoc/      travis/
  bundler/  gemspec_yml/       lgpl/  rspec/     yard/

Note that in templates, *.erb are generated, _*.erg are partial templates
(available via include), *.md are read only if markup=markdown (default)

Used partial templates:
:gemfile_prelude, :gemfile, :gemfile_development, :badges, :tasks, :gemspec
Deps uses the variables @dependencies, @development_dependencies (used in
the gemspec), but we can add extra deps in the Gemfil by using the partial
templates _gemfile_*

## Push on github
hub init -g
hub create -d 'description' #or hub create "toto" -d "ploum"
git push
git push --tags

## Summary for a new gem

GEM=gem_name
mine ~rubygems/$GEM
cd ~rubygems/$GEM
 # vi README.md gemspec.yml
 # (cd ~mine; git submodule add ./ruby/gems/$GEM ruby/gems/$GEM)
 # (cd ~mine; git subadd ruby/gems/$GEM)

ruby <<EOS
require 'shellwords'
require 'yaml'
gemspec = YAML.load_file('gemspec.yml')
name=gemspec['name']
summary=gemspec['summary']
puts "hub init -g"
puts ['hub', 'create', name, '-d', summary].shelljoin
EOS

git remote rename origin github
git push --set-upstream github master

## Bumping a gem version
rake prepare # rake "prepare[minor]" # rake "prepare[no]" 
rake release #this will retag with a signed annotated tag

## Gem plugins:
https://github.com/rubygems/guides/blob/gh-pages/plugins.md
- https://github.com/tpope/gem-browse
-> gem edit, gem open, gem clone, gem browse
- https://github.com/tpope/gem-ctags
-> automatic ctags invocation for the gems
Manually: gem ctags

# Web services
(see also [git/github] for badges)

## travis:
- https://travis-ci.org/profile/DamienRobert
- http://docs.travis-ci.com/user/getting-started/
- http://docs.travis-ci.com/user/languages/ruby/

.travis.yaml:
  language: ruby
  rvm:
    - 2.1.0
    - jruby-18mode

Ruby version available:
https://docs.travis-ci.com/user/languages/ruby/#Supported-Ruby-Versions
Cache: http://rubies.travis-ci.org/

If the ruby version is not dictated by the rvm key as described above, Travis CI will consult .ruby-version in the root of the repository and use the indicated Ruby runtime.
=> install: "bundle install --jobs=3 --retry=3"
If a Gemfile.lock exists in your project's root directory, we add the --deployment flag.
(bundler is called only if travis find a Gemfile)
Override: "install: gem install rails"
=> script: "rake"
Travis CI runs rake by default to execute your tests. Please note that you need to add rake to your Gemfile (adding it to the :test group should be sufficient).
Override: "script: rake test"

## Code climate

### Configure with .codeclimate.yml
Previously, without a .codeclimate.yml, codeclimate would generate it
automatically (Autogenerated default config: https://lima.codeclimate.com/repos/58aacbffcc60c5007500023a/analysis_config) via a patch (Patch: https://lima.codeclimate.com/snapshots/58aacc00aa5c360001003e25/inferred_config.patch
    ---
    engines:
      duplication:
        enabled: true
        config:
          languages:
          - ruby
          - javascript
          - python
          - php
      fixme:
        enabled: true
      rubocop:
        enabled: true
    ratings:
      paths:
      - "**.inc"
      - "**.js"
      - "**.jsx"
      - "**.module"
      - "**.php"
      - "**.py"
      - "**.rb"
    exclude_paths:
    - test/
+ autogenerated rubycop config (cf below))

Now the config can be configured on the web app (one can still generate a
.codeclimate.yml but the version has changed, cf https://docs.codeclimate.com/docs/advanced-configuration.
Example to enable all 10 checks (on by default)+ add some the rubocop plugin:
~~~
version: "2"
checks:
  argument-count:
    enabled: true
     config:
     	threshold: 4
  complex-logic:
    enabled: true
     config:
     	threshold: 4
  file-lines:
    enabled: true
     config:
     	threshold: 250
  method-complexity:
    enabled: true
     config:
     	threshold: 5
  method-count:
    enabled: true
     config:
     	threshold: 20
  method-lines:
    enabled: true
     config:
     	threshold: 25
  nested-control-flow:
    enabled: true
     config:
     	threshold: 4
  return-statements:
    enabled: true
     config:
     	threshold: 4
  similar-code:
    enabled: true
     config:
     	threshold: #language-specific defaults. overrides affect all languages.
  identical-code:
    enabled: true
     config:
     	threshold: #language-specific defaults. overrides affect all languages.
plugins:
 rubocop:
  enabled: true
exclude_patterns:
- "config/
- "db/"
- "dist/"
- "features/"
- "**/node_modules/"
- "script/"
- "**/spec/"
- "**/test/"
- "**/tests/"
- "**/vendor/"
- "**/*.d.ts"
~~~

### Code climate plugins: 
- https://docs.codeclimate.com/docs/fixme
- https://docs.codeclimate.com/docs/duplication
- https://docs.codeclimate.com/docs/rubocop [ruby specific]
  Code climate autogenerates a .codeclimate.yml (and a .rubocop.yml) when none is present. The rubocop config is different from the default one:
  Rubocop default config: https://github.com/bbatsov/rubocop/blob/master/config/default.yml
  Code climate default rubocop config: https://github.com/codeclimate/codeclimate/blob/master/config/rubocop/.rubocop.yml

- Coverage:
In v1 climate used to run the engines 'duplication', 'fixme', and
'rubocop'. To also get coverage, use the codeclimate-test-reporter gem:
https://docs.codeclimate.com/docs/test-coverage-ruby
https://github.com/codeclimate/ruby-test-reporter

- Add to test/helper.rb:
  ~~~
  require "simplecov"
  SimpleCov.start
  ~~~
- Send the coverage result to code climate:
  `CODECLIMATE_REPO_TOKEN=<token> bundle exec codeclimate-test-reporter`

Integration with travis: https://docs.codeclimate.com/docs/travis-ci-ruby-test-coverage
- Gemfile
  ~~~
  group :test do
    gem "simplecov"
    gem "codeclimate-test-reporter", "~> 1.0.0"
  end
  ~~~
- .travis.yml:
  ~~~
  addons:
    code_climate:
      repo_token: <token>
  after_success:
    - bundle exec codeclimate-test-reporter
  ~~~

## Codecov
Using codecov.io rather than code climate for coverage.
codecov.yml: https://docs.codecov.io/docs/codecov-yaml

https://github.com/codecov/example-ruby
- Add to your Gemfile
  `gem 'codecov', :require => false, :group => :test`
- Add to the top of your tests/helper.rb file
  ~~~
  require 'simplecov'; SimpleCov.start
  require 'codecov'; SimpleCov.formatter = SimpleCov::Formatter::Codecov
  ~~~
- In your CI Environment Variables (not needed for https://travis-ci.org/)
CODECOV_TOKEN=<your repo token>

## Rubocop
http://rubocop.readthedocs.io/en/latest/
http://rubocop.readthedocs.io/en/latest/configuration/

Most cops are enabled by default. Some cops, configured in ~gems/rubocop-*/config/disabled.yml, are disabled by default. The cop enabling process can be altered by setting DisabledByDefault to true. 
    AllCops:
      DisabledByDefault: true
All cops are then disabled by default, and only cops appearing in user configuration files are enabled. 'Enabled: true' does not have to be set for cops in user configuration. They will be enabled anyway.
[cf config_loader.rb:merge_with_default:
  # Merges the given configuration with the default one. If
  # AllCops:DisabledByDefault is true, it changes the Enabled params so
  # that only cops from user configuration are enabled. If
  # AllCops::EnabledByDefault is true, it changes the Enabled params so
  # that only cops explicitly disabled in user configuration are disabled.]

See ~gems/rubocop-*/config/{enabled.yml,default.yml} for infos on cops.

Generate a rubocop config file masking all errors for a project:
$ rubocop --auto-gen-config
-> Created .rubocop_todo.yml.
   Run `rubocop --config .rubocop_todo.yml`, or add `inherit_from: .rubocop_todo.yml` in a .rubocop.yml file.

## Inch

- .inch.yml: https://inch-ci.org/help/config_file_yaml
    files:
      # define files included in the analysis (defaults to ["{app,lib}/**/*.rb"])
      included:
        - plugins/**/*.rb
      # define files excluded from the analysis (defaults to [])
      excluded:
        - plugins/vendor/sparkr/sparkr.rb

# Bundler

(gemsets come from rvm; rbenv version: https://github.com/jf/rbenv-gemset)
bundler:
- http://bundler.io/rubygems.html
- http://rakeroutes.com/blog/how-to-use-bundler-instead-of-rvm-gemsets/
- http://sdqali.in/blog/2013/09/12/managing-gemsets-in-rbenv/
[Note: bundler install the gems with --nodocument]
Very nice guide here: https://gist.github.com/glv/6004197

bundler [install]/update/package/exec/config/help

- bundle init #=> create Gemfile
Add 'gemspec' to the Gemfile to add the gems from the gemspec

Gemfile: http://bundler.io/gemfile.html
gem 'nokogiri'
gem 'rails', '3.0.0.beta3'
gem 'rack',  '>=1.0'
gem 'thin',  '~>1.1'
Can be grouped: http://bundler.io/groups.html

- bundle config:
bundle config path .bundle #for instance

.bundle/config, ~/.bundle/config
  BUNDLE_PATH: .bundle
  BUNDLE_DISABLE_SHARED_GEMS: '1'

BUNDLE_PATH: where to look for the gems (default to $GEM_HOME)
BUNDLE_DISABLE_SHARED_GEMS: 
~~~ ruby
  #from lib/bundler.rb:
  if settings[:disable_shared_gems]
    # this needs to be empty string to cause
    # PathSupport.split_gem_path to only load up the
    # Bundler --path setting as the GEM_PATH.
    env["GEM_PATH"] = ""
  elsif blank_home || Bundler.rubygems.gem_dir != bundle_path.to_s
    possibles = [Bundler.rubygems.gem_dir, Bundler.rubygems.gem_path]
    paths = possibles.flatten.compact.uniq.reject(&:empty?)
    env["GEM_PATH"] = paths.join(File::PATH_SEPARATOR)
  end
~~~
Note: 'bundle install/check --path ...' automatically set 'disable_shared_gems'
[even if the path was set by bundle config and not passed explicitly :-(]
=> Solution: only use bundle update (or use 'gem_home')
[Update: it seems this changed? The --path option does not add
BUNDLE_DISABLE_SHARED_GEMS anymore, and the code above is not there anymore]

- bundle install [--path vendor/bundle]
  Install the gems: http://bundler.io/bundle_install.html
-> creates Gemfile.lock
   .bundle/config (=>next bundle call will remember the install path)
   vendor/bundle

In development,  you  can modify your Gemfile(5) and re-run bundle
install to *conservatively update* your Gemfile.lock snapshot.

Install path:
  To configure the install path globally, do
  bundle install --path foo
  bundle install --system [default]
    Install to the system location ($BUNDLE_PATH if set or $GEM_HOME)
    even if the bundle was previously installed somewhere else for this
    application.

Rem: --deployment
  - Gems  are  installed to vendor/bundle not your default system location
  [and gems are not shared, see above]
  - Gemfile.lock must be up to date
  - BUNDLE_FROZEN: "1" (=> bundle update is not allowed)

- bundle update: Update  the  gems specified (all gems, if none are specified), ignoring the previously installed gems specified in the  Gemfile.lock.  In  general, you should use bundle install(1) bundle-install.1.html to install the same exact gems and versions across machines.

- bundle package: put the bundled *.gem in vendor/cache
so that they can be used by bundler when calling bundle install (rather than going to rubygems)

- Via the app use bundler/setup:  http://bundler.io/bundler_setup.html
require 'bundler/setup' #puts the bundler gems "on the load path"
[similar to the setup done by bundle exec]
One can also use Bundler.require to require at once the packages in the
Gemfile, cf http://bundler.io/groups.html

- Run an executable that comes with a gem in your bundle (wrap the exe into
'bundler/setup'):
$ bundle exec rspec spec/models
[rem: one can also use bundle install --binstubs and use the binstubs]

bundle exec modify rubygems so that it only use the gems from the Gemfile
(with the exact same version). If we intalled the gems in a non system
path [ex: ./vendor/], it also change GEM_HOME, and the bin directory:
  - EXECUTABLE DIRECTORY: /tmp/ploum/vendor/ruby/2.2.0/bin
  - GEM PATHS:
     - /tmp/ploum/vendor/ruby/2.2.0

Use bundle binstubs to create binstub that calls 'bunlder/setup'
automatically

Ex: bundle binstubs rake => bin/rake:
~~~ ruby
require "pathname"
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile",
  Pathname.new(__FILE__).realpath)
require "rubygems"
require "bundler/setup"
load Gem.bin_path("rake", "rake")
~~~

- Others: bundle check/show/outdated/console/open/lock/viz/init/gem/platform/clean/doctor

# Ruby installers
## chruby, gem_home
Update: cf ~rubylib/config/ch_ruby.rb which reimplements ost of chruby and
gem_home

* source ~/usr/dist/@ruby/gem_home/share/gem_home/gem_home.sh

gem env:
	$GEM_HOME: /home/dams/opt/pkgmgr/gems
  - GEM PATHS:
     - /home/dams/opt/pkgmgr/gems
     - /home/dams/.gem/ruby/2.2.0
     - /usr/lib/ruby/gems/2.2.0

gem_home .
	=> GEM_HOME: /tmp/mygem/.gem/ruby/2.2.0
And the old GEM_PATH is still there, so installing new gems will be in GEM_HOME, but the old gems are reused!

(there is a bug in gem_home that GEM_HOME is not added to the GEM_PATH, the script considers that GEM_PATH should contain GEM_HOME:)
~~~ sh
eval "$(ruby - <<EOF
puts "ruby_engine=#{defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'};"
puts "ruby_version=#{RUBY_VERSION};"

gem_dir="$PWD/.gem/$ruby_engine/$ruby_version"
[[ "$GEM_HOME" == "$gem_dir" ]] && return
export GEM_HOME="$gem_dir"
export GEM_PATH="$gem_dir${GEM_PATH:+:}$GEM_PATH"
export PATH="$gem_dir/bin${PATH:+:}$PATH"
~~~
=> To use I need to do 'GEM_PATH=$GEM_HOME:$GEM_PATH' before

* source ~/usr/dist/@ruby/chruby/share/chruby/chruby.sh
- List: chruby
When chruby is first loaded by the shell, it will auto-detect Rubies installed in /opt/rubies/ and ~/.rubies/
Custom RUBIES are in RUBIES
RUBIES=(
  /opt/jruby-1.7.0
  "$HOME/src/rubinius"
)
- Select: chruby ruby-2.0.0
          chruby system
- Switch to an arbitrary Ruby on the fly:
$ chruby_use /path/to/ruby
- Run a command under a Ruby with chruby-exec:
$ chruby-exec jruby -- gem update

Ex: RUBIES=(~/opt/packages/ruby-*)
chruby ruby-1.9.3
=> GEM_HOME: /home/dams/.gem/ruby/1.9.3
   GEM_PATH: /home/dams/.gem/ruby/1.9.3:/home/dams/opt/packages/ruby-1.9.3-p392/lib/ruby/gems/1.9.1
   GEM_ROOT: /home/dams/opt/packages/ruby-1.9.3-p392/lib/ruby/gems/1.9.1
   RUBYOPT: "", RUBY_ENGINE: ruby, RUBY_ROOT: /home/dams/opt/packages/ruby-1.9.3-p392, RUBY_VERSION: 1.9.3

* Usefull developement gems to install with new rubies:
gem install minitest pry-byebug pry-rescue pry-stack_explorer pry-self

## ruby-build, ruby-install
* ruby-build
cd ~/usr/dist/@ruby/ruby-build
vcs update
bin/ruby-build -p #check the available versions
VERSION=2.3.0-dev
bin/ruby-build $VERSION ~/opt/packages/ruby-$VERSION

* ruby-install
cd ~/usr/dist/@ruby/ruby-install
ruby-install #list versions
ruby-install ruby #download in ~/src and install in ~/.rubies by default
ruby-install --rubies-dir ~/opt/packages/ ruby $VERSION

# Gem extension
http://guides.rubygems.org/gems-with-extensions/

Gem::Specification.new "my_malloc", "1.0" do |s|
  # [...]
  s.extensions = %w[ext/my_malloc/extconf.rb]
end

According to /usr/lib/ruby/2.3.0/rubygems/ext/builder.rb
Gem::Ext::Builder.make => make clean; make; make install

  def builder_for extension
    case extension
    when /extconf/ then
      Gem::Ext::ExtConfBuilder
      #essentially run extconf.rb (with a custom RbConfig for sitearchdir,
      #sitelibdir) before calling 'make'
    when /configure/ then
      Gem::Ext::ConfigureBuilder
      #runs 'sh ./configure --prefix=...' before calling make
    when /rakefile/i, /mkrf_conf/i then
      @ran_rake = true
      Gem::Ext::RakeBuilder
      #runs "#{rake} RUBYARCHDIR=#{dest_path} RUBYLIBDIR=#{dest_path}"
    when /CMakeLists.txt/ then
      Gem::Ext::CmakeBuilder
  end

The compilation will be done at the gem installation.
To test locally, compile by hand:
  $ cd ext/my_malloc
  $ ruby extconf.rb
  checking for malloc()... yes
  checking for free()... yes
  creating Makefile
  $ make
  compiling my_malloc.c
  linking shared-object my_malloc.bundle
  $ cd ../..
  $ ruby -Ilib:ext -r my_malloc -e "p MyMalloc.new(5).free"
  #<MyMalloc:0x007fed838addb0>

Or to compile via rake use
https://github.com/rake-compiler/rake-compiler

require "rake/extensiontask"
Rake::ExtensionTask.new "my_malloc" do |ext|
  ext.lib_dir = "lib/my_malloc"
end
$ rake compile

Can even compile a 'native' gem:
Rake::ExtensionTask.new('hello_world', spec)
$ rake native gem
