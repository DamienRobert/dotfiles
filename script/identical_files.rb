#!/usr/bin/env ruby

require 'dr/sh'
require 'digest'
require 'slop'

module Slop
  class PathOption < Option
    def call(value)
      DR::Pathname.new(value)
    end
  end
  class SymbolOption < Option
    def call(value)
      value.to_sym
    end
  end
end

#return {digest: [files]}
def digest(*dirs, digest_method: :md5)
	id_files={}
	SH.find(*dirs, filter: [:directory?,:symlink?]) do |filerel|
		#next if ! filerel =~ /.*\.(jpg|JPG)/ #filter
		case digest_method
		when :md5
			digest = (Digest::MD5.file filerel).hexdigest
		when :name
			digest = filerel.basename
		end
		(id_files[digest]||=[]) <<filerel
	end
	return id_files
end

def filter(id_files, values=[])
	return id_files unless values and values != []
	id_files.keep_if do |k,v|
		values.include?(k)
	end
end

def detect_same_files(id_files, verbose: false)
	same_files=[]
	id_files.select {|k,v| v.length > 1}.each do |k,v|
		same_files << v
		if verbose
			puts "# digest: #{k}"
			v.each do |file|
				puts "- #{file}"
			end
		end
	end
	same_files
end

#same_files is an array of array: [[file1,file1bis],[file2,file2bis]]
def move_files(dir,same_files)
	first= dir.to_s==":first"
	last= dir.to_s==":last"
	dir.mkpath unless first or last
	same_files.each do |files|
		f,*rest=files
		if first
			new_file=f
			files=rest
		elsif last
			*files,new_file=files
		else
			new_file=(dir+f.basename).nonexisting_name
			f.mv(new_file,verbose:true) or raise "Can't move file '#{f}': #{$!}"
		end
		files.each do |file|
			#rel=new_file.relative_path_from(file.dirname)
			rel=file.rel_path_to(new_file)
			#puts "file: #{file}, new_file: #{new_file}, rel: #{rel}"
			file.on_ln_s(rel, rm: :file,verbose:true) or raise "Can't symlink '#{file}': #{$!}"
		end
	end
end

opts = Slop.parse ARGV do |o|
  o.path '--path', 'where to move (and then ln -s) the identical files'
  o.bool '--rm', 'rm files which are already in the last directory'
  o.bool '--symlink', 'symlink files which are already in the last directory'
  o.symbol '--digest', 'digest to use'
  o.array '--values', 'only use on these digest values'
end

args=opts.arguments
args=['.'] if args.empty?
args.map! {|x| SH::Pathname.new(x)}
opts[:digest]||=:md5

if opts[:symlink] || opts[:rm]
	last=args.pop
	old_digests=filter(digest(last, digest_method: opts[:digest]), opts[:values])
	digest(*args, digest_method: opts[:digest]).each do |k,v|
		if old_digests.keys.include?(k)
			if opts[:rm]
				puts "rm -f #{v.shelljoin};"
			else
				v.each do |file|
					rel=file.rel_path_to(old_digests[k].first)
					file.on_ln_s(rel, rm: :file,verbose:true) or raise "Can't symlink '#{file}': #{$!}"
				end
			end
		end
	end
	exit 0
end

id_files=filter(digest(*args, digest_method: opts[:digest]), opts[:values])
same_files=detect_same_files(id_files,verbose:true)

if dir=opts[:path]
	move_files(dir,same_files)
end

#TODO:
#- option to change digest mode
#- equality check to see if files are truly identical

#Exemples:
#identical_files.rb . #show identical files
#identical_files.rb --rm foo bar #remove files in foo that exist in bar
#identical_files.rb --symlink foo bar #symlink files in foo that exist in bar
#identical_files --path bak #move the identical files into bak/ and symlink them
#identical_files --path :first/:last #keep the first/last identical file on the list and symlinks the others to it
