#!/usr/bin/env ruby
require 'yaml'
require 'dr/timeparse'

class Person
	attr_accessor :name, :bday, :ybday

	def self.get_day(*args, range: :keep)
		return Time.now if args.empty?
		day=args.first
		if Range === day
			case range
			when :begin
				return day.begin
			when :end
				return day.end
			end
		end
		return day
	end

	def initialize(name,bday)
		@name=name
		if bday.class == Date then
			@bday=bday
		else
			@bday = DR::TimeParse.parse(bday).to_date
		end
		@ybday=Date.parse("#{@bday.month}/#{@bday.day}")
	end
	def <=>(el)
		return @ybday <=> el.ybday
	end

	def birthday?(*day)
		day=Person.get_day(*day)
		case day
		when Range
			first=day.begin
			last=day.end
			return (first.month < @bday.month or first.month == @bday.month && first.day <= @bday.day) &&
				(last.month > @bday.month or last.month == @bday.month && last.day >= @bday.day)
		else
			return day.month == @bday.month && day.day == @bday.day
		end
	end
	def age(*day)
		day=Person.get_day(*day, range: :end)
		ChronicDuration.output(day - @bday.to_time)
	end
	#round the age in years
	def bday_age(*day)
		day=Person.get_day(*day, range: :end)
		age=day.year-@bday.year
		age-=1 if day < @ybday
		return age
	end
	def to_s(*day)
		day=Person.get_day(*day, range: :end)
		@name+" (born #{@bday}, #{bday_age(day)}y)"
	end
end

if __FILE__ == $0
	require "optparse"
	$opts={file: "#{ENV['HOME']}/mine/script/anniversaire.yaml"}
	optparse = OptionParser.new do |opt|
		opt.banner = "Output coming birthdays"
		opt.on("--file=FILE", "Birthdays file") do |v| $opts[:file]=v end
		opt.on("--[no-]age", "Switch to age mode") do |v| $opts[:age]=v end
		opt.on("--[no-]crontab", "When run under a crontab") do |v| $opts[:crontab]=v end
	end
	optparse.parse!

	persons=YAML.load_file($opts[:file]).map do |name,bday|
		Person.new(name,bday)
	end

	args=ARGV
	args=[Time.now] if args.empty?
	if $opts[:age]
		args.each do |today|
			today = DR::TimeParse.parse(today)
			puts "On #{today}, the ages are", persons.map {|i| "- #{i.to_s(today)} [#{i.age(today)}]"}
		end
	else
		args.each do |today|
			today = DR::TimeParse.parse(today)
			personsbday = persons.select {|p| p.birthday?(today)}.sort
			unless personsbday.empty?
				puts "On #{today}, the birthdays are", personsbday.map {|i| "- #{i.to_s(today)}"} 
				exit 1 if $opts[:crontab]
			end
		end
	end
end
