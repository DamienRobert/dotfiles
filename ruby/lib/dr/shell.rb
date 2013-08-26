require 'shellwords'; require 'fileutils'; require 'pathname'
require 'facets/file'; require 'facets/dir'
require 'dr/run'; require 'dr/shextra'
#require 'find'
#Numenor ~gems/facets-2.9.3/lib/core/facets/file $ ls
#append.rb        create.rb       read_list.rb  split_all.rb
#atomic_id.rb     ext.rb          rewrite.rb    split_root.rb
#atomic_open.rb   null.rb         rootname.rb   write.rb
#atomic_write.rb  read_binary.rb  sanitize.rb   writelines.rb
#
#Ecrire un fichier: file.write("ploum")
#Ou File.write(path,data) avec facets

#monkeypatch ShellWords to convert Paths into strings
module Shellwords
  class << self
    alias :shellescape_orig :shellescape 
    def shellescape(item)
      case item
      when Pathname
        return shellescape_orig(item.to_s)
      else
        return shellescape_orig(item)
      end
    end
  end
end


module DR
  #including DR::ShellInclude will allow 
  module ShellInclude
    include ::FileUtils
    include DR::SH #sh, sh!, run_command, set_sh_logger
    include DR::CLILogging #debug info warn error fatal
    include DR::SHExtra
  end
end
