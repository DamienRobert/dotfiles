require 'chronic'
require 'chronic_duration'
require 'active_support/time'

module DR
	module TimeParse
		def self.time_to_day_range(t)
			return Chronic.parse(t.to_date, guess:false)
		end
		def self.parse(s, opt={})
			return s if Date===s or Time===s

			if !opt[:norange] && s=~/(.*)\.\.(.*)/
				first=$1
				second=$2
				opt[:norange]=true
				return Chronic::Span.new(self.parse(first, opt),self.parse(second,opt))
			end
	
			if not s.present?
				t=Time.now
			elsif s[0] =~ /[+-]/
				#if s=+3.years-1.minutes
				begin
					t=eval(s)
				rescue SyntaxError
				#if s=3 years
					t=ChronicDuration.parse(s[1...s.length])
					t=-t if s[0]=='-'
				end
				case t
					when Time
				else
					t=Time.now+t
				end
				return t
			else

				chronicopts=[:context,:now,:guess,:ambiguous_time_range,:endian_precedence,:ambiguous_year_future_bias]
				chronicopt={hours24: true, ambiguous_time_range: 0, endian_precedence: [:little,:middle]}
				chronicopt[:guess]=false if opt[:range]
				chronicopt.update(opt.reject {|k,v| not chronicopts.include?(k)})
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
#Examples:
#DR::TimeParse.parse("+100..tomorrow")
#first: +100, second: tomorrow
#=> 2014-08-22 11:20:31 +0200..2014-08-23 12:00:00 +0200
#[74] pry(main)> DR::TimeParse.parse("now..in seven days")
#first: now, second: in seven days
#=> 2014-08-22 11:20:25 +0200..2014-08-29 11:20:25 +0200
#[75] pry(main)> DR::TimeParse.parse("today")
#=> 2014-08-22 17:30:00 +0200
#[76] pry(main)> DR::TimeParse.parse("today",range: true)
#=> 2014-08-22 11:00:00 +0200..2014-08-23 00:00:00 +0200
#[181] pry(main)> DR::TimeParse.parse("-3 years 2 minutes")
#-94672920
#=> 2011-08-22 20:01:34 +0200
#[182] pry(main)> DR::TimeParse.parse("+3.years+2.days")
#=> 2017-08-24 14:04:08 +0200
