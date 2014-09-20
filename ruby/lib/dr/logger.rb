# vim: foldmethod=marker
#From methadone (cli_logger.rb, cli_logging.rb, last import: v1.3.1-2-g9be3b5a)
require 'logger'

module DR
  # CLILogger {{{
  # A Logger instance that gives better control of messaging the user and
  # logging app activity.  At it's most basic, you would use <tt>info</tt>
  # as a replacement for +puts+ and <tt>error</tt> as a replacement for
  # <tt>STDERR.puts</tt>.  Since this is a logger, however, you can also
  # use #debug, #warn, and #fatal, and you can control the format and
  # "logging level" as such.
  #
  # So, by default: 
  # * debug messages do not appear anywhere 
  # * info messages appear on the standard output 
  # * warn, error, and fatal message appear on the standard error 
  # * The default format of messages is simply the message, no logging
  # cruft, however if your output is redirected to a file, a better
  # timestamped logging format is used
  #
  # You can customize this in several ways:
  # * You can override the devices used by passing different devices to the constructor 
  # * You can adjust the level of message that goes to the error logger via error_level= 
  # * You can adjust the format for messages to the error logger separately via error_formatter=
  #
  # === Example
  #
  #     logger = CLILogger.new 
  #     logger.debug("Starting up") # => only the standard output gets this 
  #     logger.warn("careful!") # => only the standard error gets this 
  #     logger.error("Something went wrong!") # => only the standard error gets this
  #
  #     logger = CLILogger.new 
  #     logger.error_level = Logger::ERROR
  #     logger.debug("Starting up") # => only the standard output gets this
  #     logger.warn("careful!") # => only the standard OUTPUT gets this
  #     logger.error("Something went wrong!") # => only the standard error gets this
  #     
  #     logger = CLILogger.new('logfile.txt') 
  #     logger.debug("Starting up") #=> logfile.txt gets this 
  #     logger.error("Something went wrong!") # => BOTH logfile.txt AND the standard error get this
  class CLILogger < Logger
    BLANK_FORMAT = lambda { |severity,datetime,progname,msg|
      msg + "\n"
    }

    # Helper to proxy methods to the super class AND to the internal error logger 
    # +symbol+:: Symbol for name of the method to proxy
    def self.proxy_method(symbol) #:nodoc:
      old_name = "old_#{symbol}".to_sym
      alias_method old_name,symbol
      define_method symbol do |*args,&block|
        send(old_name,*args,&block)
        @stderr_logger.send(symbol,*args,&block)
      end
    end

    proxy_method :'formatter='
    proxy_method :'datetime_format='

    def add(severity, message = nil, progname = nil, &block) #:nodoc:
      if @split_logs 
        unless severity >= @stderr_logger.level
          super(severity,message,progname,&block)
        end
      else
        super(severity,message,progname,&block)
      end
      @stderr_logger.add(severity,message,progname,&block)
    end
   
    DEFAULT_ERROR_LEVEL = Logger::Severity::WARN

    # A logger that logs error-type messages to a second device; useful for
    # ensuring that error messages go to standard error.  This should be
    # pretty smart about doing the right thing.  If both log devices are
    # ttys, e.g. one is going to standard error and the other to the
    # standard output, messages only appear once in the overall output
    # stream.  In other words, an ERROR logged will show up *only* in the
    # standard error.  If either log device is NOT a tty, then all messages
    # go to +log_device+ and only errors go to +error_device+
    #
    # +log_device+:: device where all log messages should go, based on level
    # By default, this is Logger::Severity::WARN
    # +error_device+:: device where all error messages should go.  
    def initialize(log_device=$stdout,error_device=$stderr,
                   split_log:log_device.tty? && error_device.tty?)
      super(log_device)
      @stderr_logger = Logger.new(error_device)

      @split_logs = split_log
      self.level = Logger::Severity::INFO
      @stderr_logger.level = DEFAULT_ERROR_LEVEL

      self.formatter = BLANK_FORMAT if log_device.tty?
      @stderr_logger.formatter = BLANK_FORMAT if error_device.tty?
    end

    def level=(level)
      super(level)
      #current_error_level = @stderr_logger.level
      if (level > DEFAULT_ERROR_LEVEL) && @split_logs
        @stderr_logger.level = level
      end
    end

    # Set the threshold for what messages go to the error device.  Note
    # that calling #level= will *not* affect the error logger *unless* both
    # devices are TTYs.
    # +level+:: a constant from Logger::Severity for the level of messages that should go to the error logger
    def error_level=(level)
      @stderr_logger.level = level
    end

    # Overrides the formatter for the error logger.  A future call to
    # #formatter= will affect both, so the order of the calls matters.
    # +formatter+:: Proc that handles the formatting, the same as for #formatter=
    def error_formatter=(formatter)
      @stderr_logger.formatter=formatter
    end

  end
  #}}}
  # CLILogging {{{
  # Provides easier access to a shared DR::CLILogger instance.
  # Include this module into your class, and #logger provides access to a
  # shared logger. This is handy if you want all of your clases to have
  # access to the same logger, but don't want to (or aren't able to) pass
  # it around to each class.
  # This also provides methods for direct logging without going through the
  # #logger
  #
  # === Example
  #
  #     class MyClass
  #       include DR::CLILogging
  #       
  #       def doit
  #         debug("About to doit!")
  #         if results
  #           info("We did it!")
  #         else
  #           error("Something went wrong")
  #         end
  #         debug("Done doing it")
  #       end
  #     end
  #
  # Note that every class that mixes this in shares the *same logger
  # instance*, so if you call #change_logger, this will change the logger
  # for all classes that mix this in.  This is likely what you want.
  module CLILogging

    extend self

    # Access the shared logger.  All classes that include this module
    # will get the same logger via this method.
    def logger
      @@logger ||= CLILogger.new
    end

    # Change the global logger that includers will use.  Useful if you
    # don't want the default configured logger.  Note that the
    # +change_logger+ version is preferred because Ruby will often parse
    # <tt>logger = Logger.new</tt> as the declaration of, and assignment
    # to, of a local variable.  You'd need to do
    # <tt>self.logger=Logger.new</tt> to be sure.  This method is a bit
    # easier.
    #
    # +new_logger+:: the new logger.  May not be nil and should be a logger of some kind
    def change_logger(new_logger)
      raise ArgumentError,"Logger may not be nil" if new_logger.nil?
      @@logger = new_logger
      @@logger.level = @log_level if @log_level
    end

    alias logger= change_logger

    LOG_LEVELS = {
      'debug' => Logger::DEBUG,
      'info' => Logger::INFO,
      'warn' => Logger::WARN,
      'error' => Logger::ERROR,
      'fatal' => Logger::FATAL,
    }

    # Call this *if* you've included Methadone::Main to set up a
    # <tt>--log-level</tt> option for your app that will allow the user to
    # configure the logging level.
    #
    # Example:
    #
    #     main do 
    #       # your app
    #     end
    #
    #     use_log_level_option
    #
    #     go!
    #
    #def use_log_level_option
    #  on("--log-level LEVEL",LOG_LEVELS,'Set the logging level',
    #                                    '(' + LOG_LEVELS.keys.join('|') + ')',
    #                                    '(Default: info)') do |level|
    #    @log_level = level
    #    logger.level = level
    #  end
    #end

    #log the action and execute it
    #Severity is Logger:: DEBUG < INFO < WARN < ERROR < FATAL < UNKNOWN
    def log_and_do(severity, *args, definee: self, &block) 
      msg="log_and_do #{args} on #{self}"
      msg+=" with block #{block}" if block
      logger.add(severity,msg)
      definee.send(*args, &block)
    end
  end #}}}

  #Include this in place of CLILogging if you prefer to use
  #info directly rather than logger.info
  module CLILoggingShortcuts #{{{
    extend self
    include CLILogging

    def debug(progname = nil, &block); logger.debug(progname,&block); end
    def info(progname = nil, &block); logger.info(progname,&block); end
    def warns(progname = nil, &block); logger.warn(progname,&block); end
    def error(progname = nil, &block); logger.error(progname,&block); end
    def fatal(progname = nil, &block); logger.fatal(progname,&block); end
  end
  #}}}
end
