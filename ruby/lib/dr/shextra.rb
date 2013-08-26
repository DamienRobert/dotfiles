module DR
  module SHExtra
    extend self
    def self.included(k)
      k.extend(self)
    end
    
    ORIGSTDIN=STDIN
    ORIGSTDOUT=STDOUT
    ORIGSTDERR=STDERR

    #from {ploum: plim} return something like
    #ploum=plim
    #that can be evaluated by the shell
    def sh_export(hash)
      hash.each do |k,v|
        puts "#{k}=#{v.shellescape}"
      end
    end

    #An improved find from Find::find that takes in the block the absolute and relative name of the files (+the directory where the relative file is from), and can have options like no directory output -> :nodir, :nosymlink, :nofollowsymlink
    def find(*paths) # :yield: path
      options  = (Hash === paths.last ? paths.pop : {})
      block_given? or return enum_for(__method__, *paths)

      paths.collect!{|d| raise Errno::ENOENT unless File.exist?(d); Pathname.new(d.dup)}
      paths.collect!{|d| [ d, Pathname.new('.'), d ]}
      while filedata = paths.shift
        #p filedata
        file, filerel, fileabs = *filedata
        catch(:prune) do
          Dir.chdir(fileabs) do
            if !( options[:nodir] && file.directory? && !file.symlink? or options[:nosymlink] && file.symlink?)
                yield file.dup.taint, filerel.dup.taint, fileabs.dup.taint
            end
            if file.directory? then
              next if options[:nofollowsymlink] && file.symlink?
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
