require 'dr/shell'
require 'erubis'
module DR
	module Process
		include DR::ShellInclude
		extend self
		def process_dir(computer,dir,outdir,filter:nil,notfilter:nil,cleanup_out:false,keep_backup:false,**keywords)
			logger.debug "Generating files for #{computer} from #{dir} to #{outdir}"
			#be careful with this option!
			log_and_do(Logger::DEBUG,:rm_rf,"#{outdir}") if cleanup_out
			find(dir, show_dir: false, follow_symlink: false) do |file,filerel|
				next unless filter.nil? or filter.match(filerel.to_s)
				next unless notfilter.nil? or ! notfilter.match(filerel.to_s)
				out=outdir+filerel
				log_and_do(Logger::DEBUG,:mkdir_p,"#{out.dirname}") unless out.dirname.directory?
				logger.debug "Handle #{file}, relative: #{filerel}, out #{out}"
				if file.directory? && file.symlink?
					logger.info "- #{filerel}"
					copy_entry(file,out) #this is the right invocation to copy a symlink
					#cp would copy the files under the symlink
				elsif file.to_s =~ /(\.jpg|\.png)$/
					logger.info "- #{filerel}"
					backup_file(out) if keep_backup
					cp(file,out)
				else
					process_file(computer,file, **keywords) do |dowrite,output|
						if dowrite then
							logger.info "- #{filerel}"
							if out.exist?
								if keep_backup
									backup_file(out)
								else
									logger.debug "Overwriting #{out}" 
								end
							end
							if !out.exist? && out.symlink?
								logger.debug "Removing bad symlink #{out}"
								out.unlink
							end
							out.filewrite(output) 
						else
							logger.warn "We decided not to write to #{out} but it exist!" if out.exist? && !dowrite 
						end
					end
				end
			end
		end

		def process_file(computer,file, autogenerate: false)
			lines=file.readlines
			header=lines.first
			dowrite=true
			generate=true if autogenerate
			if header =~ /^#\s*GENERATE\s+NOTFOR\s*(.*)$/
				generate=true
				dowrite=!dowrite_from_list(computer,$1.split(','))
				lines.shift
			elsif header =~ /^#\s*GENERATE\s+ONLY\s*(.*)$/
				generate=true
				dowrite=dowrite_from_list(computer,$1.split(','))
				lines.shift
			elsif header =~ /^#\s*GENERATE\s+WHEN\s*(.*)$/
				generate=true
				dowrite=dowrite_from_condition(computer,$1)
				lines.shift
			elsif header =~ /^#\s*GENERATE\s*$/
				generate=true
				lines.shift
			elsif header =~ /^#\s*ONLY\s*(.*)$/
				dowrite=dowrite_from_list(computer,$1.split(','))
				lines.shift
			elsif header =~ /^#\s*NOTFOR\s*(.*)$/
				dowrite=!dowrite_from_list(computer,$1.split(','))
				lines.shift
			elsif header =~ /^#\s*WHEN\s*(.*)$/
				dowrite=dowrite_from_condition(computer,$1)
				lines.shift
			end
			logger.debug "Generate: #{generate}, dowrite: #{dowrite}"
			if generate && dowrite
				eruby = Erubis::Eruby.new(lines.join)
				context = Erubis::Context.new(computer: computer)
				output=eruby.evaluate(context)
			else
				output=lines
			end
			if block_given? 
				yield dowrite,output
			else
				return dowrite,output
			end
		end

		private
		def backup_file(file)
			if file.exist?
				filebk=Pathname.new(file.to_s+".old")
				logger.debug "Backup #{file} -> #{filebk}"
				mv(file,filebk)
			end
		end
		def dowrite_from_list(computer,list)
			return computer.in?(list)
		end
		def dowrite_from_condition(computer,condition)
			#stolen from Erubis
			context = Erubis::Context.new(computer: computer)
			_proc=eval("Proc.new { #{condition} }", binding(), '(process_files)')
			return context.instance_eval(&_proc)
		end
	end
end
