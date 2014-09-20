#!/usr/bin/env ruby

require 'config/computers'
require 'dr/shell'
require 'optparse'
require 'base64'

$VERBOSE=2 #warnings
include DR::CLILogging
logger.progname=$0
logger.level=Logger::DEBUG

class Unison
	DefaultConfig=Pathname.new("#{DR::Computers::CFGFILES}/unison/default_config.prf")
	#expand is what we use to expand 'all' or 'default' types
	def initialize(comp,opts={})
		@opts=opts.dup
		@comp=DR::Computer.new(comp)
		@expand=DR::Computer.new(@opts[:expand]||@comp)
		@name=@comp[:hostname]
		get_vars
	end

	def get_vars
		@root1=ENV['HOME']
		@root2="ssh://#{@comp[:sshu]}"
		@uopts=@opts[:unison]
		@uopts.push("-servercmd", @comp[:unison][:path]) if @comp[:unison] && @comp[:unison][:path]
		@uopts.push(*oneway(@root1)) if @opts[:push]
		@uopts.push(*oneway(@root2)) if @opts[:pull]

		@prog=@opts[:prog]
		unless @prog
		current=DR::Computer.new("current")
			if current[:unison] && current[:unison][:path]
				@prog=current[:unison][:path] 
			else
				@prog="unison"
				@prog="unison-gtk" if File.executable?("/usr/bin/unison-gtk")
				@prog="unison-gtk2" if File.executable?("/usr/bin/unison-gtk2")
			end
		end
	end

	def oneway(from)
		#note: -noupdate includes -nodeletion already
		return ["-nocreation", from, "-nodeletion", from, "-noupdate", from]
	end

	def read(*files)
		r=""
		files.each do |file|
			file=Pathname.new(file) if String === file
			r+=file.read if file.exist?
		end
		return r
	end

	def typesname(*types)
		return types.join("-")
	end

	def readprefs(*types)
		r=""
		typesname=typesname(*types)
		types=types+[typesname] unless types.include?(typesname)
		types.each do |type|
			prefname="prefs-#{@name}-#{type}"
			#this will be the last pref file
			@prefname=prefname
			preffile="#{ENV['HOME']}/.unison/#{prefname}.prf"
			prefstaticfile="#{DR::Computers::CFGFILES}/unison/#{prefname}.prf"
			r+=read(prefstaticfile,preffile)
		end
		return r
	end

	def readconfig(*types)
		r=""
		configfiles=[]
		types.each do |type|
			configfiles.push("#{DR::Computers::CFGFILES}/unison/config-#{type}.prf")
			case type
			when "common","minimal","sh"
				configfiles.push("#{DR::Computers::CFGFILES}/unison/ignore-common")
			when "deploy"
				r+="follow = Name deploy/*\n"
			when "perso2"
				r+="follow = Name data/.XXX/*\n"
			end
		end
		#we don't read the config files at once to avoid replication
		configfiles.uniq.each do |f|
			r+=read(f)
		end
		follow=[]
		r.each_line do |l|
			follow.push($1) if l=~ /^path\s*=\s*(.*)$/
		end
		allfollow=[]
		#we need to follow the parents of each path in follow
		follow.each do |f|
			cur=Pathname.new(f)
			while cur.to_s != "."
				allfollow.push(cur.to_s)
				cur=cur.parent
			end
		end
		allfollow.uniq.each do |f|
			r+="follow = Path #{f}\n"
		end
		return r
	end

	def config(*types)
		typesname=typesname(*types)
		@configname="config-#{@name}-#{typesname}.prf"
		configfile=Pathname.new("#{ENV['HOME']}/.unison/#{@configname}")
		config=<<EOS+ DefaultConfig.read
root = #{@root1}
root = #{@root2}
EOS
		if ! @opts[:gui]
			config+=<<EOS
diff = gitdiff
merge = Name * -> screen -DmS unisonmerge vimdiff CURRENT1 CURRENT2 CURRENTARCHOPT
merge = Name .* -> screen -DmS unisonmerge vimdiff CURRENT1 CURRENT2 CURRENTARCHOPT
EOS
		end
		config+=readconfig(*types)
		config+=readprefs(*types)
		configfile.write(config)
	end

	def process(*types)
		config(*types)
		uopts=@uopts.dup.push("-addprefsto", @prefname)
		logger.debug("- Syncing #{@comp[:hostname]} with types #{types}")
		DR::SH.sh(@prog, *uopts, @configname, log: true)
	end

	def expand_types(*types)
		exptypes=[]
		if types.empty?
			types=["default"]
		end
		types.each do |t|
			case t
			when "default"
				exptypes.push @expand[:unison][:type].first
			when "all"
				exptypes.push *@expand[:unison][:type]
			when "init"
				exptypes.push @expand[:unison][:init]
			else
				exptypes.push t
			end
		end
		return exptypes
	end

	def sync(*types)
		types=expand_types(*types)
		if @opts[:cat]
			process(*types)
		else
			types.each do |t|
				process(t)
			end
		end
	end

end

class UnisonSync
	#Script=DR::Computers::MYFILES+"script/unison.rb"
	#we need a relative path
	Script=Pathname.new("mine/script/unison.rb")
	def initialize(opts={})
		server=opts.delete(:server)
		@server=DR::Computer.new(server)
		@opts=opts.dup
		#@server=nil
		#if comp=="auto"
		#	expand="current"
		#	comp=$opts[:server]
		#else
		#	@server=DR::Computer.new($opts[:server]) if $opts[:server] and $opts[:server] != "current"
		#end
	end

	def process(*args)
		if @server.name.nil? or @server === "current"
			args.each do |a|
				Unison.new(a,@opts).sync(*@opts[:type])
			end
		else
			args=["current"] if args.empty?
			args.each do |a|
				a=DR::Computer.new(a)
				if a === "current"
					#hack so that we save an ssh
					opts=@opts.dup
					opts[:expand]||=a
					Unison.new(@server,opts).sync(*@opts[:type])
				else
					logger.debug("- Going through server #{@server[:hostname]}")
					DR::SH.sh("#{$opts[:ssh]} #{@server[:sshu]} \". ./.initenv; #{Script.to_s} --deserialize #{Base64.strict_encode64(Marshal.dump(@opts))} #{a.name}\"", log: true)
				end
			end
		end
	end

end

if __FILE__ == $0
	def gui(t)
		$opts[:gui]=t
		if t
			$opts[:unison].push('-ui', 'graphic')
		else
			$opts[:unison].push('-ui', 'text')
		end
	end

	$opts={gui: true, cat: true, ssh: 'ssh2 -Y', unison: [], type: []}
	optparse = OptionParser.new do |opt|
		opt.banner = "Wrapper around unison"
		opt.on("-b", "--batch", "unison batch mode") do |v| 
			#-batch accepts all non conflicting changes automatically
			#(works in graphic and text mode)
			$opts[:unison].push('-batch')
		end
		opt.on("-g", "--[no-]gui", "[on by default]") do |v| 
			#the gui option is on by default because we try to look for a -gtk binary
			gui(v)
		end
		opt.on("--auto", "unison -auto option") do |v|
			$opts[:unison].push('-auto')
			#this option (automatically accept non conflicting choices) only makes sense in ui=text
			gui(false)
		end
		opt.on("--prog PROG", "path to unison") do |v| 
			$opts[:prog]=v
		end
		opt.on("-o OPT1,OPT2", Array, "unison options") do |v| 
			$opts[:unison].push(*v)
		end
		opt.on("-t", "--type TYPE1,TYPE2", Array, "config types") do |v|
			$opts[:type].push(*v)
		end
		opt.on("--all", "use all types") do |v|
			$opts[:type].push("all")
		end
		opt.on("--expand computer", "how to expand default/all types") do |v|
			$opts[:expand]=v
		end
		opt.on("--[no-]cat", "cat types [on by default]") do |v|
			$opts[:cat]=v
		end
		opt.on("--[no-]push", "Push files") do |v|
			$opts[:push]=v
		end
		opt.on("--[no-]pull", "Pull files") do |v|
			$opts[:pull]=v
		end
#		-cpush) shift; PUSH=true; GUI=false; OPTS=($OPTS -auto) ;; #server mode
#		-cpull) shift; PULL=true; GUI=false; OPTS=($OPTS -auto) ;; #server mode
#		-batch ) #equivalent to 'myunison -c -b -push'
#					PUSH=true; GUI="false"; OPTS=($OPTS -ui text -batch)
#		-* ) OPTS=($OPTS $1); shift;;

		opt.on("--server SERVER", "server to connect to") do |v| 
			$opts[:server]=v
		end
		opt.on("--mode MODE", "inbound/outbound") do |v| 
			$opts[:sync]=v
		end
		opt.on("--ssh SSH", "ssh command") do |v| 
			v="default" unless v
			$opts[:ssh]=v
		end
		opt.on("-s", "--sync=[SYNC]", "sync mode") do |v| 
			case v
			when "perso"
				$opts[:server]="Feanor"
				$opts[:type].push("perso")
			when "perso2"
				$opts[:server]="Feanor"
				$opts[:type].push("perso2")
			when "photos"
				$opts[:server]="oimb"
				$opts[:type].push("perso")
			else
				$opts[:server]="imb"
			end
		end
		opt.on("--deserialize HASH", "[intern use]") do |v|
			$opts.merge!(Marshal.load(Base64.decode64(v)))
		end
	end
	optparse.parse!
	args=ARGV
	uopts=args.select {|a| a[0]=="-"}
	args-=uopts
	$opts[:unison]+=uopts
	UnisonSync.new($opts).process(*args)
end
