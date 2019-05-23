#!/usr/bin/env ruby
require 'pathname'
require 'ruby-mpd'
begin
	require 'libnotify'
rescue LoadError
	#Libnotify is not available, stub it
	class Libnotify
		def initialize(*args)
		end
		def update(*args)
		end
	end
end
require 'cgi'
require_relative "album_art"

class Notify

	attr_accessor :mpd
	attr_reader :song, :status
	def initialize(mpd, song=:current)
		@mpd=mpd
		@status=mpd.status
		@song= song==:current ? @mpd.current_song : song
	end

	def show_seconds(time)
		"#{"%02i" % (time/60)}:#{"%02i" % (time%60)}"
	end

	def infos(escape_html=false)
		artist=@song.artist
		albumartist=@song.albumartist
		composer=@song.composer
		performer=@song.performer
		album=@song.album
		track=@song.track
		title=@song.title
		filename=@song.file
		disc=@song.disc

		if escape_html
			b = binding
			[:artist,:albumartist,:composer,:performer,:album,:title,:filename,:disc].each do |var|
				val=b.local_variable_get(var)
				#we reconvert back '&quot;' to '"'
				b.local_variable_set(var, CGI.escapeHTML(val.to_s).gsub("&quot;",'"')) if val
			end
		end

		filename=Pathname.new(filename)
		elapsed="#{show_seconds(@status[:time][0])}/#{show_seconds(@status[:time][1])}"
		playlist="#{@status[:song]+1}/#{@status[:playlistlength]}"
		volume=@status[:volume]
		state=@status[:state].to_s

		summary="#{artist}"
		body=""
		body << "Album Artist: <b>#{albumartist}</b>\t" if albumartist && albumartist != artist
		body << "Composer: <b>#{composer}</b>\t" if composer && composer != artist
		body << "Performer: <b>#{performer}</b>" if performer && performer != artist
		body << "\n" unless body.empty?
		body << "#{track}\t" if track
		body << "<b>#{title||filename.basename}</b>\t<i>#{album}</i>"
		body << " (#{disc})" if disc
		body << "\n"
		body+="[#{state}] #{elapsed}\t##{playlist} (Vol: #{volume}%)\n"
		return summary, body
	end

	def notify
		summary, body=infos(true)
		puts summary
		puts body
		fallback="multimedia-player"
		notif=Libnotify.new(summary: summary, body: body, icon_path: fallback)
		notified=false
		cover=FetchAlbum.new(@mpd).cover_from_song(@song) do
			#this block is only launched before a download of album art
			#this it may take some time we start the notification without the cover
			notif.update
			notified=true
		end
		puts "Cover: '#{cover}'" if cover
		#the logic is a bit complicated, if we did not launch the notification
		#already and we did not find a cover, we still want the fallback
		cover||=fallback if !notified
		notif.update(icon_path: cover.to_s) if cover
	end
end

class Mpc < MPD
	#some commands for mpd
	def pause
		self.pause=true
	end
	def toggle
		self.pause=nil
	end
	def prev
		self.previous
	end
end

if __FILE__==$0
	mpd = Mpc.new((Pathname.new(ENV['XDG_RUNTIME_DIR'])+"mpd_sock").to_s)
	mpd.connect
	mpd.send(*ARGV) unless ARGV.empty?
	Notify.new(mpd).notify
end
