vim: foldmethod=expr ft=markdownlight

# Libraries
- forwardable, singleton, openstruct, delegate:
  see metaprograming
  http://ruby-doc.org/stdlib-2.2.0/libdoc/singleton/rdoc/Singleton.html
  http://ruby-doc.org//stdlib-2.2.0/libdoc/forwardable/rdoc/Forwardable.html
  http://ruby-doc.org/stdlib-2.1.0/libdoc/delegate/rdoc/Delegator.html
  http://ruby-doc.org//stdlib-2.0/libdoc/ostruct/rdoc/OpenStruct.html
- Monitor
  http://ruby-doc.org//stdlib-2.2.0/libdoc/monitor/rdoc/Monitor.html
  To have locks
- rake:
  https://github.com/ruby/rake
  http://martinfowler.com/articles/rake.html

# Enumerable
- http://ruby-doc.org/core-2.2.0/Enumerable.html
all?(&b),any?(&b),one?(&b),none?(&b)
include? (=member?)
each_entry, each_cons, each_slice, each_with_index, each_with_object, reverse_each
select (=find_all), reject, map (=collect), flat_map, cycle, inject (=reduce)
find (=detect), find_all (=select), find_index, grep (comme 'select', mais
matche via patern === item)
first, drop, drop_while, take, take_while
group_by, partition, slice_when, slice_before, slice_after
count [can pass a value or a block and count the number of matching items]
min,min_by,max,max_by,minmax,minmax_by
sort,sort_by
lazy, to_a, to_h, to_set

# Enumerator
- http://ruby-doc.org/core-2.2.0/Enumerator.html
each(*appending_args,&b)
with_index(num=0,&b) [each_with_index = with_index(0)]
with_object(obj) (=each_with_object)
next, feed, next_values, peek, peek_values, inspect
rewind,size

# Array
- http://ruby-doc.org//core-2.2.0/Array.html
Array.new(size, default) (or block for default)

Array#slice (= []): array[el], array[start,length], array[range]
Array#fill (= []=); Array#slice! [delete the sliced elements]
each, each_index
at, values_at(*index), fetch, assoc, rassoc, bsearch, find_index (=index), rindex, sample
first, last, take, drop, drop_while, select, reject #non destructive
push (=<<), pop, unshift, shift
clear, delete, delete_at, delete_if, reject!, keep_if, insert, replace
[reject! returns nil if no changes were made, delete_if always return the array]
size (=length) count [like size but can take a value or a block]
empty?, include?
compact, compact!, uniq, uniq!, sort, sort!, sort_by!, map! (=collect!), flatten, flatten!, reverse, reverse!, rotate, rotate!, shuffle, shuffle!
combination, repeated_combination, product, permutation, repeated_permutation, zip
&, *, +, -, | [union]
join, pack, transpose, to_a, to_h

# Hash
- http://ruby-doc.org//core-2.2.0/Hash.html
Hash[key,value...], Hash[[key,value],...],Hash[obj]
Hash.new,Hash.new(obj),Hash.new {|hash,key|}
assoc, rassoc, fetch, key, keys, values, values_at, store (= []=)
each (=each_pair), each_key, each_value
clear, compare_by_identity[?], default, default_proc
delete(key,&b),delete_if, keep_if, select, reject
empty?, has_key? (=include?,key?,member?), has_value? (=value?)
to_a, flatten(level), invert, merge[!] (merge!=update), replace, shift
length (=size)

# Set
- http://ruby-doc.org//stdlib-2.1.1//libdoc/set/rdoc/Set.html

Set[*elts], Set.new(enumerable)
- proper_subset? (= <), subset? (= <=), proper_superset? (= >), superset? (= >=)
- intersection(enum) (= &), difference(enum) (= -, =substract), union (= |, =+), ^ (xor)
- add (= <<), add?, delete, delete?, delete_if, reject!, keep_if, select!, merge, replace
- include?, member?, disjoint?, intersect?, empty?
- classify, divide
- map! (=collect!), flatten, flatten!
- length (=size)

# String
- http://ruby-doc.org//core-2.2.0/String.html
Rem: not exhaustive; the rule for 'count' is used by 'delete' and 'squeeze'

slice[!]: str[index], str[index,length], str[range], str[regexp], str[regexp,capture], str[str2]
index, rindex
*, % (=sprintf), scan
each_char, each_line, lines, chars [=each_char.to_a], chr [first character]
chomp[!](separtor=$/), chop[!], lstrip[!], rstrip[!], strip[!], squeeze[!]
count, size (=length)
empty?, end_with?, include?, start_with?
replace, insert, delete[!], concat (= <<) [like + but convert to string], prepend
capitalize[!], center, clear, downcase[!], dump, ljust, reverse[!], rjust, swapcase, upcase[!]
encode, scrub[!], unpack
gsub[!], sub[!], match, split, tr[!]
next[!] (=succ), upto, partition, rpartition, sum, casecmp
intern (= to_sym), to_c,to_f,to_i,to_r,to_s,to_str,to_sym

# Time
## Time in standard library
- http://ruby-doc.org//core-2.2.0/Time.html
- http://ruby-doc.org/stdlib-2.0/libdoc/time/rdoc/Time.html
  (available with require 'time': more conversion methods)

Time vs DateTime
- http://stackoverflow.com/questions/1261329/whats-the-difference-between-datetime-and-time-in-ruby
- http://stackoverflow.com/questions/5941613/are-the-date-time-and-datetime-classes-necessary
Summary: use Date if you only want to deal with dates
DateTime is like a Date+Time, but DateTime does not consider any leapseconds, does not track any summer time rules.
So except if you want to ignore DST, use Time (before Time date range was
limited, but now it uses a 63bits integer so it can represent a large
range)

Constructing time:
Time.local(year,month...),Time.gm(year,month...),Time.iso8601,Time.xmlschema,Time.httpdate,Time.utc,Time.rfc2822
Time.now,Time.parse,Time.at(seconds)...
Conversion: t.iso8601=t.xmlschema,t.rfc2822=t.rfc922,t.httpdate,t.utc,t.localtime

~~~ ruby
  require time
  t=Time.now
  #=> 2012-11-30 17:31:13 +0100
  
  t.iso8601 #=t.xmlschema
  #=> "2012-11-30T17:31:13+01:00"
  Time.iso8601(t.iso8601)
  #=> 2012-11-30 16:31:13 UTC
  
  t.rfc2822 #=t.rfc822
  #=> "Fri, 30 Nov 2012 17:31:13 +0100"
  Time.rfc2822(t.rfc2822)
  #=> 2012-11-30 16:31:13 UTC
  
  t.utc
  #=> 2012-11-30 16:31:13 UTC
  t.httpdate
  #=> "Fri, 30 Nov 2012 16:31:13 GMT"
  Time.httpdate(t.httpdate) #parse a httpdate date
  #=> 2012-11-30 17:31:13 +0100
  
  Time.parse("11/2012")
  #=> 2012-11-01 00:00:00 +0100
  Time.parse("11/11")
  #=> 2012-11-11 00:00:00 +0100
  
  #Time.parse marche sur xmlschema, rfc2822 et httpdate
  #Chronic.parse ne marche que sur xmlschema
  
  #Ex: optparse/time est donné par
  require 'optparse'
  require 'time'
  OptionParser.accept(Time) do |s,|
    begin
      (Time.httpdate(s) rescue Time.parse(s)) if s
    rescue
      raise OptionParser::InvalidArgument, s
    end
  end
~~~

## Time with active support
http://danilenko.org/2012/7/6/rails_timezones/
=> require 'active_support/time'
Can use a timezone different from the system time zone
Time.zone='CET'
Time.zone.class #=> ActiveSupport::TimeZone
Time.zone.now
-> Adds Time#in_time_zone:
Returns the simultaneous time in <tt>Time.zone</tt> if a zone is given or
if Time.zone_default is set. (set by Time.zone=...)
-> Or if tz is a TimeZone we have tz.at(time):
Method for creating new ActiveSupport::TimeWithZone instance in time zone
of self from number of seconds since the Unix epoch.

~~~ ruby
require 'active_support/all'
tz=ActiveSupport::TimeZone['Europe/Paris'] #alias for ActiveSupport::TimeZone.new("Europe/Paris") #=> (GMT+01:00) Europe/Paris
Time.zone="Alaska" #default time zone
tz=ActiveSupport::TimeZone['America/Los_Angeles']
t=Time.local(2012) #=> 2012-01-01 00:00:00 +0100
t.zone #=> "CET"
t.in_time_zone #=> Sat, 31 Dec 2011 14:00:00 AKST -09:00
t.in_time_zone(tz) #=> Sat, 31 Dec 2011 15:00:00 PST -08:00
t.in_time_zone("Europe/Paris") #=> Sun, 01 Jan 2012 00:00:00 CET +01:00
Time.zone.at(t) # => Sat, 31 Dec 2011 14:00:00 AKST -09:00
tz.at(t) #=> Sat, 31 Dec 2011 15:00:00 PST -08:00
Time.current #=> Thu, 26 Feb 2015 02:13:43 AKST -09:00
Time.zone.now #=> Thu, 26 Feb 2015 02:16:32 AKST -09:00
  # Where Time.zone.now is
  # class ActiveSupport::TimeZone
  #   def now
  #     Time.now.utc.in_time_zone(self)
  #   end
  # end
  # And Time#current is
  # def current
  #   ::Time.zone ? ::Time.zone.now : ::Time.now
  # end
~~~

(Active support add Time.current() (like Time.now() but with time zone
in Time.zone_default.)
By default Time.now.zone use the system time zone:
Time.new(2012): 2012 in system time zone #in std lib
Time.local_time(2012): 2012 in user time zone
Time.utc_time(2012): 2012 in utc time zone
Also add things like now=Time.current, now+1.year

# Logger

~~~ ruby
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::WARN

logger.debug("Created logger")
logger.info("Program started")
logger.warn("Nothing to do!")

original_formatter = Logger::Formatter.new
logger.formatter = proc { |severity, datetime, progname, msg|
  original_formatter.call(severity, datetime, progname, msg.dump)
}

 # 4. Create a logger which ages the logfile once it reaches a certain size.
 #    Leave 10 "old" log files where each file is about 1,024,000 bytes.
logger = Logger.new('foo.log', 10, 1024000)

 # 5. Create a logger which ages the logfile daily/weekly/monthly.
logger = Logger.new('foo.log', 'daily')
logger = Logger.new('foo.log', 'weekly')
logger = Logger.new('foo.log', 'monthly')

 # Level:
Logger.new(logdev, level: :info) # 'INFO' / Logger::INFO

 # Default log format:
 #    SeverityID, [DateTime #pid] SeverityLabel -- ProgName: message
 # => I, [1999-03-03T02:34:24.895701 #19074]  INFO -- Main: info.

def initialize(logdev, shift_age = 0, shift_size = 1048576, level: DEBUG,
               progname: nil, formatter: nil, datetime_format: nil,
               shift_period_suffix: '%Y%m%d')
end
attr_accessor :progname, :formatter
datetime_format=

def level=(severity)
  if severity.is_a?(Integer)
    @level = severity
  else
    case severity.to_s.downcase
    when 'debug'
      @level = DEBUG
    ...
    end
  end
end

  Logger#add(severity, message = nil, progname = nil) { ... }
  def add(severity, message = nil, progname = nil)
    severity ||= UNKNOWN
    if @logdev.nil? or severity < @level
      return true
    end
    if progname.nil?
      progname = @progname
    end
    if message.nil?
      if block_given?
        message = yield
      else
        message = progname
        progname = @progname
      end
    end
    @logdev.write(
      format_message(format_severity(severity), Time.now, progname, message))
    true
  end

  #   Logger#info(message)
  #   Logger#info(progname, &block)
  def info(progname = nil, &block)
    add(INFO, nil, progname, &block)
  end
  def format_message(severity, datetime, progname, msg)
    (@formatter || @default_formatter).call(severity, datetime, progname, msg)
  end
~~~
