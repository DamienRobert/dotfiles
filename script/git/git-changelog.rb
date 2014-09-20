#!/usr/bin/env ruby
#encoding: utf-8
#Stolen from http://felipec.wordpress.com/2012/10/14/progress-and-ruby/
#output a changelog format

#Usage: git-changelog [-va] [branch]
#-a: for each release add a summary of authors contributions
#-v: group commits by date and authors

require 'date'
require 'shellwords'

tags = {}
tag = nil
commits = []
verbose=ARGV.delete("-v") #sort commits by date/authors
show_authors=ARGV.delete("-a") #print authors for each release
branch=ARGV.first

class Commit
  attr_reader :author, :date, :tag

  def initialize(id, subject, author, date, tag)
    @id = id
    @author = author
    @date = Date.parse(date)
    @subject = subject
    @tag = tag
  end

  def to_s
    return @subject
  end
end

open("|git for-each-ref --format='%(objectname) %(refname:short)' refs/tags").each do |l|
  commit, id = l.chomp.split(" ")
  #commit is the hash of the tag, we need the hash of the commit
  commit = %x/git rev-parse #{commit}^{commit}/.chomp
  tags[commit] = id
end
#puts tags

open("|git log --oneline --format='%H%x00%an%x00%ai%x00%s'"+ (branch.nil? ? '':" "+Shellwords.escape(branch))).each do |l|
  begin
    commit, author, date, subject = l.chomp.split("\0")
  rescue StandardError => ex
    STDERR.write(ex)
    next
  end
  tag = tags[commit] if tags[commit]
  #print "commit: #{commit} => tag: #{tag}\n"
  commits << Commit.new(commit, subject, author, date, tag)
end

commits.group_by(&:tag).each do |tag, commits|
    if tag.nil?
      branch=%x/git current-branch/.chomp if branch.nil?
      puts "== Current '#{branch}' (#{commits.first.date}) ==\n\n"
    else
      puts "== Release #{tag} (#{commits.first.date}) ==\n\n"
    end
    if verbose
      commits.group_by(&:date).sort.reverse.each do |date, commits|
        commits.group_by(&:author).each do |author, commits|
          puts "#{date}\t#{author}\n"
          puts commits.map { |e| "\t* #{e}" }.join("\n")
          puts "\n"
        end
      end
    else
      puts commits.map { |e| "\t* #{e}" }.join("\n")+"\n\n"
    end
    if show_authors
      authors=commits.group_by(&:author).sort
      puts "  By "+authors.map { |e| "#{e.first} (#{e[1].length})" }.join(", ")+"\n\n"
      #puts "  By "+commits.map { |e| e.author }.sort.uniq.join(", ")+"\n\n"
    end
end
