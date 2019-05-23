#!/usr/bin/env ruby

require 'dr/sh'
require 'exifr/jpeg'
require 'time'
target=SH::Pathname.new("Chronological")
target.mkdir_p

def exif_date(file)
	file=file.to_s
	date=`exiftool -CreateDate #{file.shellescape}`.match(/.*: (.*)/) {|m| m[1]} or `exiftool -DateTimeOriginal #{file.shellescape}`.match(/.*: (.*)/) {|m| m[1]}
	date.sub!(':','-').sub!(':','-') if date
	date=Time.parse(date) if date
	date
end

def get_date(file)
	file=file.to_s
	case file
	when /\.jpg$/i
		date=EXIFR::JPEG.new(file).date_time_original
	else
		date=exif_date(file)
	end
	x265r=/\.x26.\.mkv$/
	if !date and file=~ x265r
		ofile=Pathname.new(file.sub(x265r,''))
		date=exif_date(ofile) if ofile.file?
	end
	date.xmlschema if date
#rescue
#	nil
end

SH.find(*(ARGV.empty? ? ['.'] : ARGV).map {|i| SH::Pathname.new(i)}) do |abs,rel,dir|
	if abs.file?
		next if abs.to_s =~ /chronological|sel|low/i
		date=get_date(abs)
		if date
			name=DR::Pathname.new(abs.split_all.map(&:to_s).join("#"))
			link=target+(date+"#"+name.to_s)
			DR::Pathname::Verbose.new(link).on_ln_s(link.rel_path_to(dir+rel))
		end
	end
end
