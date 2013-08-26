#!/usr/bin/env ruby
#encoding: utf-8
#Inspired by git://github.com/olivierverdier/zsh-git-prompt.git
require "open3"
require "pathname"
require "shellwords"
require "optparse"
require "simplecolor"
require "dr/git"
SimpleColor.mix_in_string

module GitStatus
  module Run
    extend(self)
    #if we get interrupted once, we don't want to launch any more commands
    @interrupted=false
    def runstatus(*args)
      if !@interrupted
        begin
          if Open3.respond_to?(:capture3) then
            out, error, status=Open3.capture3(*args) 
            return out, status.success?
          else
            out = `#{args} 2>/dev/null`
            status=$?
            return out, status.success?
          end
        rescue Interrupt #interruption
          @interrupted=true
          return "", false
        end
      else
        return "", false
      end
    end
    def run(*args)
      msg,_=runstatus(*args)
      return msg
    end
  end
  
  class Git
    include GitStatus::Run
    attr_reader :msg

    def git?
      if @git.nil?
        _,@git=runstatus "git rev-parse"
      end
      return @git
    end
    def getgitdir 
      return Pathname.new((run "git rev-parse --git-dir").chomp)
    end
    def ingitdir?
      return (run "git rev-parse --is-inside-git-dir") == "true\n"
    end
    def worktree?
      return (run "git rev-parse --is-inside-work-tree") == "true\n"
    end
    def bare? 
      return (run "git rev-parse --is-bare-repository") == "true\n"
    end

    def cd_and_exec(*args)
      if @path.nil? then
        yield(*args)
      else
        Dir.chdir(@path) do
          yield(*args)
        end
      end
    end

    def initialize(path=nil)
      #a nil path means we want information on the current directory
      if !path.nil?
        @path=Pathname.new(path).expand_path
      end
      cd_and_exec {git?}
    end
  
    def get_msg
      #gitst="git status --porcelain --branch"
      #too many git are too old to mix --porcelain with --branch
      gitm=git="git"
      gitm="#{git} -c color.ui=always" if $opts[:color]
      gitm="#{gitm} status --short --branch"
      @msg=run(gitm)
    end

    def describe_detached_head
      case $opts[:describe]
      when "sha1"
        describe=(run "git rev-parse --short HEAD").chomp!
      when "describe"
        describe=(run "git describe HEAD").chomp!
      when "contains"
        describe=(run "git describe --contains HEAD").chomp!
      when "branch"
        describe=(run "git describe --contains --all HEAD").chomp!
      when "match"
        describe=(run "git describe --tags --exact-match HEAD").chomp!
      when "all" #try --contains all, then --all
        describe=(run "git describe --contains --all HEAD").chomp!
        describe=(run "git describe --all HEAD").chomp! if describe.nil? or describe.empty?
      else
        describe=(run($opts[:describe])).chomp!
      end
      if describe.nil? or describe.empty?
        describe=(run "git rev-parse --short HEAD").chomp!
      end
      @branch=":#{describe}"
    end

    def parse_head(head)
      @ahead=@behind=0
      if (head =~ /## Initial commit on (\S*)/) then
       @branch="#{$1}…"
      elsif (head =~ /## (\S*) \(no branch\)/) then
        describe_detached_head
      elsif (head =~ /## (\S*)(.*)/) then
        branchs=$1
        rest=$2
        if (branchs =~ /(\S*)\.\.\.(\S*)/) then
          @branch=$1
          remote=$2
        else
          @branch=branchs
        end
        if (rest =~ /.*\[ahead\s+(\d*)(.*)/) then
          @ahead=$1.to_i
          rest=$2
        end
        if (rest =~ /.*behind\s+(\d*)\]/) then
          @behind=$1.to_i
        end
      end
    end

    def parse_msg
      msg=@msg
      #find the branch name, and if we are behind/ahead of upstream
      lines=msg.uncolor.lines.to_a
      return if lines.empty?
      head=lines.shift
      parse_head(head)

      #get status of files
      @changed=@staged=@untracked=@conflicts=0
      lines.each do |line|
        index = line[0];
        workdir = line[1];
        #puts "index: #{index}, workdir: #{workdir}"
        if index=~/[DRAMT]/ then
          @staged+=1
        end
        if workdir=~ /[MT]/ then
          @changed+=1
        end
        if workdir=='?' && index=='?' then
          @untracked+=1
        end
        if workdir=='U' && index=='U' then
          @conflicts+=1
        end
      end
      @clean=true
      @clean=false if @staged != 0 || @changed !=0 || 
                      @untracked !=0 || @conflicts !=0
    end

    def get_status
      if worktree?
        get_msg
        parse_msg
        if $opts[:sequencer] and !@msg.empty?
          @sequencer=""
          gitdir=getgitdir
          if (gitdir+"rebase-merge").directory?
            if (gitdir+"rebase-merge/interactive").file?
              @sequencer<<" rb-i " #REBASE-i
            else
              @sequencer<<" rb-m " #REBASE-m
            end
            @sequencer<<(gitdir+"rebase-merge/head-name").read.chomp.sub(/^refs\/heads\//,"")
          end
          if (gitdir+"rebase-apply").directory?
            if (gitdir+"rebase-apply/rebasing").file?
              @sequencer<<" rb" #RB
            elsif (gitdir+"rebase-apply/applying").file?
              @sequencer<<" am" #AM
            else
              @sequencer<<" am/rb" #AM/REBASE
            end
          end
          if (gitdir+"MERGE_HEAD").file?
            @sequencer<<" mg" #MERGING
          end
          if (gitdir+"CHERRY_PICK_HEAD").file?
            @sequencer<<" ch" #CHERRY-PICKING
          end
          if (gitdir+"BISECT_LOG").file?
            @sequencer<<" bi" #BISECTING
          end
          _,stashstatus=runstatus "git rev-parse --verify refs/stash"
          if stashstatus
            stashs=run "git rev-list -g refs/stash"
            @sequencer<<" $#{stashs.lines.to_a.length}" #Stash
          end
        end
        return !@msg.empty?
      else
        if $opts[:sequencer]
          if ingitdir?
            if bare?
              @branch="|bare|"
            else
              @branch="|.git|"
            end
          end
        end
      end
      return false
    end
  
    def status
      cd_and_exec { get_status } if git?
    end
  
    def prompt
      if status
        return "(" <<
         @branch.color(:magenta,:bold) <<
        (@ahead==0 ? "" : "↑"<<@ahead.to_s ) <<
        (@behind==0 ? "" : "↓"<<@behind.to_s ) <<
        "|" <<
        (@staged==0 ? "" : ("●"+@staged.to_s).color(:red) ) <<
        (@conflicts==0 ? "" : ("✖"+@conflicts.to_s).color(:red) ) <<
        (@changed==0 ? "" : ("✚"+@changed.to_s).color(:blue) ) <<
        (@untracked==0 ? "" : "…" ) <<
        (@clean ? "✔".color(:green,:bold) : "" ) <<
        (@sequencer.empty? ? "" : @sequencer.color(:yellow) ) <<
        ")"
      else
        return "(" << @branch.color(:magenta,:bold) << ")" if @branch
      end
    end
  
    def porcelain
      if git?
        return "#{@branch}\n#{@ahead}\n#{@behind}\n#{@staged}\n#{@conflicts}\n#{@changed}\n#{@untracked}\n#{@clean?1:0}\n#{@sequencer}\n"
      else
        return ""
      end
    end
  end
end

$opts={:color => true, :indent => nil, :sequencer => true, :describe => "all"}
optparse = OptionParser.new do |opt|
  opt.banner= "#{File.basename($0)} [options] git_dirs"
  opt.on("-p", "--[no-]prompt", "To be used in shell prompt", "This ensure that color ansi sequence are escaped so that they are not counted as text by the shell") do |v|
    $opts[:prompt]=v
  end
  opt.on("--[no-]porcelain", "Don't format the status but output it in a machine convenient format") do |v|
    $opts[:porcelain]=v
  end
  opt.on("-s", "--[no-]status", "List file", "Print the output of git status additionally of what this program parse") do |v|
    $opts[:status]=v
  end
  opt.on("-c", "--[no-]color", "Color output", "on by default") do |v|
    $opts[:color]=v
  end
  opt.on("--[no-]sequencer", "Show sequencer data (and also look for bare directory)", "on by default") do |v|
    $opts[:sequencer]=v
  end
  opt.on("--indent spaces", Integer, "Indent to use if showing git status", "2 by default, 0 for empty ARGV") do |v|
    $opts[:indent]=v
  end
  opt.on("--describe sha1/contains/branch/match/all", "How to describe a detached HEAD", "'all' by default") do |v|
    $opts[:describe]=v
  end
end
optparse.parse!

if !$opts[:color]
  SimpleColor.enabled=false
end

if $opts[:porcelain]
  puts GitStatus::Git.new.porcelain
elsif $opts[:prompt]
  SimpleColor.enabled=:shell
  prompt=GitStatus::Git.new.prompt
  puts prompt if prompt #in ruby1.8, puts nil output nil...
else
  args=ARGV
  if args.empty?
    $opts[:indent]=0 unless $opts[:indent]
    args=[nil]
  else
    $opts[:indent]=2 unless $opts[:indent]
  end
  args.each do |dir|
    g=GitStatus::Git.new(dir)
    puts "#{if dir then dir+": "; end}#{g.prompt}"
    if $opts[:status]
      g.msg.lines.each do |line|
        print " "*$opts[:indent] + line
      end
    end
  end
end
