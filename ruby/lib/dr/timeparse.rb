require 'chronic'
require 'active_support/time'

module DR
  module TimeParse
    def self.time_to_day_range(t)
      return Chronic.parse(t.to_date, guess:false)
    end
    def self.parse(s, opt={})
      
      if !opt[:norange] && s=~/(.*)\.\.(.*)/
        first=$1
        second=$2
        opt[:norange]=true
        puts "first: #{first}, second: #{second}"
        return self.parse(first, opt)..self.parse(second,opt)
      end
  
      if not s.present?
        t=Time.now
      elsif s[0] =~ /[+-]/
        t=eval(s)
        case t
          when Time
        else
          t=Time.now+t
        end
      else
  
        chronicopts=[:context,:now,:guess,:ambiguous_time_range,:endian_precedence,:ambiguous_year_future_bias]
        chronicopt={ambiguous_time_range: 0, :endian_precedence => :little}
        chronicopt[:guess]=false if opt[:range]
        chronicopt.update(opt.reject {|k,v| not k.in?(chronicopts)}) 
        #puts chronicopt
        t=Chronic.parse(s, chronicopt)
        t=Time.parse(s) if not t
      end
      if opt[:range] && !opt[:norange] then
        return time_to_day_range(t) unless Range === t
      end
      return t
    end
  
  end
end
