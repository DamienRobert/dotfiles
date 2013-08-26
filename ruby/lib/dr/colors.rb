#inspired by 
#https://github.com/flori/term-ansicolor
#https://github.com/sickill/rainbow/blob/master/lib/rainbow.rb
#please use these gems. This is just to be self contained
module DR
  module ANSIColors
    class << self; attr_accessor :enabled; end
    self.enabled=true

    COLORS = Hash[[
      [ :clear , 0 ], # String#clear is already used to empty string in Ruby 1.9
      [ :reset , 0 ], # synonym for :clear
      [ :bold , 1 ],
      [ :dark , 2 ],
      [ :italic , 3 ], # not widely implemented
      [ :underline , 4 ],
      [ :underscore , 4 ], # synonym for :underline
      [ :blink , 5 ],
      [ :rapid_blink , 6 ], # not widely implemented
      [ :negative , 7 ], # no reverse because of String#reverse
      [ :concealed , 8 ],
      [ :strikethrough , 9 ], # not widely implemented
      [ :black , 30 ],
      [ :red , 31 ],
      [ :green , 32 ],
      [ :yellow , 33 ],
      [ :blue , 34 ],
      [ :magenta , 35 ],
      [ :cyan , 36 ],
      [ :white , 37 ],
      [ :on_black , 40 ],
      [ :on_red , 41 ],
      [ :on_green , 42 ],
      [ :on_yellow , 43 ],
      [ :on_blue , 44 ],
      [ :on_magenta , 45 ],
      [ :on_cyan , 46 ],
      [ :on_white , 47 ],
      [ :intense_black , 90 ], # High intensity, aixterm (works in OS X)
      [ :intense_red , 91 ],
      [ :intense_green , 92 ],
      [ :intense_yellow , 93 ],
      [ :intense_blue , 94 ],
      [ :intense_magenta , 95 ],
      [ :intense_cyan , 96 ],
      [ :intense_white , 97 ],
      [ :on_intense_black , 100 ], # High intensity background, aixterm (works in OS X)
      [ :on_intense_red , 101 ],
      [ :on_intense_green , 102 ],
      [ :on_intense_yellow , 103 ],
      [ :on_intense_blue , 104 ],
      [ :on_intense_magenta , 105 ],
      [ :on_intense_cyan , 106 ],
      [ :on_intense_white , 107 ]
    ]]

    def colorattributes(*args)
      if DR::ANSIColors.enabled
        result=args.map {|col| "\e[#{COLORS[col]}m" }.inject(:+)
        if DR::ANSIColors.enabled == :shell
          return "%{"+result+"%}"
        else
          return result
        end
      else 
        return ''
      end
    end

    # Regular expression that is used to scan for ANSI-sequences while
    # uncoloring strings.
    COLORED_REGEXP = /\e\[(?:(?:[349]|10)[0-7]|[0-9])?m/

    module StringMixin
      # Returns an uncolored version of the string, that is all
      # ANSI-sequences are stripped from the string.
      def uncolored(string = nil) # :yields:
        if block_given?
          yield.to_str.gsub(COLORED_REGEXP, '')
        elsif string.respond_to?(:to_str)
          string.to_str.gsub(COLORED_REGEXP, '')
        elsif respond_to?(:to_str)
          to_str.gsub(COLORED_REGEXP, '')
        else
          ''
        end
      end

      #wrap self or the first argument with colors
      def color(*args)
        if respond_to?(:to_str)
          arg=self.dup
        elsif block_given?
          arg = yield
        elsif args.first.respond_to?(:to_str)
          arg=args.shift
        else
          arg=nil
        end
        return arg unless DR::ANSIColors.enabled

        if arg.nil?
          return DR::ANSIColors.colorattributes(*args)
        elsif arg.empty?
          return arg
        else
          matched = arg.match(/^(\e\[([\d;]+)m)*/)
          arg.insert(matched.end(0), DR::ANSIColors.colorattributes(*args))
          arg.concat(DR::ANSIColors.colorattributes(:clear)) unless arg =~ /\e\[0m$/
          return arg
        end
      end
    end
    #on peut faire
    #c = DR::ANSIColors; c.color("blue", :blue, :bold)
    #ou c.color(:blue,:bold) {"blue"}
    #ou c.color(:blue,:bold) << "blue" << c.color(:clear)
    #pareil pour uncolored

    include DR::ANSIColors::StringMixin
    def mix_in_string
      String.class_eval {include DR::ANSIColors::StringMixin}
    end
    #après DR::ANSIColors.mix_in_string, on peut faire
    #"blue".color(:blue,:bold)

    extend self
  end
end
