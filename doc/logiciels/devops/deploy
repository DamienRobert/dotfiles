vim: ft=markdownlight fdm=expr

mina
====
[Easy to set up and fast]

https://github.com/mina-deploy/mina
http://nadarei.co/mina/

mina init
#edit config/deploy.rb
mina setup #run once
mina deploy
mina run[ls]

$ mina -T #among others
mina deploy                    # Deploys the current version to the server
mina deploy:cleanup            # Clean up old releases
mina deploy:force_unlock       # Forces a deploy unlock
mina deploy:link_shared_paths  # Links paths set in :shared_paths
mina deploy:rollback           # Rollbacks the latest release
mina git:clone                 # Clones the Git repository to the release path
mina help                      # Show help
mina init                      # Creates a sample config file
mina run[command]              # Runs a command in the server
mina setup                     # Sets up a site
mina ssh                       # Open an ssh session to the server and cd to deploy_to folder

capistrano
==========
[More complete, can handle multiple servers and filtering]

Capistrano extends the Rake DSL with methods specific to running commands on() servers.

cap install
cap production deploy

Tasks
-----

$ cap -T #cf http://capistranorb.com/documentation/getting-started/flow/
cap deploy                         # Deploy a new release
cap deploy:check                   # Check required files and directories exist
cap deploy:check:directories       # Check shared and release directories exist
cap deploy:check:linked_dirs       # Check directories to be linked exist in shared
cap deploy:check:linked_files      # Check files to be linked exist in shared
cap deploy:check:make_linked_dirs  # Check directories of files to be linked exist in shared
cap deploy:cleanup                 # Clean up old releases
cap deploy:cleanup_rollback        # Remove and archive rolled-back release
cap deploy:finished                # Finished
cap deploy:finishing               # Finish the deployment, clean up server(s)
cap deploy:finishing_rollback      # Finish the rollback, clean up server(s)
cap deploy:log_revision            # Log details of the deploy
cap deploy:published               # Published
cap deploy:publishing              # Publish the release
cap deploy:revert_release          # Revert to previous release timestamp
cap deploy:reverted                # Reverted
cap deploy:reverting               # Revert server(s) to previous release
cap deploy:rollback                # Rollback to previous release
cap deploy:set_current_revision    # Place a REVISION file with the current revision SHA in the current release path
cap deploy:started                 # Started
cap deploy:starting                # Start a deployment, make sure server(s) ready
cap deploy:symlink:linked_dirs     # Symlink linked directories
cap deploy:symlink:linked_files    # Symlink linked files
cap deploy:symlink:release         # Symlink release to current
cap deploy:symlink:shared          # Symlink files and directories from shared to release
cap deploy:updated                 # Updated
cap deploy:updating                # Update server(s) by setting up a new release
cap install                        # Install Capistrano, cap install STAGES=staging,production

Add a task:
~~~ ruby
desc "Check that we can access everything"
task :check_write_permissions do
  on roles(:all) do |host|
    if test("[ -w #{fetch(:deploy_to)} ]")
      info "#{fetch(:deploy_to)} is writable on #{host}"
    else
      error "#{fetch(:deploy_to)} is not writable on #{host}"
    end
  end
end
~~~

Example:
~~~ ruby
role :demo, %w{example.com example.org example.net}
task :uptime do
  on roles(:demo), in: :parallel do |host|
    uptime = capture(:uptime)
    puts "#{host.hostname} reports: #{uptime}"
  end
end
~~~

Configuration
-------------

The configuration is in config/deploy.rb (or the specific stage).

* variables
~~~ ruby
set :application, 'MyLittleApplication'
fetch :application
~~~

* servers:

server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value

role :app, %w{deploy@example.com}, my_property: :my_value #shortcut to add several server with `roles: app`

Note that if the server already exist (classified by its hostname and port), this updates its properties. One can get/set the server property via server.fetch, server.fetch.

* http://capistranorb.com/documentation/advanced-features/properties/

One can specify properties for the server via:
server 'name', property: value
role *servers, property: value

Common properties:
    :user - the name of the SSH user for the server
    :password - for the SSH user
    :port - the port number of the SSH daemon on the server
    :roles - an array of rolenames
    :ssh_options - a hash of SSH parameters (see below)
    :primary - a boolean that indicates whether the server should be considered primary or not.

- One can set a role + properties for several servers:
role :redis, %w{ r1.example.com r2.example.com r3.example.com }, redis: { port: 6379, master: false },

Remote commands
---------------

http://capistranorb.com/documentation/advanced-features/remote-file/
http://capistranorb.com/documentation/advanced-features/ssh-kit/

on roles(:app), in: :sequence, wait: 5 do
  within "/opt/sites/example.com" do
    # commands in this block execute in the
    # directory: /opt/sites/example.com
    as :deploy  do
      # commands in this block execute as the "deploy" user.
      with rails_env: :production do
        # commands in this block execute with the environment
        # variable RAILS_ENV=production
        rake   "assets:precompile"
        runner "S3::Sync.notify"
        execute :rails, :runner, 'MyModel.something'
      end
    end
  end
end

SSHKit
------

The on method is from sshkit:
https://github.com/capistrano/sshkit
on(in: :parallel) { ... }
on(in: :sequence, wait: 5) { ... }
on(in: :groups, limit: 2, wait: 5) { ... }
cf [doc/ruby/applications/ssh]

Filter
------

* Property filtering: http://capistranorb.com/documentation/advanced-features/property-filtering/

One can match roles via
- roles(:foo)
- release_roles(...) #filter out roles marked as release: false
- primary(:foo) #output the primary server for role foo (if none is specified then the first in the list)
  These methods return a list of servers

- local roles filters: roles(:all, filter: :active)...
  - :filter, or :select: The value is either a property keyname or a lambda which is called with the server as parameter. The value must return true for the server to be included.
  - :exclude: As above but the value must return false for the server to be included.
  - Any other symbol is taken as a server property name whose value must equal the given value. A lambda will not be called if one is supplied!

~~~ ruby
server 'example1.com', roles: %w{web}, active: true
server 'example2.com', roles: %w{web}
server 'example3.com', roles: %w{app web}, active: true
server 'example4.com', roles: %w{app}, primary: true
server 'example5.com', roles: %w{db}, no_release: true, active: true

task :demo do
  puts "All active release roles: 1,3"
  release_roles(:all, filter: :active).each do |r|
    puts "#{r.hostname}"
  end
  puts "All active roles: 1,3,5"
  roles(:all, active: true).each do |r|
    puts "#{r.hostname}"
  end
  puts "All web and db roles with selected names: 2,3"
  roles(:web, :db, select: ->(s){ s.hostname =~ /[234]/}).each do |r|
    puts "#{r.hostname}"
  end
  puts "All with no active property: 2,4"
  roles(:all, active: nil).each do |r|
    puts "#{r.hostname}"
  end
  puts "All except active: 2,4"
  roles(:all, exclude: :active).each do |r|
    puts "#{r.hostname}"
  end
  puts "All primary: 4"
  roles(:all, select: :primary).each do |r|
    puts "#{r.hostname}"
  end
end
~~~

* https://capistranorb.com/documentation/advanced-features/host-filtering/
HOSTS=server1,server2 cap production deploy
cap --hosts=server1,server2 production deploy
set :filter, :hosts => %w{server1 server2}

* https://capistranorb.com/documentation/advanced-features/role-filtering/
ROLES=app,web cap production deploy
cap --roles=app,web production deploy
set :filter, :roles => %w{app web}

See https://github.com/capistrano/capistrano/commit/5bae7fb40ca59d60a859400ec52c709c7686c387

The external filters (ROLES, --roles, set :filter, :roles =>...)
only apply to commands issued: ie. they restrict the hosts that an `on()`
method will use, the will not affect the `roles()` method. On the other
hand internal filters 'roles(..., filter:...), set :filter, hosts: , roles: ' will always apply.

Structure
----------
├── Capfile
├── config
│   ├── deploy
│   │   ├── production.rb
│   │   └── staging.rb
│   └── deploy.rb
├── lib
│   └── capistrano
│       └── tasks

Capfile: global settings
  lib/capistrano/tasks: custom tasks
deploy.rb: settings for all stages
production.rb: setting for the production stage

Exemple deploy.rb:
  set :application, "my_app_name"
  set :repo_url, "git@example.com:me/my_repo.git"
Exemple deploy/production.rb
  server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
  role :app, %w{deploy@example.com}, my_property: :my_value #shortcut to add several server with `roles: app`

- Capfile:
  require "capistrano/setup"
  require "capistrano/deploy"
  require "capistrano/scm/git"
  install_plugin Capistrano::SCM::Git
  # Load custom tasks from `lib/capistrano/tasks` if you have any defined
  Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
- 'cap' calls Capitrano::Application < Rake::Application
- capistrano/setup.rb: required by Capfile
  Set up a task 'load:defaults' which loads "capistrano/defaults.rb"
  And setup a task 'stage' for each stage in `stages` which
  - set(:stage, stage.to_sym)
  - invoke 'load:defaults'
  - load config/deploy.rb
  - load config/deploy/stage.rb
  - configure_scm
  - I18n.locale = fetch(:locale, :en)
  - configure_backend (sshkit)
  => 'cap production' is a task that setup the necessary variables for future tasks, like 'cap production deploy'
  Load ~/.capfile if it exists

Note: 
- one of the top_level_tasks invoked is ':ensure_stage' which test that
the stage variable is set otherwise abort. This force to call 'cap stage
other_tasks'. This task is called if it is not in 
`tasks_without_stage_dependency=stages + default_tasks[=%w{install}`]
(cf application.rb#top_level_tasks)

- `stages` is discovered by looking at the config/deploy/ dir
One can override this by setting 'set(:stage, "none")' in the Capfile
so that a (dummy) stage is always defined
