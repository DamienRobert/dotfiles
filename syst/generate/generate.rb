#!/usr/bin/env ruby
require "optparse"
require 'config/process_files'
require 'config/computers'
require_relative '../pkgs/packages'

$VERBOSE=2 #warnings
include DR::CLILogging
#logger.level=Logger::DEBUG
logger.progname=$0

#helper for scripts in extra/
def write_file(filename,content)
	logger.info "- #{filename}"
	file=@out+filename
	file.dirname.mkpath
	file.write(content)
end

def generate(computer,init:false,dest: nil)
	gendir=Pathname.new(ENV['HOME'])+"mine/syst/generate"
	indir=gendir+"slash"
	extradir=gendir+"extra"

	computer=DR::Computer.new(computer)
	name=computer.name
	if dest
		outdir=Pathname.new(dest)
	else
		outdir=Pathname.new(ENV['HOME'])+"mine/syst/@comps"+name+"slash"
	end
	logger.info "output: #{outdir}"
	extraout=outdir
	notfilter=nil
	if init or computer[:syst][:type]=="server"
		notfilter=/lightdm|polkit-1|sysctl.d|powerpill/
	end
	log_and_do(Logger::DEBUG,:rm_rf,"#{outdir}", definee: FileUtils)
	logger.info "slash:"
	DR::Process.process_dir(computer,indir,outdir,notfilter:notfilter)
	logger.info "extra:"
	Pathname.glob(extradir+"*").each do |script|
		logger.debug "Handle #{script}, out #{outdir}"
		src=script.read
		#stolen from Erubis
		context = Erubis::Context.new(computer: computer,out: extraout, gendir: gendir)
		_proc=eval("Proc.new { #{src} }", binding(), '(process_files)')
		context.instance_eval(&_proc)
	end
end

$opts={}
optparse = OptionParser.new do |opt|
	opt.banner = "Generate slash files"
	opt.on("--[no-]init", "Minimal files needed for installation") do |v|
		$opts[:init]=v 
	end
	opt.on("--dest=dest", "Dest folder") do |v|
		$opts[:dest]=v
	end
end
optparse.parse!
case ARGV[0]
when nil 
	list = ['current']
when 'all'
	list = DR::Computers::List[:archlinux]
else
	list=ARGV
end
list.each do |l|
	generate(l,**$opts)
end
