# vim: foldmethod=marker
require 'open3'
require 'shellwords'

module DR
  module Run #{{{
    extend(self)
    #the run_* commands here capture all the output
    def run_command(*command)
      return Open3.capture3(*command)
    end

    def run_output(*command)
      stdout,_stderr,_status = run_command(*command)
      return stdout
    end

    def run_status(*command)
      _stdout,_stderr,status = run_command(*command)
      return status.success?
    end

    #a simple wrapper for %x//
    def run_simple(*command, quiet: false)
      launch=command.shelljoin
      launch+=" 2>/dev/null" if quiet
      out = `#{launch}`
      status=$?
      return out, status.success?
    end

    #capture stdout and status, silence stderr
    def run(*args)
      begin
        if Open3.respond_to?(:capture3) then
          out, _error, status=Open3.capture3(*args) 
          return out, status.success?
        else
          out = `#{args.shelljoin} 2>/dev/null`
          status=$?
          return out, status.success?
        end
      end
    end
  end #}}}

  #same as Run, but if we get interrupted once, we don't want to launch any more commands
  module RunInterrupt #{{{
    extend(self)
    @interrupted=false
    def run_command(*args)
      if !@interrupted
        begin
          DR::Run.run_command(*args)
        rescue Interrupt #interruption
          @interrupted=true
          return "", "", false
        end
      else
        return "", "", false
      end
    end

    def run(*command)
      if !@interrupted
        begin
          return DR::Run.run(*args)
        rescue Interrupt #interruption
          @interrupted=true
          return "", false
        end
      else
        return "", false
      end
    end
  end #}}}
  # ProcessStatus {{{
  # from methadone (process_status.rb; last import v1.3.1-2-g9be3b5a)
  #
  # A wrapper/enhancement of Process::Status that handles coercion and expected
  # nonzero statuses
  class ProcessStatus

    # The exit status, either directly from a Process::Status, from the exit code, or derived from a non-Int value.
    attr_reader :exitstatus, :status

    # Create the ProcessStatus with the given status.
    # respond to success?,exitstatus,status
    #
    # status:: if this responds to #exitstatus, that method is used to extract the exit code.  If it's an Int, that is used as the exit code.  Otherwise, it's truthiness is used: 0 for truthy, 1 for falsey.
    # expected:: an Int or Array of Int representing the expected exit status, other than zero, that represent "success".
    #Ex usage: stdout,stderr,status = DR::Run.run_command(*command,**opts)
    #process_status = DR::ProcessStatus.new(status,expected)
    def initialize(status,expected=nil)
      @status=status
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
