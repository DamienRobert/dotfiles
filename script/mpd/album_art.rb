#!/usr/bin/env ruby
require 'pathname'
require 'ruby-mpd'

class FetchAlbum
	ImagesExt=%w(jpg png jpeg)
	MusicDir=Pathname.new(ENV['HOME'])+"Music"
	Covers=MusicDir+".covers"

	attr_accessor :mpd
	def initialize(mpd)
		@mpd=mpd
	end

	def get_current_song
		mpd.current_song
	end

	def infos_from_song(song)
		dir=Pathname.new(song.file).dirname
		dir=MusicDir+dir unless dir.absolute?
		return song.artist, song.album, dir
	end

	def infos_from_current_song
		infos_from_song(get_current_song)
	end

	def glob_in_dir(dir, glob, ignore_case: false)
		flags=[]
		flags<< File::FNM_CASEFOLD if ignore_case
		Dir.chdir(dir) do
			begin
			# puts "dir: #{dir}, glob: #{glob}"
				return Dir.glob(glob, *flags).map {|p| dir+p}
			# rescue ArgumentError: invalid byte sequence in UTF-8
			# This only happen with ignore_case: true and looks like a ruby bug
			rescue ArgumentError => e
				# require 'pry'; binding.pry
				warn e
				return []
			end
		end
	end

	def images_pattern
		"{#{ImagesExt.join(',')}}"
	end

	def images_in_path(dir)
		glob_in_dir(dir, "*#{images_pattern}", ignore_case: true)
	end

	def sanitize(name)
		name.tr(',\/:<>?*| ','_').gsub('"',"'")
	end
	def escape_glob(s)
		r=s.clone
		chars='\*?[]{}' #it is important to escape '\' first
		chars.each_char do |c|
			r.gsub!(c,"\\#{c}")
		end
		r.gsub!('/','|')
		r
	end

	def stored_covers(artist, album)
		return [] unless artist and album
		glob_in_dir(Covers, "##{escape_glob artist}##{escape_glob album}#*#{images_pattern}", ignore_case: true)+
			glob_in_dir(Covers, "##{escape_glob sanitize artist}##{escape_glob sanitize album}#*#{images_pattern}", ignore_case: true)
	end

	def filter_cover(covers)
		covers.reject {|c| c.symlink? and c.readlink.basename.to_s=="unknown.png"}
	end

	def select_cover(images)
		filter_cover(images).max {|a,b| a.size <=> b.size}
	end

	#dl: do we try to download the album art if not found
	#block: called before a dl
	def find_cover(artist, album, dir, dl: true)
		#First try to find a cover in the album dir
		#SH::Pathname.new(dir).glob(ImagesGlob) #do it directly
		imgs=dir ? images_in_path(dir) : []
		return select_cover(imgs) unless imgs.empty?

		return nil unless artist and album #sanity check
		imgs=stored_covers(artist, album)
		# this returns nil if we only have covers symlinked to unknown.png
		return select_cover(imgs) unless imgs.empty?

		if dl
			yield if block_given?
			result=dl_covers(artist, album)
			case result
			when :found
				imgs=stored_covers(artist, album)
				return select_cover(imgs) unless imgs.empty?
			when :notfound
				#if we reach here the cover was not found
				unknown_album(Covers+(sanitize("##{artist}##{album}#unknown.png")))
			when :unavailable
				#do nothing
			end
		end

		nil #not found
	end

	#don't try again
	def unknown_album(cover_path)
		cover_path.make_symlink("unknown.png") unless cover_path.exist?
	end

	def dl_covers(artist, album)
		return unless artist and album
		#:artist:_:album:_:title:_:type:_:number:.:format:
		fmt="#:artist:#:album:#:number:.:format:"
		require 'shell_helpers/utils'
		glyrc=ShellHelpers::Utils.find_executable('glyrc')
		if glyrc
			system("ping", "-c", "1", "last.fm")
			return :unavailable if $? != 0
			system(glyrc.to_s, "cover", "-a", artist, "-b", album, "-w", Covers.to_s+"/#{fmt}")
			$?==0 ? :found : :notfound
		else
			warn 'glyrc not found'
			:unavailable
		end
	end

	def cover_from_song(song, dl: true, &b)
		find_cover(*infos_from_song(song), dl: dl, &b)
	end
	def cover_from_current_song(dl: true, &b)
		find_cover(*infos_from_current_song, dl: dl, &b)
	end
end

if __FILE__==$0
	mpd = MPD.new((Pathname.new(ENV['XDG_RUNTIME_DIR'])+"mpd_sock").to_s)
	mpd.connect
	puts FetchAlbum.new(mpd).cover_from_current_song(dl: true)
end
