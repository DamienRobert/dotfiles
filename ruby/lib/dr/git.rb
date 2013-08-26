module DR
  module Bool
    extend(self)
    def to_bool(el)
      case el
      when String
        string=el.chomp
        return true if string == true || string =~ (/(true|t|yes|y|1)$/i)
        return false if string == false || string.empty? || string =~ (/(false|f|no|n|0)$/i)
      when Fixnum
        return false if el == 0
        return true
      when Process::Status
        exitstatus=el.exitstatus
        return true if el == 0
        return false
      end
      raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
    end
  end

  #git functions helper
  module Git
    extend(self)
    def git?(quiet=false)
      launch="git rev-parse"
      launch=launch + " 2>/dev/null" if quiet
      system launch
      return Bool.to_bool($?)
    end
    def gitdir?
      return Bool.to_bool(%x/git rev-parse --is-inside-git-dir/)
    end
    def worktree?
      return Bool.to_bool(%x/git rev-parse --is-inside-work-tree/)
    end
    def bare? 
      return Bool.to_bool(%x/git rev-parse --is-bare-repository/)
    end
    def cd_to_toplevel
      dir=%x/git rev-parse --show-cdup/.chomp
      Dir.chdir(dir) unless dir.empty?
    end

    def toplevel 
      return %x/git rev-parse --show-toplevel/.chomp
    end
    def prefix 
      return %x/git rev-parse --prefix/.chomp
    end
    def gitdir 
      return %x/git rev-parse --git-dir/.chomp
    end
  end
end
