vim: ft=markdownlight fdm=expr

Net::SSH
========

~~~ ruby
require 'net/ssh'

Net::SSH.start('host', 'user', password: "password") do |ssh|
  # capture all stderr and stdout output from a remote process
  output = ssh.exec!("hostname")
  puts output

  # capture only stdout matching a particular pattern
  stdout = ""
  ssh.exec!("ls -l /home/jamis") do |channel, stream, data|
    stdout << data if stream == :stdout
  end
  puts stdout

  # run multiple processes in parallel to completion
  ssh.exec "sed ..."
  ssh.exec "awk ..."
  ssh.exec "rm -rf ..."
  ssh.loop

  # open a new channel and configure a minimal set of callbacks, then run
  # the event loop until the channel finishes (closes)
  channel = ssh.open_channel do |ch|
    ch.exec "/usr/local/bin/ruby /path/to/file.rb" do |ch, success|
      raise "could not execute command" unless success

      # "on_data" is called when the process writes something to stdout
      ch.on_data do |c, data|
        $stdout.print data
      end

      # "on_extended_data" is called when the process writes something to stderr
      ch.on_extended_data do |c, type, data|
        $stderr.print data
      end

      ch.on_close { puts "done!" }
    end
  end

  channel.wait

  # forward connections on local port 1234 to port 80 of www.capify.org
  ssh.forward.local(1234, "www.capify.org", 80)
  ssh.loop { true }
end
~~~

http://net-ssh.github.io/net-ssh/Net/SSH.html

This method accepts the following options (all are optional):
    :auth_methods => an array of authentication methods to try
    :bind_address => the IP address on the connecting machine to use in establishing connection. (:bind_address is discarded if :proxy is set.)
    :compression => the compression algorithm to use, or true to use whatever is supported.
    :compression_level => the compression level to use when sending data
    :config => set to true to load the default OpenSSH config files (~/.ssh/config, /etc/ssh_config), or to false to not load them, or to a file-name (or array of file-names) to load those specific configuration files. Defaults to true.
    :encryption => the encryption cipher (or ciphers) to use
    :forward_agent => set to true if you want the SSH agent connection to be forwarded
    :known_hosts => a custom object holding known hosts records. It must implement search_for and add in a similiar manner as KnownHosts.
    :global_known_hosts_file => the location of the global known hosts file. Set to an array if you want to specify multiple global known hosts files. Defaults to %w(/etc/ssh/ssh_known_hosts /etc/ssh/ssh_known_hosts2).
    :hmac => the hmac algorithm (or algorithms) to use
    :host_key => the host key algorithm (or algorithms) to use
    :host_key_alias => the host name to use when looking up or adding a host to a known_hosts dictionary file
    :host_name => the real host name or IP to log into. This is used instead of the host parameter, and is primarily only useful when specified in an SSH configuration file. It lets you specify an “alias”, similarly to adding an entry in /etc/hosts but without needing to modify /etc/hosts.
    :keepalive => set to true to send a keepalive packet to the SSH server when there's no traffic between the SSH server and Net::SSH client for the keepalive_interval seconds. Defaults to false.
    :keepalive_interval => the interval seconds for keepalive. Defaults to 300 seconds.
    :keepalive_maxcount => the maximun number of keepalive packet miss allowed. Defaults to 3
    :kex => the key exchange algorithm (or algorithms) to use
    :keys => an array of file names of private keys to use for publickey and hostbased authentication
    :key_data => an array of strings, with each element of the array being a raw private key in PEM format.
    :keys_only => set to true to use only private keys from keys and key_data parameters, even if ssh-agent offers more identities. This option is intended for situations where ssh-agent offers many different identites.
    :logger => the logger instance to use when logging
    :max_pkt_size => maximum size we tell the other side that is supported per packet. Default is 0x8000 (32768 bytes). Increase to 0x10000 (65536 bytes) for better performance if your SSH server supports it (most do).
    :max_win_size => maximum size we tell the other side that is supported for the window.
    :non_interactive => set to true if your app is non interactive and prefers authentication failure vs password prompt. Non-interactive applications should set it to true to prefer failing a password/etc auth methods vs. asking for password.
    :paranoid => deprecated alias for :verify_host_key
    :passphrase => the passphrase to use when loading a private key (default is nil, for no passphrase)
    :password => the password to use to login
    :port => the port to use when connecting to the remote host
    :properties => a hash of key/value pairs to add to the new connection's properties (see Net::SSH::Connection::Session#properties)
    :proxy => a proxy instance (see Proxy) to use when connecting
    :rekey_blocks_limit => the max number of blocks to process before rekeying
    :rekey_limit => the max number of bytes to process before rekeying
    :rekey_packet_limit => the max number of packets to process before rekeying
    :send_env => an array of local environment variable names to export to the remote environment. Names may be given as String or Regexp.
    :timeout => how long to wait for the initial connection to be made
    :user => the user name to log in as; this overrides the user parameter, and is primarily only useful when provided via an SSH configuration file.
    :remote_user => used for substitution into the '%r' part of a ProxyCommand
    :user_known_hosts_file => the location of the user known hosts file. Set to an array to specify multiple user known hosts files. Defaults to %w(~/.ssh/known_hosts ~/.ssh/known_hosts2).
    :use_agent => Set false to disable the use of ssh-agent. Defaults to true
    :verbose => how verbose to be (Logger verbosity constants, Logger::DEBUG is very verbose, Logger::FATAL is all but silent). Logger::FATAL is the default. The symbols :debug, :info, :warn, :error, and :fatal are also supported and are translated to the corresponding Logger constant.
    :append_all_supported_algorithms => set to true to append all supported algorithms by net-ssh. Was the default behaviour until 2.10
    :number_of_password_prompts => Number of prompts for the password authentication method defaults to 3 set to 0 to disable prompt for password auth method
    :password_prompt => a custom prompt object with ask method. See Net::SSH::Prompt
    :agent_socket_factory => enables the user to pass a lambda/block that will serve as the socket factory
    Net::SSH::start(user,host,agent_socket_factory: ->{ UNIXSocket.open('/foo/bar') })
    example: ->{ UNIXSocket.open('/foo/bar')}
    :verify_host_key => either false, true, :very, or :secure specifying how strict host-key verification should be (in increasing order here). You can also provide an own Object which responds to verify. The argument given to verify is a hash consisting of the :key, the :key_blob, the :fingerprint and the :session. Returning true accepts the host key, returning false declines it and closes the connection.

If user parameter is nil it defaults to USER from ssh_config, or local username

SSHKit
======

* https://github.com/capistrano/sshkit

## Syntax

on(in: :parallel) { ... }
on(in: :sequence, wait: 5) { ... }
on(in: :groups, limit: 2, wait: 5) { ... }

~~~ ruby
on ["foo", "bar"], in: :sequence, wait: 5 do
  within "/opt/sites/example.com" do
    # commands in this block execute in the directory: /opt/sites/example.com
    as :deploy  do
      # commands in this block execute as the "deploy" user.
      with rails_env: :production do
        # commands in this block execute with the environment variable RAILS_ENV=production
        rake   "assets:precompile"
        runner "S3::Sync.notify"
        execute :rails, :runner, 'MyModel.something'
      end
    end
  end
end
~~~

* Environment:
as(user: 'un', group: 'grp') { execute('cmd') } # Executes sudo -u un -- sh -c 'sg grp cmd'
within('/somedir') { execute('cmd') }           # Executes cd /somedir && cmd
with(env_var: 'value') { execute('cmd') }       # Executes ENV_VAR=value cmd
SSHKit.config.umask = '077'                     # All commands are executed with umask 077 && cmd

* Execution:
  execute(*args), test(*args), capture(*args)

Note: In SSHKit, the first parameter of the execute / test / capture
methods has a special significance. If the first parameter isn't a Symbol,
SSHKit assumes that you want to execute the raw command and the as / within
/ with methods, SSHKit.config.umask and the command map have no effect.
[Warning: from the source code, SSHKit does not use the command map when
the first parameter (which is converted by
`cmd.to_s.lines.map(&:strip).join("; ")`) contains a space. In this case
the command is run directly (without the arguments); but this has nothing
to do with being a symbol]

* transferring files:
  on '1.example.com' do
    upload! 'some_local_file.txt', '/home/some_user/somewhere'
    download! '/home/some_user/some_remote_file.txt', 'somewhere_local', :log_percent 25
  end

## DSL

* Without DSL:
SSHKit::Coordinator.new(hosts).each(options) do
  within / as / execute ...
end

Or for a single host:

host=SSHKit::Host.new("host"); client=SSHKit::Backend::Netssh.new(host) do block end; client.run

Exemple:
host=SSHKit::Host.new("phare")
client=SSHKit::Backend::Netssh.new(host) do
  execute :hostname
  execute :uptime
end
client.run

* The DSL is as follow:
  ~~~ ruby
  module SSHKit::DSL
    def on(hosts, options={}, &block)
      Coordinator.new(hosts).each(options, &block)
    end
    def run_locally(&block)
      Backend::Local.new(&block).run
    end
  end
  ~~~

The Coordinator calls the Runner on hosts which calls the Backend on host
which then run.

* Coordinator
  ~~~ ruby
    def initialize
        @hosts = @raw_hosts.any? ? resolve_hosts : []
    end
    def resolve_hosts
      @raw_hosts.collect { |rh| rh.is_a?(Host) ? rh : Host.new(rh) }.uniq
    end

    def each
    ...
    end
  ~~~

  Note: Coordinator#each(options,&block) essentially calls 
  `options[:in].new(hosts,options,&block).execute`
  where the Runner#execute then iterate through hosts and calls 
  `backend(host,&block).run`
  where backend is [cf runners/abstract.rb]:
  `host.local? ? SSHKit::Backend::Local.new(&block) : SSHKit.config.backend.new(host, &block)`

  So for instance: on ["foo", "bar"], in: :parallel) { ... }
  calls Coordinator.new(["foo", "bar"]).each({in: :parrallel}, &b)
  which calls Runner::Parallel.new(hosts, options, &b).execute
  which calls SSHKit.config.backend=SSHKit::Backend::Netssh(host,&b).run

* Runners (ie options[:in]:)
  sequential: launch in sequential and wait (@options[:wait]||2)
  group (Group < Sequential): run in parallel by slices of (@options[:limit]||2)
  parallel: launch parallel threads

  Special case: if 'hosts' is nil, use Runner::Null whose execute block is: SSHKit::Backend::Skipper.new(&block).run

* Backends:
  Skipper:
      def execute_command(cmd)
        warn "[SKIPPING] No Matching Host for #{cmd}"
      end
  Printer: # Printer is used to implement --dry-run in Capistrano
      def execute_command(cmd)
        output.log_command_start(cmd.with_redaction)
      end
  Local
  Netssh

* Host:
  Host.new(:local / "host to parse" / hash)
  Accessors: password, hostname, port, username=user, keys, ssh_options

  Host.new("string") => string is parsed to get (if applicable) the username, hostname and port. 
  Use :local to specify the localhost.

## Configuration

* Configuration

- SSHKit.configure do |config| end
  - use_format(formatter, *args): Used by Backend::Abstract.output which calls Configuration.output which calls formatter.new($stdout, *args)
  - default_env, default_runner[=:parallel], default_runner_config[={in:
    default_runner}], backend[=SSHKit::Backend::Netssh] (used by Runner::Abstract.backend), command_map

  Remark: - Coordinator#each(options) => options=SSHKit.config.default_runner_config.merge(options)
          - Command#environment_hash => default_env.merge(options[:env])

- SSHKit::Backend::Netssh.configure do |config| end
  => ssh_options, connection_timeout (for the connection cache pool, set to 0 to disable the cache), pty (request a pty in `execute_command`)

  Used by #_with_ssh: `host.ssh_options = self.class.config.ssh_options.merge(host.ssh_options || {})`. Note that with_ssh is used by upload!, download!, execute_command...

More details on the implementation:
  ~~~ ruby host.rb
    def netssh_options
      {}.tap do |sho|
        sho[:keys]          = keys     if keys.any?
        sho[:port]          = port     if port
        sho[:user]          = user     if user
        sho[:password]      = password if password
        sho[:forward_agent] = true
      end
      .merge(ssh_options || {})
    end

    # Used by Backend::Netssh: (backends/netssh.rb)
      def with_ssh(&block)
        host.ssh_options = self.class.config.ssh_options.merge(host.ssh_options || {})
        self.class.pool.with(
          Net::SSH.method(:start),
          String(host.hostname),
          host.username,
          host.netssh_options,
          &block
        )
      end
  ~~~

  Note that SSHKit also change Net::SSH::Config.default_files to add
  $PWD/.ssh/config
  + it implements its own known_host to enable caching, cf https://github.com/capistrano/sshkit/pull/330

## Running commands

* command_map.rb:
  puts SSHKit.config.command_map[:ruby]
  # => /usr/bin/env ruby

  SSHKit.config.command_map[:rake] = "/usr/local/rbenv/shims/rake"
  puts SSHKit.config.command_map[:rake]
  # => /usr/local/rbenv/shims/rake

  SSHKit.config.command_map.prefix[:rake].push("bundle exec")
  puts SSHKit.config.command_map[:rake]
  # => bundle exec rake
  # (The prefix is called before the command. Also both the prefix and
  # commands can be Proc; #call will be called on them to get their values)

* More details on the backend implementation:

  A Command wrap all of a command settings
  ~~~ ruby Command (cf command.rb)
    def initialize(*args)
      @options = default_options.merge(args.extract_options!)
    end
    def default_options
      {
        raise_on_non_zero_exit: true,
        run_in_background:      false
      }
    end

    def to_s
      if should_map?
        [SSHKit.config.command_map[command.to_sym], *Array(args)].join(' ')
      else
        command.to_s
      end
    end

    def exit_status #...
  ~~~

  Essentially Backend::Abstract create a command with the correct options
  and execute it. The concrete backend will execute it.

  ~~~ ruby Backend::Abstract
      def with(environment, &_block)
        env_old = (@env ||= {})
        @env = env_old.merge environment
        yield
      ensure
        @env = env_old
      end
      
      def as
        ...
      end

      def test(*args)
        options = args.extract_options!.merge(raise_on_non_zero_exit: false, verbosity: Logger::DEBUG)
        create_command_and_execute(args, options).success?
      end

      def capture(*args)
        options = { verbosity: Logger::DEBUG, strip: true }.merge(args.extract_options!)
        result = create_command_and_execute(args, options).full_stdout
        options[:strip] ? result.strip : result
      end

      def background(*args)
        SSHKit.config.deprecation_logger.log(
          'The background method is deprecated. Blame badly behaved pseudo-daemons!'
        )
        options = args.extract_options!.merge(run_in_background: true)
        create_command_and_execute(args, options).success?
      end

      def execute(*args)
        #Note: the difference with test is that an error will raise
        options = args.extract_options!
        create_command_and_execute(args, options).success?
      end

      private
      def create_command_and_execute(args, options)
        command(args, options).tap { |cmd| execute_command(cmd) }
      end
      def execute_command(_cmd) raise MethodUnavailableError end #left to backend

      def command(args, options)
        # Note: @pwd, @env, @user, @group are determined by within, with and as respectively.
        SSHKit::Command.new(*args, options.merge({in: pwd_path, env: @env, host: @host, user: @user, group: @group}))
      end
  ~~~

## Output

* Prettier output:
require "airbrussh"
SSHKit.config.output = Airbrussh::Formatter.new($stdout, options)

Options:
banner 	nil 	Provide a string (e.g. "Capistrano started!") that will be printed when Capistrano starts up. [if auto, then set to "Using airbrussh format." +   ("Verbose output is being written to #{Colors.blue(log_file)}." if log_file)]
color 	:auto 	Use true or false to enable or disable ansi color. If set to :auto, Airbrussh automatically uses color based on whether the output is a TTY, or if the SSHKIT_COLOR environment variable is set.
command_output 	true 	Set to :stdout, :stderr, or true to display the SSH output received via stdout, stderr, or both, respectively. Set to false to not show any SSH output, for a minimal look.
log_file 	log/capistrano.log 	Capistrano's verbose output is saved to this file to facilitate debugging. Set to nil to disable completely.
truncate 	:auto 	Set to a number (e.g. 80) to truncate the width of the output to that many characters, or false to disable truncation. If :auto, output is automatically truncated to the width of the terminal window, if it can be determined.
task_prefix 	nil 	A string to prefix to task output. Handy for output collapsing like buildkite's --- prefix [done by monkeypatching rake]

* Exemple:

~~~ ruby
require 'sshkit'
require "airbrussh"

host=SSHKit::Host.new("phare")
client=SSHKit::Backend::Netssh.new(host) do
  execute :hostname
  execute :uptime
end

SSHKit.config.use_format(:pretty) #the default (:simple_text to disable coloring)
client.run
SSHKit.config.use_format(:dot) #one green or red dot by command execution (:blackhole to swallow everything)
client.run 

SSHKit.config.output = Airbrussh::Formatter.new($stdout, command_output: true)
client.run
~~~

## Interaction Handler

* redact()
  If necessary, redact() can be used on a section of your execute arguments
  to hide it from both STDOUT and the capistrano.log. It supports the
  majority of data types.

  (This works as follow, using redact(foo) extends foo with 'Redaction'.
  The backends log the command via
  `output.log_command_start(cmd.with_redaction)` which replaces these
  arguments with '[Redacted]')

  Implemented as follow:
  ~~~ ruby
  # in backends/abstract.rb
  
      def redact(arg) # Used in execute_command to hide redact() args a user passes in
        arg.to_s.extend(Redaction) # to_s due to our inability to extend Integer, etc
      end

  # in command.rb
   def with_redaction
      new_args = args.map{|arg| arg.is_a?(Redaction) ? '[REDACTED]' : arg }
      redacted_cmd = dup
      redacted_cmd.instance_variable_set(:@args, new_args)
      redacted_cmd
    end
  ~~~

* SSHKit::MappingInteractionHandler
  ~~~ ruby
  class PasswdInteractionHandler
    def on_data(command, stream_name, data, channel)
      puts data
      case data
        when '(current) UNIX password: '
          channel.send_data("old_pw\n")
        when 'Enter new UNIX password: ', 'Retype new UNIX password: '
          channel.send_data("new_pw\n")
        when 'passwd: password updated successfully'
        else
          raise "Unexpected stderr #{stderr}"
      end
    end
  end
  # ...
  execute(:passwd, interaction_handler: PasswdInteractionHandler.new)

  # One can pass a hash or proc to interaction_handler, which is then
  # wrapped into a SSHKit::MappingInteractionHandler
  execute(:my_command, interaction_handler: {
    "some specific line\n" => "specific input\n",
    /.*/ => "default input\n"
  })

  execute(:passwd, interaction_handler: lambda { |server_data|
    case server_data
    when '(current) UNIX password: '
      "old_pw\n"
    when /(Enter|Retype) new UNIX password: /
      "new_pw\n"
    end
  })

  # One can also call it directly to enable logging:
  execute(:unfamiliar_command, interaction_handler: MappingInteractionHandler.new( {"Please type your input:\r\n" => "Some input\n"}, :info))

  # Full case
  require 'sshkit'
  # host=SSHKit::Host.new(:local)

  # client=SSHKit::Backend::Local.new(host) do
  client=SSHKit::Backend::Local.new do
    execute(:passwd, interaction_handler: lambda { |server_data|
      case server_data
      when '(current) UNIX password: '
        "old_pw\n"
      when /(Enter|Retype) new UNIX password: /
        "new_pw\n"
      end
    })
  end
  client.run
  ~~~

Note: Command#on_stdout:
~~~ ruby
    def on_stdout(channel, data)
      @stdout = data
      @full_stdout += data
      call_interaction_handler(:stdout, data, channel)
    end

    def call_interaction_handler(stream_name, data, channel)
      interaction_handler = options[:interaction_handler]
      interaction_handler = MappingInteractionHandler.new(interaction_handler) if interaction_handler.kind_of?(Hash)
      interaction_handler.on_data(self, stream_name, data, channel) if interaction_handler.respond_to?(:on_data)
    end
~~~

