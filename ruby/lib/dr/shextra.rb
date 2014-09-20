module DR
	module Shell
		extend self

		ORIGSTDIN=STDIN
		ORIGSTDOUT=STDOUT
		ORIGSTDERR=STDERR

		def export_value(v)
			case v
				when String
					return v.shellescape
				when Array
					return "(#{v.map {|i| i.to_s.shellescape}.join(' ')})"
				when Hash
					return "(#{v.map {|k,v| k.to_s.shellescape+" "+v.to_s.shellescape}.join(' ')})"
				when nil
					return ""
				else
					return v.to_s.shellescape
			end
		end
		#from {ploum: plim} return something like
		#ploum=plim
		#that can be evaluated by the shell
		def export(hash, local: false, export: false)
			r=""
			r+="local #{hash.keys.map {|s| s.to_s.upcase}.join(" ")}\n" if local
			hash.each do |k,v|
				name=k.to_s.upcase
				r+="typeset -A #{name};\n" if Hash === v
				r+=name+"="+DR::Shell.export_value(v)+";\n"
			end
			r+="export #{hash.keys.map {|s| s.to_s.upcase}.join(" ")}\n" if export
			return r
		end

		def export_variable(name, value, local: false, export: false)
			r=""
			name=name.upcase
			r+="local #{name}\n" if local
			r+="typeset -A #{name};\n" if Hash === value
			r+=name+"="+DR::Shell.export_value(value)+";\n"
			r+="export #{name}\n" if export
			return r
		end

		def export_parse(hash,s)
			r=""
			args=parse_string(s)
			args[:values].each do |k,v|
				name=k
				if name=="all" and v.nil?
					r+=export(hash, local: args[:opts][k]["local"], export: args[:opts][k]["export"])
				else
					if v=="all"
						value=hash
					else
						key=v||name
						key=key.to_sym if hash.key?(key.to_sym) && !hash.key?(key)
						value=hash[key]
					end
					r+=export_variable(name,value, local: args[:opts][k]["local"], export: args[:opts][k]["export"])
				end
			end
			return r
		end

		#takes a string as "name:value!option1=ploum!option2=plam,name2:value2!!globalopt=plim,globalopt2=plam"
		#and return the hash
		#{values: {name: value, name2: value2},
		# localopt: {name: {option1:ploum,option2:plam}},
		# globalopt: {globalopt: plim, globalopt2: plam},
		# opt: {name: {option1:ploum,option2:plam,globalopt: plim, globalopt2: plam}, name2:{{globalopt: plim, globalopt2: plam}}}

		def parse_namevalue(nameval, sep: ':', default: nil)
			name,*val=nameval.split(sep)
			if val.empty?
				if default == true
					#special case where if name begins by no- we return false
					if name =~ /^no-(.*)$/
						return $1, false
					else
						return name, true
					end
				else
					return name, default
				end
			else
				value=val.join("=")
				return name,value
			end
		end
		def parse_string(s)
			r={values: {}, local_opts: {}, global_opts: {}, opts: {}}
			args,*globopts=s.split('!!')
			globopts.map {|g| g.split(',')}.flatten.each do |g|
				name,value=parse_namevalue(g, sep: '=', default: true)
				r[:global_opts][name]=value
			end
			args.split(',').each do |arg|
				arg,*localopts=arg.split('!')
				name,value=parse_namevalue(arg)
				r[:values][name]=value
				r[:local_opts][name]={}
				localopts.each do |o|
					oname,ovalue=parse_namevalue(o, sep: '=', default: true)
					r[:local_opts][name][oname]=ovalue
				end
				r[:local_opts].each do |name,hash|
					r[:opts][name]=r[:local_opts][name].dup
					r[:global_opts].each do |k,v|
						r[:opts][name][k]||=v
					end
				end
			end
			return r
		end

		#An improved find from Find::find that takes in the block the absolute and relative name of the files (+the directory where the relative file is from), and can have options like no directory output -> :nodir, :nosymlink, :nofollowsymlink
		def find(*paths) # :yield: path
			options  = (Hash === paths.last ? paths.pop : {})
			options = { show_dir: true, show_symlink: true, follow_symlink: false}.merge(options)
			block_given? or return enum_for(__method__, *paths)

			paths.collect!{|d| raise Errno::ENOENT unless File.exist?(d); Pathname.new(d.dup)}
			paths.collect!{|d| [ d, Pathname.new('.'), d ]}
			while filedata = paths.shift
				#p filedata
				file, filerel, fileabs = *filedata
				catch(:prune) do
					Dir.chdir(fileabs) do
						if !( !options[:show_dir] && file.directory? && !file.symlink? or !options[:show_symlink] && file.symlink?)
								yield file.dup.taint, filerel.dup.taint, fileabs.dup.taint
						end
						if file.directory? then
							next if !options[:follow_symlink] && file.symlink?
							#children skip '.' and '..' but use absolute name
							fs=file.entries.sort.reject {|f| ['.', '..'].include?(f.to_s)}
							fs.reverse_each do |f|
								fj = file + f
								f = filerel + f
								paths.unshift [fj.untaint,f.untaint,fileabs]
							end
						end
					end
				end
			end
		end

		#all output is sent to the pager
		def run_pager(opt=nil)
			return unless STDOUT.tty? and opt != :never
			read, write = IO.pipe
		
			unless Kernel.fork # Child process
				STDOUT.reopen(write)
				STDERR.reopen(write) if STDERR.tty?
				read.close
				write.close
				return
			end

			# Parent process, become pager
			STDIN.reopen(read)
			read.close
			write.close
		
			#ENV['LESS'] = 'FSRX' # Don't page if the input is short enough
			lessenv=ENV['LESS']
			lessenv="-FRX" if lessenv.empty?
			lessenv+="F" unless lessenv.match(/F/) or opt == :always
			lessenv+="R" unless lessenv.match(/R/)
			lessenv+="X" unless lessenv.match(/X/)
			ENV['LESS']=lessenv
		
			Kernel.select [STDIN] # Wait until we have input before we start the pager
			pager = ENV['PAGER'] || 'less'
			exec pager rescue exec "/bin/sh", "-c", pager
		end

		#inside run_pager, escape from the pager
		#does not work :-(
		def escape_pager
			STDOUT.reopen(ORIGSTDOUT)
			STDERR.reopen(ORIGSTDERR)
			STDIN.reopen(ORIGSTDIN)
			#unless Kernel.fork # Child process
			#  return
			#end
			##Parent process
			#exit 0
		end

	end
end
