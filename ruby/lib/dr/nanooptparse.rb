require 'optparse'

module DR
  class Parser
    attr_accessor :banner, :version
    def initialize
      @options = []
      @used_short = []
      @default_values = nil
      yield self if block_given?
    end
  
    def option(name, desc, settings = {})
      @options << [name, desc, settings]
    end
  
    def short_from(name)
      name.to_s.chars.each do |c|
        next if @used_short.include?(c) || c == "_"
        return c
      end
      return name.to_s.first
    end
  
    def validate(options)
      options.each_pair do |key, value|
        opt = @options.find_all{ |o| o[0] == key }.first
        key = "--" << key.to_s.gsub("_", "-")
        unless opt[2][:value_in_set].nil? || opt[2][:value_in_set].include?(value)
          puts "Parameter for #{key} must be in [" << opt[2][:value_in_set].join(", ") << "]" ; exit(1)
        end
        unless opt[2][:value_matches].nil? || opt[2][:value_matches] =~ value
          puts "Parameter for #{key} must match /" << opt[2][:value_matches].source << "/" ; exit(1)
        end
        unless opt[2][:value_satisfies].nil? || opt[2][:value_satisfies].call(value)
          puts "Parameter for #{key} must satisfy given conditions (see description)" ; exit(1)
        end
      end
    end
  
    def process!(arguments = ARGV, *opts)
      @result = (@default_values || {}).clone # reset or new
      @optionparser ||= OptionParser.new do |p| # prepare only once
        p.separator(opts[:separator)) if opts[:separator]
        @options.each do |o|
          @used_short << short = o[2][:short] || short_from(o[0])
          @result[o[0]] = o[2][:default] || false # set default
          klass = o[2][:default].class == Fixnum ? Integer : o[2][:default].class
  
          if [TrueClass, FalseClass, NilClass].include?(klass) # boolean switch
            p.on("-" << short, "--[no-]" << o[0].to_s.gsub("_", "-"), o[1]) {|x| @result[o[0]] = x}
          else # argument with parameter
            p.on("-" << short, "--" << o[0].to_s.gsub("_", "-") << " " << o[2][:default].to_s, klass, o[1]) {|x| @result[o[0]] = x}
          end
        end
  
        p.banner = @banner unless @banner.nil?
        p.on_tail("-h", "--help", "Show this message") {puts p ; exit}
        short = @used_short.include?("v") ? "-V" : "-v"
        p.on_tail(short, "--version", "Print version") {puts @version ; exit} unless @version.nil?
        @default_values = @result.clone # save default values to reset @result in subsequent calls
        yield(p) if block_given? #add specific options parser options
      end
  
      begin
        if opts[:process] then
          @optionparser.send(opts[:process],arguments)
        else
          @optionparser.parse!(arguments)
        end
      rescue OptionParser::ParseError => e
        puts e.message ; exit(1)
      end
      
      validate(@result) if self.respond_to?("validate")
      @result
    end
  end
end