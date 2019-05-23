
require 'dr/sh'
require 'dr/base/eruby'
require 'dr/opts/process_helper'
require 'time'

module DR
	module Process
		include SH::CLILogging

		class Squel
			#functions to which the included scripts will have access
			module ContextHelper
				include SH::CLILogging
				def read_file(file)
					file=Pathname.new(file)
					file=@dir[:out]+file if file.relative?
					file.read
				end
				def write_file(file,content, perm: nil)
					file=Pathname.new(file)
					logger.info "- #{file}"
					file=@dir[:out]+file if file.relative?
					file.filewrite(content, mkpath: true, perm: perm)
				end
				def get_files(glob)
					files=[]
					@dir[:files].cd do
						files=Pathname.glob(glob)
					end
					files
				end
				def mkdir(dir)
					dir=Pathname.new(dir)
					logger.info "- [#{dir}]"
					dir=@dir[:out]+dir if dir.relative?
					dir.mkpath
				end
				def copy_file(file,dest=file,perm: nil)
					file=Pathname.new(file)
					dest=Pathname.new(dest)
					logger.info "- #{file} -> #{dest}"
					file=@dir[:files]+file if file.relative?
					unless file.exist?
						warn "In copy_file: file #{file} not found"
						return nil
					end
					dest=@dir[:out]+dest if dest.relative?
					dest.on_cp_r(file, mkpath: true)
					#warning: perm needs to be in octal here
					if perm
						if dest.directory?
							permdest=dest+file.basename
						else
							permdest=dest
						end
						permdest.chmod(perm)
					end
				end
				def write_symlink(file,link, out: @dir[:out], hardlink: false, **opts)
					file=Pathname.new(file)
					file=out+file if file.relative?
					logger.info "- #{file} -> #{link}"
					if hardlink
						file.on_ln(link, mkpath: true, **opts)
					else
						file.on_ln_s(link, mkpath: true, **opts)
					end
				end

				def symlink(base,target=Pathname.new(base).basename, clobber: true, check: true, verbose: false, **opts)
					base=Pathname.new(base)
					target=Pathname.new(target)
					# the target in out/
					realtarget=@dir[:commit]+target
					realbase=realtarget.dirname+base
					# the base in the intermediate output, before commit
					absbase=(@dir[:out]+target).dirname+base
					if !clobber and realtarget.may_exist?
						logger.warn "! #{realtarget} already exists" if verbose
						return nil
					end
					if (absbase.exist? or realbase.exist? or !check)
						write_symlink(target, base, rm: :symlink, **opts)
					else
						logger.warn "! #{realbase} does not exists"
					end
				end

				# checks if file_exists in @dir[:out] or @dir[:commit]
				def file_exist?(file)
					(@dir[:out]+file).exist? or (@dir[:commit]+file).exist?
				end

				def generated_from(comment=false)
					s="Generated from <#{self[:processor].instance_variable_get(:@current_file)}>"
					marker= comment.kind_of?(String) ? comment : "#"
					comment ? "#{marker}#{s}\n" : s
				end
			end

			include ContextHelper
			include SH::CLILogging
			SquelExit=Class.new(StandardError)

			private def handle_error(msg, e)
				logger.warn "#{msg}: #{e.message} (#{e.class}, #{e.backtrace.first})"
			end

			attr_accessor :computer, :opts, :context, :dir, :local_computer, :time

			def initialize(computer=nil,**opts)
				@computer = Computer.computer(computer)
				@local_computer= @computer.current? ? @computer : Computer.new
				@opts=opts
				@opts[:local]||=@computer.local?
				@opts[:current]||=@computer.current?
				@opts[:present]||=@computer.present?
				@dir=opts.delete(:dir)||{}
				@time=Time.now.iso8601
				set_dir
				set_context
				add_to_loadpaths(@dir[:helpers])
			end

			private def add_to_loadpaths(files)
				Array(files).each do |file|
					$LOAD_PATH << file unless $LOAD_PATH.include?(file)
				end
			end

			private def set_dir
				#the relative dir folder of files to generate
				dirname=@dir[:name]||""
				#like dirname, but for :out
				destdirname=@dir[:destname]||dirname

				#the squel folder 
				@dir[:gen]||=Pathname.new(@dir.fetch(:gen,"."))
				#folders to copy
				@dir[:copy]||=[@dir[:gen]+"squel", @dir[:gen]+"#{dirname}-local"+@computer.name]
				#the absolute dir folder of files to generate [after copy]
				@dir[:in]||=@dir[:gen]+dirname
				#script to run [after file generation]
				@dir[:scripts]||=@dir[:gen]+"scripts"
				#script to run [before file generation]
				@dir[:prescripts]||=@dir[:gen]+"prescripts"
				#folder of files accessible to scripts via read_file/copy_file
				@dir[:files]||=@dir[:gen]+"files"
				#configure script (called after commit)
				@dir[:configure]||=@dir[:gen]+"configure"

				#squel output of the generation step
				@dir[:dest]||=local_computer.file(:xdg_cache_home)+"@comps"+@computer.name
				#output folder of the files (for reviewing before commit)
				@dir[:out]||=@dir[:dest]+destdirname
				#where to snapshot original files for diff
				@dir[:snapshot]||=@dir[:dest]+"snapshot-#{destdirname}"
				#backup folder
				@dir[:backup]||=if @computer.present?
						@dir[:dest]+".rsync-#{destdirname}"
					else
						".cache/@comps/#{@computer.name}/.rsync-#{destdirname}"
					end

				#the target of the files we want to change
				#used for configuration when specifying a non local computer
				#ex: systemctl --root=@dir[:root] enable sshd.socket
				@dir[:target]||=@dir[:out] 
				#where commit will put the files (this may differ from target if
				#configure scripts modify files different from the ones we commit)
				@dir[:commit]||=@dir[:target] 
				@dir[:helpers]||=@dir[:gen]+"helpers"
			end


			private def set_context
				#processor contains the other ones but I still want to give easier access
				@context=Eruby::Context.new(computer: computer, local_computer: @local_computer, dir: @dir, processor: self)
				@context.extend(ContextHelper)
				#the functions defined in the script files will be singleton method
				#of @context, so they will be available to other scripts unless we
				#call set_context again to reinitialize @context. This allows
				#scripts to propagate information if needed
			end

			private def copy_id_file(id=true)
				require 'dr/config/configure/run.rb'
				Run.new(@computer).ssh_copy_id(id)
			end

			def local?
				@opts[:local]
			end
			def current?
				@opts[:current]
			end
			def present?
				@opts[:present]
			end
			def break_if_notlocal
				raise SquelExit.new("not local computer") unless local?
			end
			def break_if_notcurrent
				raise SquelExit.new("not current computer") unless current?
			end
			def break_if_notpresent
				raise SquelExit.new("not present computer") unless present?
			end
			def squel_exit(message)
				raise SquelExit.new(message)
			end

			def generate(cleanup_out:true,**opts)
				opts=@opts.merge(opts)
				logger.info "## Generate:\n"+ @dir.map { |k,v|
					"  #{k}=#{v}"
					}.join("\n")
				#be careful with this option!
				log_and_do(:rm_rf, definee: Pathname.new(@dir[:out]), severity: Logger::DEBUG) if cleanup_out
				@dir[:out].mkpath

				if block_given?
					yield @dir
				else
					logger.info "### Prescripts:"
					process_scriptdir(@dir[:prescripts],**opts)
					logger.info "### Copy"
					process_copy(@dir[:copy], @dir[:out])
					if opts[:copy_extra]
						logger.info "#### Extra copy: #{opts[:copy_extra]}"
						process_copy(opts[:copy_extra],@dir[:out],**opts)
					end
					to_rsync=@dir[:rsync]
					to_rsync && SH.rsync(*to_rsync, @dir[:out], relative: true)
					logger.info "### Dir"
					process_dir(@dir[:in],@dir[:out],**opts)
					if opts[:add_extra]
						logger.info "#### Extra files: #{opts[:add_extra]}"
						process_dir(opts[:add_extra],@dir[:out],**opts)
					end
					logger.info "### Scripts:"
					process_scriptdir(@dir[:scripts],**opts)
					if opts[:script_extra]
						logger.info "#### Extra scripts: #{opts[:script_extra]}"
						process_scriptdir(opts[:script_extra],@dir[:out],**opts)
					end
				end
			end

			# warning: process_copy is made to copy files under @dir[:copy]
			# it is better to call SH.rsync directly to copy files, indeed this
			# only calls rsync once
			# the file case in process_copy is only there for completude
			def process_copy(copy,out)
				copy=[*copy]
				copy.each do |din|
					if din.directory?
						logger.info "* copy #{din}/ to #{out}:"
						out.mkpath
						SH.rsync(din.to_s+"/",out)
					elsif din.file?
						logger.info "* copy #{din} to #{out}:"
						out.mkpath
						SH.rsync(din,out)
					else
						warn "File not found: #{din}"
					end
				end
			end

			#generate already handles cleanup_out, but we may want to call this
			#function directly hence I left this option here too
			def process_dir(indir,outdir,filter:nil,notfilter:nil,cleanup_out:false,keep_backup:false,clean_emptydir:true,**keywords)
				indirs=[*indir]
				logger.debug "Generating files for #{@computer} from #{indir} to #{outdir}"
				log_and_do(:rm_rf, definee: Pathname.new(@dir[:out]), severity: Logger::DEBUG) if cleanup_out
				outdir.mkpath
				handle_file = lambda do |file,filerel|
					begin
						out=outdir+filerel
						logger.debug "Handle #{file}, relative: #{filerel}, out #{out}"
						if file.directory?
							d=file
							d=file.dereference if d.symlink?
							d.copy_entry(out) #this copy the permissions of the corresponding symlink target
						else
							next unless filter.nil? or filter.match(filerel.to_s)
							next unless notfilter.nil? or ! notfilter.match(filerel.to_s)
							process_file(file, filerel: filerel, outfile: out, **keywords) do |output,outfile|
								if !output.nil? then
									logger.info "- #{filerel}"
									outfile||=out
									outfile.filewrite(output, backup: keep_backup, mkpath: true)
								else
									logger.warn "We decided not to write to #{out} but it exists!" if out.exist?
								end
							end
						end
					rescue => e
						# require 'pry'; binding.pry
						handle_error "In process_dir, error in handling <#{filerel}>", e
					end
				end
				indirs.each do |indir|
					indir=Pathname.new(indir)
					if indir.directory?
						SH.find(indir) do |file,filerel|
							handle_file.call(file, filerel)
						end
					elsif indir.file?
						components=indir.each_filename.to_a
						# split on "foo/./bar" like rsync
						if (i=components.index("."))
							filerel=Pathname.new(components[i+1..-1].join("/"))
							handle_file.call(indir, filerel)
						else
							handle_file.call(indir, indir.basename)
						end
					else
						warn "File #{indir} not found"
					end
				end
				if clean_emptydir
					SH.sh("find #{@dir[:out].to_s.shellescape} -depth -type d -print0 | xargs -0 rmdir --ignore-fail-on-non-empty")
				end
			end

			private def process_ruby(*args)
				Eruby.process_ruby(*args)
			end
			private def process_eruby(*args)
				Eruby.process_eruby(*args)
			end

			private def process_ruby_wrapper(code, eruby: false, context: @context, **opts)
				file=opts[:src_info] || nil
				begin
					if eruby
						r=process_eruby(code, context: context, **opts)
					else
						r=process_ruby(code, context: context, **opts)
					end
					yield(r,context) if block_given?
					return r
				rescue SquelExit => e
					logger.info "[#{file}] Early exit: #{e.message}"
					return nil
				rescue => e
					handle_error "[#{file}] Error in eruby", e
					return nil
				end
			end

			private def process_ruby_file(file, outfile=nil, context: @context)
				context[:out]=[]
				#allow the code to modify the outfile
				context[:outfile]=outfile
				_r=process_ruby_wrapper(file.read, context: context, src_info: file)
				output=context[:out]
				outfile=context[:outfile]
				return output, outfile
			end

			private def process_plain_file(file, context: @context, autogenerate: false)
				begin
					lines=file.readlines
					header=lines.first
				rescue => e
					handle_error "[#{file}] Error in open", e
					return nil
				end
				is_header, dowrite, generate=parse_header(header, context: context)
				lines.shift if is_header
				generate=true if autogenerate
				logger.debug "Generate: #{generate}, dowrite: #{dowrite}"
				if dowrite
					if generate
						return process_ruby_wrapper(lines.join, context: context, src_info: file, eruby: true)
					else
						return lines
					end
				end
				return nil
			end

			def process_file(file, autogenerate: false, context: @context,**keywords)
				@current_file=file
				output=nil #we do not write if the output is nil
				outfile=nil
				outfile=Pathname.new(keywords[:outfile]) if keywords.key?(:outfile)
				if file.binary?
					output=file.readbin
				elsif file.basename.to_s=~/\.rb$/ and file.executable?
					#assume this is a ruby script which will provide output to @out
					#and write to {file%.rb}
					outfile=Pathname.new(outfile.to_s.sub(/\.rb$/,''))
					logger.debug("File #{file} of ruby type, writing to #{outfile}")
					output,outfile=process_ruby_file(file, outfile, context: context)
				else
					output=process_plain_file(file, autogenerate: autogenerate)
				end
				yield output, outfile if block_given?
				return output
			end

			def process_scriptdir(scriptdir,filter:nil,notfilter:nil,**_keywords)
				dirs=[*scriptdir]
				run_script = lambda do |script|
					next unless filter.nil? or filter.match(script.to_s)
					next unless notfilter.nil? or ! notfilter.match(script.to_s)
					logger.debug "Handle #{script}"
					process_script(script)
				end
				dirs.each do |scriptdir|
					scriptdir=Pathname.new(scriptdir)
					if scriptdir.directory?
						Pathname.glob(scriptdir+"*").select(&:file?).sort.each do |script|
							run_script.call(script)
						end
					elsif scriptdir.file?
						run_script.call(scriptdir)
					else
						warn "Directory does not exist: #{scriptdir}"
					end
				end
			end

			def process_script(script, context: @context, mode: :auto, **opts)
				script=Pathname.new(script)
				@current_file=script
				mode=script_file_mode(script, fallback: :ruby) if mode==:auto
				logger.info "-> Run #{script} [#{mode}]"
				case mode
				when :script
					SH.sh(script.to_s)
				when :zsh
					SH.sh("zsh #{script.shellescape}")
				when :sh
					SH.sh("bash #{script.shellescape}")
				when :ruby
					process_ruby_wrapper(script, context: context, **opts)
				else
					logger.warn "process_script: mode #{mode} unknown"
				end
			rescue => e
				logger.warn "Error in process_script #{script}: #{e.message} (#{e.class}, #{e.backtrace.first})"
			end

			def snapshot(snapshotdir=@dir[:out], tmpdir: @dir[:snapshot], sudo:false, **_opts)
				tosnapshot=snapshotdir.find.map do |fileabs, filerel|
					if fileabs.file? or fileabs.symlink?
						if @dir[:commit].to_s.empty?
							f=filerel.to_s 
						else
							f=@dir[:commit].to_s+"/./"+filerel.to_s 
						end
						@computer.sshfile(f, present: present?)
					end
				end.compact
				chown= sudo ? "#{@local_computer.dig(:user,:username)}:#{@local_computer.dig(:user,:group)}" : nil
				SH.rsync(*tosnapshot, "#{tmpdir}/", expected: 23, relative: true, sudo: sudo, clean_out: true, chown: chown, sshcommand: @computer.ssh(mode: :hash)[:ssh_command_options])
				# rsync only chown the files, not the implied dir, so they stay
				# root, and rm_rf does not work...
				# This won't work without sudo
				# tmpdir.chown_R(*chown.split(':')) if chown
				if sudo and chown
					SH.sh("sudo chown #{chown.shellescape} -R #{tmpdir.to_s.shellescape}")
				end
			end

			def diff(todiff=@dir[:out], tmpdir: @dir[:snapshot], **opts)
				snapshot(todiff, tmpdir: tmpdir, **opts)
				SH.sh "gitdiff #{tmpdir} #{todiff}", expected: 1
			end

			def commit(backup_dir: "#{@dir[:backup]}/", **opts)
				if opts[:sudo]
					# opts[:preserve]||=:nochown 
					opts[:chown]||="root:root"
				end
				opts[:expected]||=23
				commitdir=@dir[:commit].to_s.empty? ? "" : "#{@dir[:commit]}/"
				SH.rsync("#{@dir[:out]}/", @computer.sshfile(commitdir, present: present?), keep_dirlinks: true, backup: backup_dir, sshcommand: @computer.ssh(mode: :hash)[:ssh_command_options], **opts)
			end

			def configure(**opts)
				process_scriptdir(@dir[:configure], **opts)
				if opts[:configure_extra]
					logger.info "#### Extra configure: #{opts[:configure_extra]}"
					process_scriptdir(opts[:configure_extra],@dir[:out],**opts)
				end
			end

			def check_user(msg)
				logger.info msg+"  [nN to interrupt]"
				r=STDIN.gets
				SH.exit_now!(0,"Stopping") if r=~/^[nN]$/
			end

			# handle action generate/diff/commit/configure
			def process_actions(*actions,**opts)
				opts=@opts.merge(opts)
				pause=opts.key?(:pause) ? opts[:pause] : true
				logger.info "# Actions: #{actions.join(" ")}" if actions.length > 1
				actions.each do |action|
					if action != :generate and (id=opts.delete(:keyid))
						copy_id_file(id)
					end
					if pause and action != :generate #never pause for generate
						check_user("# - #{action}?")
					else
						logger.info("# - #{action}")
					end
					send(action)
				end
			end
			def process_action(action,**opts)
				opts=opts.merge(@opts)
				pause=opts.key?(:pause) ? opts[:pause] : true
				msg=opts[:msg] || action.to_s
				args=opts[:args]
				if pause and action != :generate #never pause for generate
					check_user("# #{msg}?")
				else
					logger.info("# #{msg}")
				end
				if args
					send(action, *args)
				else
					send(action)
				end
			end

			private def script_file_mode(file, fallback: nil)
				if file.to_s=~/\.rb$/
					:ruby 
				elsif file.to_s=~/\.zsh$/
					:zsh
				elsif file.to_s=~/\.sh$/
					:sh
				elsif file.executable?
					:script
				elsif fallback
					fallback
				end
			end

			# dispatch to the right action or mode
			def dispatch(*args,**opts)
				opts=@opts.merge(opts)
				if args.empty?
					# action mode: generate/diff/commit/configure
					actions=[*opts.delete(:actions)]
					actions=[:generate] if actions.empty?
					if actions.include?(:process_now)
						actions=[:all]
						opts[:pause]=false
					end
					if actions.include?(:all)
						actions=[:generate,:diff,:commit]
						actions << :configure if current?
					end
					if opts[:pause]==:auto
						#don't pause if we pass only one arg
						opts[:pause]=false if actions.length <= 1
					end
					process_actions(*actions,**opts)
				else
					# ruby, script or file mode
					mode=opts[:mode]
					args.each do |file|
						file=Pathname.new(file)
						if mode==:auto
							if file.directory?
								mode=:directory
							else file.to_s=~/\.rb$/
								mode=script_file_mode(file, fallback: :file)
							end
						end
						begin
							case mode
							when :directory
								logger.debug "## Computer: #{computer}; scriptdir: #{file}"
								process_scriptdir(file, **opts)
							when :file
                output=process_file(file, autogenerate: opts[:autogenerate])
								logger.debug "## Computer: #{computer}; file: #{file} (write: #{! output.nil?})"
								logger.info output
							when :script,:ruby,:zsh,:sh
								logger.debug "## Computer: #{computer}; script: #{file}"
								process_script(file, mode: mode)
							else
								logger.warn "dispatch: unknown mode #{mode}"
							end
						rescue SH::ExitError => e
							logger.warn "Error in dispatching script: #{e}"
						end
					end
				end
			end

			extend ProcessActions
			class <<self
				def process_actions(*args, default_computer: "local", **opts)
					super
				end

				def process_args(*args, **opts)
					super do |opt,opts|
						opt.banner = "Configure #{self} / Parse files"
						opts[:method]||=:dispatch #the method called by process_actions
						#=> dispatch will call process_files on the arguments, and if
						#not argument is used, fallback to --generate,...
						opts[:mode]||=:auto #autodetect script vs ruby file
						opts[:pause]||=:auto #don't pause if there is only one action
						opts[:actions]||=[] #actions to launch
						opt.separator("\nSquel dir actions")
						opt.on("--dir=dir_config", "Directory configuration") do |v|
							opts[:dir]=SimpleParser.parse_options(v)
						end
						opt.on("--target=target", "Configure target") do |v|
							opts[:dir]||={}
							opts[:dir][:target]=v
						end
						opt.on("--actions=generate/diff/commit/configure/process_now", Array, "Squel actions", ) do |v|
							opts[:actions]+=v.map {|a| a.to_sym}
						end
						opt.on("--all", "Configure all") do |v|
							opts[:actions]=:all if v
						end
						opt.on("--process_now", "process_now is a shortcut for --all --no-pause") do |v|
							opts[:actions]=:process_now if v
						end
						opt.on("--[no-]pause", "Don't pause between actions") do |v|
							opts[:pause]==v
						end

						opt.separator("\nExtra files for squel dir")
						opt.on("--add=file1,file2", "Add files to generate", Array) do |v|
							opts[:add_extra]=v
						end
						opt.on("--add_copy=file1,file2", "Add files to copy", Array) do |v|
							opts[:copy_extra]=v
						end
						opt.on("--add_script=script1,script2", "Add script to run", Array) do |v|
							opts[:script_extra]=v
						end
						opt.on("--add_configure=script1,script2", "Add script to configure", Array) do |v|
							opts[:configure_extra]=v
						end

						opt.separator("\nIndividual actions")
						opt.on("--[no-]generate", "Generate") do |v|
							if v
								opts[:actions]<<:generate 
							else
								opts[:actions].delete(:generate)
							end
						end
						opt.on("--[no-]diff", "Diff") do |v|
							if v
								opts[:actions]<<:diff 
							else
								opts[:actions].delete(:diff)
							end
						end
						opt.on("--[no-]commit", "Commit") do |v|
							if v
								opts[:actions]<<:commit 
							else
								opts[:actions].delete(:commit)
							end
						end
						opt.on("--[no-]configure", "Configure") do |v|
							if v
								opts[:actions]<<:configure 
							else
								opts[:actions].delete(:configure)
							end
						end
						opt.on("--[no-]keyid[=id_file]", "Push the ssh key id") do |v|
							opts[:keyid]=v
						end

						opt.separator("\nIndividual files")
						opt.on("-s", "--[no-]script", "See as script rather than eruby") do |v|
							opts[:mode]=:script if v
						end
						opt.on("--mode=eruby/script/file/[auto]", "Force mode") do |v|
							opts[:mode]=v.to_sym
						end
						opt.on("--[no-]autogenerate", "auto generate", "Force generation rather than copy") do |v|
							opts[:autogenerate]=v
						end
						yield(opt,opts) if block_given?
					end

				end
			end

			private
			def parse_header(header, context: @context)
				is_header=true
				generate=false
				dowrite=true
				if header =~ /^#\s*GENERATE\s+NOTFOR\s*(.*)$/
					generate=true
					dowrite=!dowrite_from_list($1.split(','))
				elsif header =~ /^#\s*GENERATE\s+ONLY\s*(.*)$/
					generate=true
					dowrite=dowrite_from_list($1.split(','))
				elsif header =~ /^#\s*GENERATE\s+WHEN\s*(.*)$/
					generate=true
					dowrite=dowrite_from_condition($1, context: context)
				elsif header =~ /^#\s*GENERATE\s*$/
					generate=true
				elsif header =~ /^#\s*ONLY\s*(.*)$/
					dowrite=dowrite_from_list($1.split(','))
				elsif header =~ /^#\s*NOTFOR\s*(.*)$/
					dowrite=!dowrite_from_list($1.split(','))
				elsif header =~ /^#\s*WHEN\s*(.*)$/
					dowrite=dowrite_from_condition($1, context: context)
				else #not a header
					is_header=false
				end
			ensure
				return is_header, dowrite, generate
			end
			def dowrite_from_list(list)
				return @computer.in?(list)
			end
			def dowrite_from_condition(condition, context: @context)
				logger.debug "    Condition: #{condition}"
				begin
					process_ruby(condition, context: context)
				rescue => e
					handle_error "Error in interpreting condition #{condition}", e
					return false
				end
			end
		end
	end

end

if __FILE__ == $0
	DR::Process::Squel.process_args(*ARGV)
end
