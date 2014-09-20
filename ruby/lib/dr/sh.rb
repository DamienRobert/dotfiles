# vim: foldmethod=marker
#from methadone (error.rb, exit_now.rb, process_status.rb, run.rb; last
#import v1.3.1-2-g9be3b5a)
require 'open3'
require 'dr/logger'
require 'dr/run'
require 'simplecolor'

module DR
  # ExitNow {{{
  # Standard exception you can throw to exit with a given status code.
  # Generally, you should prefer DR::ExitNow.exit_now! over using this
  # directly, however you may wish to create a rich hierarchy of exceptions
  # that extend from this in your app, so this is provided if you wish to
  # do so.
  class ExitError < StandardError
    attr_reader :exit_code
    # Create an Error with the given status code and message
    def initialize(exit_code,message=nil)
      super(message)
      @exit_code = exit_code
    end
  end

  # Provides #exit_now! You might mix this into your business logic classes
  # if they will need to exit the program with a human-readable error
  # message.
  module ExitNow
    # Call this to exit the program immediately
    # with the given error code and message.
    # +exit_code+:: exit status you'd like to exit with
    # +message+:: message to display to the user explaining the problem
    # If +exit_code+ is a String and +message+ is omitted, +exit_code+ will
    # === Examples
    #     exit_now!(4,"Oh noes!") 
    #       # => exit app with status 4 and show the user "Oh noes!" on stderr
    #     exit_now!("Oh noes!")   
    #       # => exit app with status 1 and show the user "Oh noes!" on stderr
    #     exit_now!(4)            
    #       # => exit app with status 4 and dont' give the user a message (how rude of you)
    def exit_now!(exit_code,message=nil)
      if exit_code.kind_of?(String) && message.nil?
        raise DR::ExitError.new(1,exit_code)
      else
        raise DR::ExitError.new(exit_code,message)
      end
    end
  end
  # }}}
  # SH {{{
  # Module with various helper methods for executing external commands.
  # In most cases, you can use #sh to run commands and have decent logging
  # done.  
  # == Examples
  #
  #    extend DR::SH
  #
  #    sh 'cp foo.txt /tmp'
  #    # => logs the command to DEBUG, executes the command, logs its output to DEBUG and its error output to WARN, returns 0
  # 
  #    sh 'cp non_existent_file.txt /nowhere_good'
  #    # => logs the command to DEBUG, executes the command, logs its output to INFO and its error output to WARN, returns the nonzero exit status of the underlying command
  # 
  #    sh! 'cp non_existent_file.txt /nowhere_good'
  #    # => same as above, EXCEPT, raises a Methadone::FailedCommandError
  #
  #    sh 'cp foo.txt /tmp' do
  #      # Behaves exactly as before, but this block is called after
  #    end
  #
  #    sh 'cp non_existent_file.txt /nowhere_good' do
  #      # This block isn't called, since the command failed
  #    end
  #
  #    sh 'ls -l /tmp/' do |stdout|
  #      # stdout contains the output of the command
  #    end
  #    sh 'ls -l /tmp/ /non_existent_dir' do |stdout,stderr|
  #      # stdout contains the output of the command,
  #      # stderr contains the standard error output.
  #     end

  # FailedCommandError {{{
  # Thrown by certain methods when an externally-called command exits nonzero
  class FailedCommandError < StandardError
    # The command that caused the failure
    attr_reader :command
    # exit_code:: exit code of the command that caused this
    # command:: the entire command-line that caused this
    # custom_error_message:: an error message to show the user instead of
    # the boilerplate one.  Useful for allowing this exception to bubble up
    # and exit the program, but to give the user something actionable.
    def initialize(exit_code,command,failure_msg: nil)
      error_message = String(failure_msg).empty? ?  "Command '#{command}' exited #{exit_code}" : failure_msg
      super(error_message)
      @command = command
    end
  end
  # }}}

  module SH
    include DR::CLILogging
    extend self

    # Run a shell command, capturing and logging its output.
    # keywords:: log+capture
    # If the command completed successfully, it's output is logged at DEBUG.
    # If not, its output is logged at INFO.  In either case, its
    # error output is logged at WARN.
    #           +:expected+:: an Int or Array of Int representing error codes, <b>in addition to 0</b>, that are expected and therefore constitute success.  Useful for commands that don't use exit codes the way you'd like
    #     name: pretty name of command
    #     on_success,on_failure: blocks to call on success/failure
    # block:: if provided, will be called if the command exited nonzero.  The block may take 0, 1, 2, or 3 arguments.
    #         The arguments provided are the standard output as a string, standard error as a string, and the processstatus as DR::ProcessStatus
    #         You should be safe to pass in a lambda instead of a block, as long as your lambda doesn't take more than three arguments
    #
    # Example
    #     sh "cp foo /tmp"
    #     sh "ls /tmp" do |stdout|
    #       # stdout contains the output of ls /tmp
    #     end
    #     sh "ls -l /tmp foobar" do |stdout,stderr|
    #       # ...
    #     end
    #
    # Returns the exit status of the command.  Note that if the command doesn't exist, this returns 127.
    def sh(*command,name: nil, log: false, capture: false, on_success: nil, on_failure: nil, expected:0, **opts, &block)
      command_name = name || command_name(command)
      sh_logger.debug(SimpleColor.color("Executing '#{command_name}'",:bold)) if log

      if capture
        stdout,stderr,status = DR::Run.run_command(*command,**opts)
        process_status = DR::ProcessStatus.new(status,expected)

        sh_logger.warn(SimpleColor.color("stderr output of '#{command_name}':\n",:bold,:red)+stderr) unless stderr.strip.length == 0 or !log

        if process_status.success?
          sh_logger.debug(SimpleColor.color("stdout output of '#{command_name}':\n",:bold,:green)+stdout) unless stdout.strip.length == 0 or !log
          call_block(on_success,stdout,stderr,process_status) unless on_success.nil?
          call_block(block,stdout,stderr,process_status) unless block.nil?
        else
          sh_logger.info(SimpleColor.color("stdout output of '#{command_name}':\n",:bold,:yellow)+stdout) unless stdout.strip.length == 0 or !log
          sh_logger.warn(SimpleColor.color("Error running '#{command_name}'",:red,:bold)) if log
          call_block(on_failure,stdout,stderr,process_status) unless on_failure.nil?
        end
        return process_status.success?,stdout,stderr,process_status
      else
        system(*command,**opts)
        status=$?
        process_status = DR::ProcessStatus.new(status,expected)
        if process_status.success?
          call_block(on_success,process_status) unless on_success.nil?
          call_block(block,process_status) unless block.nil?
        else
          sh_logger.warn(SimpleColor.color("Error running '#{command_name}'",:red,:bold)) if log
          call_block(on_failure,process_status) unless on_failure.nil?
        end
        return process_status.success?,process_status
      end

    rescue Errno::ENOENT => ex
      sh_logger.error(SimpleColor.color("Error running '#{command_name}': #{ex.message}",:red,:bold)) if log
      return 127
    end

    # Run a command, throwing an exception if the command exited nonzero.
    # Otherwise, behaves exactly like #sh.
    # Raises DR::FailedCommandError if the command exited nonzero.
    # Examples:
    #
    #     sh!("rsync foo bar")
    #     # => if command fails, app exits and user sees: "error: Command 'rsync foo bar' exited 12"
    #     sh!("rsync foo bar", :failure_msg => "Couldn't rsync, check log for details")
    #     # => if command fails, app exits and user sees: "error: Couldn't rsync, check log for details
    def sh!(*args,failure_msg: nil,**opts, &block)
      on_failure=lambda do |*blockargs|
        process_status=blockargs.last
        raise DR::FailedCommandError.new(process_status.exitstatus,command_name(args),failure_msg: failure_msg) 
      end
      sh(*args,**opts,on_failure: on_failure,&block)
    end

    # Override the default logger (which is the one provided by CLILogging).
    # You would do this if you want a custom logger or you aren't mixing-in
    # CLILogging.
    #
    # Note that this method is *not* called <tt>sh_logger=</tt> to avoid annoying situations
    # where Ruby thinks you are setting a local variable
    def change_sh_logger(logger)
      @sh_logger = logger
    end

  private 
    def command_name(command)
      if command.size == 1
        return command.first.to_s
      else
        return command.to_s
      end
    end

    def sh_logger
      @sh_logger ||= begin
        raise StandardError, "No logger set! Please include DR::CLILogging
ng or provide your own via #change_sh_logger." unless self.respond_to?(:logger)
        self.logger
      end
    end

    # Safely call our block, even if the user passed in something of a
    # different arity (lambda case)
    def call_block(block,*args)
      if block.arity >= 0
        case block.arity
        when 0 
          block.call
        else
          block.call(args[0...block.arity])
        end
      else
        block.call(*args)
      end
    end
  end
  # }}}
end
