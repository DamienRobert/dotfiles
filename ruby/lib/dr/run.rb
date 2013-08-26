# vim: foldmethod=marker
#from methadone
require 'open3'
require 'dr/logger'

module DR
  # ExitNow {{{
  # Standard exception you can throw to exit with a given status code.
  # Generally, you should prefer Methadone::Main#exit_now! over using this
  # directly, however you may wish to create a rich hierarchy of exceptions
  # that extend from this in your app, so this is provided if you wish to
  # do so.
  class Error < StandardError
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
        raise DR::Error.new(1,exit_code)
      else
        raise DR::Error.new(exit_code,message)
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
  class FailedCommandError < Error
    # The command that caused the failure
    attr_reader :command
    # exit_code:: exit code of the command that caused this
    # command:: the entire command-line that caused this
    # custom_error_message:: an error message to show the user instead of
    # the boilerplate one.  Useful for allowing this exception to bubble up
    # and exit the program, but to give the user something actionable.
    def initialize(exit_code,command,custom_error_message = nil)
      error_message = String(custom_error_message).empty? ?  "Command '#{command}' exited #{exit_code}" : custom_error_message
      super(exit_code,error_message)
      @command = command
    end
  end
  # }}}

  module SH
    include DR::CLILogging
    extend self

    def self.included(k)
      k.extend(self)
    end

    def run_command(command)
      stdout,stderr,status = case command
                             when String then Open3.capture3(command)
                             else Open3.capture3(*command)
                             end
      [stdout.chomp,stderr.chomp,status]
    end

    # Run a shell command, capturing and logging its output.
    # If the command completed successfully, it's output is logged at DEBUG.
    # If not, its output is logged at INFO.  In either case, its
    # error output is logged at WARN.
    #
    # command:: the command to run as a String or Array of String.  The String form is simplest, but is open to injection.  If you need to execute a command that is assembled from some portion of user input, consider using an Array of String.  This form prevents tokenization that occurs in the String form.  The first element is the command to execute, and the remainder are the arguments. See Methadone::ExecutionStrategy::Base for more info.
    # options:: options to control the call. Currently responds to:
    #           +:expected+:: an Int or Array of Int representing error codes, <b>in addition to 0</b>, that are expected and therefore constitute success.  Useful for commands that don't use exit codes the way you'd like
    # block:: if provided, will be called if the command exited nonzero.  The block may take 0, 1, 2, or 3 arguments.
    #         The arguments provided are the standard output as a string, standard error as a string, and the exitstatus as an Int.
    #         You should be safe to pass in a lambda instead of a block, as long as your lambda doesn't take more than three arguments
    #
    # Example
    #
    #     sh "cp foo /tmp"
    #     sh "ls /tmp" do |stdout|
    #       # stdout contains the output of ls /tmp
    #     end
    #     sh "ls -l /tmp foobar" do |stdout,stderr|
    #       # ...
    #     end
    #
    # Returns the exit status of the command.  Note that if the command doesn't exist, this returns 127.
    def sh(command,options={},&block)
      command_name = options[:name] || command.to_s
      sh_logger.debug("Executing '#{command_name}'")

      stdout,stderr,status = run_command(command)
      process_status = DR::ProcessStatus.new(status,options[:expected])

      sh_logger.warn("stderr output of '#{command_name}': #{stderr}") unless stderr.strip.length == 0

      if process_status.success?
        sh_logger.debug("stdout output of '#{command_name}': #{stdout}") unless stdout.strip.length == 0
        call_block(block,stdout,stderr,process_status.exitstatus) unless block.nil?
      else
        sh_logger.info("stdout output of '#{command_name}': #{stdout}") unless stdout.strip.length == 0
        sh_logger.warn("Error running '#{command_name}'")
      end

      process_status.exitstatus
    rescue Errno::ENOENT => ex
      sh_logger.error("Error running '#{command_name}': #{ex.message}")
      127
    end

    # Run a command, throwing an exception if the command exited nonzero.
    # Otherwise, behaves exactly like #sh.
    #
    # options:: options hash, responding to:
    #           <tt>:expected</tt>:: same as for #sh
    #           <tt>:on_fail</tt>:: a custom error message.  This allows you to have your app exit on shell command failures, but customize the error message that they see.
    #
    # Raises DR::FailedCommandError if the command exited nonzero.
    #
    # Examples:
    #
    #     sh!("rsync foo bar")
    #     # => if command fails, app exits and user sees: "error: Command 'rsync foo bar' exited 12"
    #     sh!("rsync foo bar", :on_fail => "Couldn't rsync, check log for details")
    #     # => if command fails, app exits and user sees: "error: Couldn't rsync, check log for details
    def sh!(command,options={},&block)
      sh(command,options,&block).tap do |exitstatus|
        process_status = DR::ProcessStatus.new(exitstatus,options[:expected])
        unless process_status.success?
          raise DR::FailedCommandError.new(exitstatus,command,options[:on_fail]) 
        end
      end
    end

    # Override the default logger (which is the one provided by CLILogging).
    # You would do this if you want a custom logger or you aren't mixing-in
    # CLILogging.
    #
    # Note that this method is *not* called <tt>sh_logger=</tt> to avoid annoying situations
    # where Ruby thinks you are setting a local variable
    def set_sh_logger(logger)
      @sh_logger = logger
    end

  private 
    def sh_logger
      @sh_logger ||= self.logger
    end

    # Safely call our block, even if the user passed in a lambda
    def call_block(block,stdout,stderr,exitstatus)
      # blocks that take no arguments have arity -1.  Or 0.  Ugh.
      if block.arity > 0
        case block.arity
        when 1 
          block.call(stdout)
        when 2
          block.call(stdout,stderr)
        else
          # Let it fail for lambdas
          block.call(stdout,stderr,exitstatus)
        end
      else
        block.call
      end
    end
  end
  # }}}
  # ProcessStatus {{{
  # <b>Methadone Internal - treat as private</b>
  #
  # A wrapper/enhancement of Process::Status that handles coersion and expected
  # nonzero statuses
  class ProcessStatus

    # The exit status, either directly from a Process::Status or derived from a non-Int value.
    attr_reader :exitstatus

    # Create the ProcessStatus with the given status.
    #
    # status:: if this responds to #exitstatus, that method is used to extract the exit code.  If it's an Int, that is used as the exit code.  Otherwise, it's truthiness is used: 0 for truthy, 1 for falsey.
    # expected:: an Int or Array of Int representing the expected exit status, other than zero, that represent "success".
    def initialize(status,expected)
      @exitstatus = derive_exitstatus(status)
      @success = ([0] + Array(expected)).include?(@exitstatus)
    end

    # True if the exit status was a successul (i.e. expected) one.
    def success?
      @success
    end

  private

    def derive_exitstatus(status)
      status = if status.respond_to? :exitstatus
                 status.exitstatus
               else
                 status
               end
      if status.kind_of? Fixnum
        status
      elsif status
        0
      else
        1
      end
    end
  end
  # }}}
end
