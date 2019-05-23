#!/usr/bin/env ruby 
# launch my programs when I log in (ie gogo)
require 'dr/config/computers'
require 'dr/sh'
require 'shellwords'

args=ARGV

c=DR::Computer.new
c.user_log("user", "~maint/00login (gogo)")
include SH::CLILogging

logger.info "## unlock"
begin
	SH.sh("unlock")

	if ENV['DISPLAY']
		logger.info("## unison")
		require 'dr/config/unison'
		_args,opts=DR::Unison::Sync.parse_opts(*args)
		DR::Unison::Sync.new(**opts, syncmode: true, detach: true).process
		(c[:user][:startup]||[]).each do |prog|
			st,_r=SH.sh(["pgrep",prog], log: false, :out => "/dev/null")
			if st
				logger.info("- Already running: #{prog}")
			else
				logger.info("- Starting: #{prog}")
				SH.sh(prog, {[:out, :err]=>"/dev/null"}, detach: true)
			end
		end
	end

	logger.info("## update? (press a key to continue)")
	STDIN.gets

	require 'dr/packages/maint'
	DR::Packages::Maint.process_args("update_or_check", shell: :exec)

	history_dir=c.file(:myfiles)+"@infos/history"
	logger.info "- #{history_dir}/dobackup (if not done in a long time)"
	SH.sh "git --git-dir=#{(history_dir+".git").to_s.shellescape} --no-pager ltm -n 5"
rescue Interrupt
	warn "Interrupt received, exiting"
	exit 1
end
