module DR
  module Bool
    extend(self)
    def to_bool(el, default=nil)
      case el
      when String
        string=el.chomp
        return true if string == true || string =~ (/(true|t|yes|y|1)$/i)
        return false if string == false || string.empty? || string =~ (/(false|f|no|n|0)$/i)
      when Fixnum
        return ! (el == 0)
      when Process::Status
        exitstatus=el.exitstatus
        return exitstatus == 0
      else
        return true if el == true
        return false if el == false
        #we don't return !!el because we don't want nil to be false but to
        #give an error
      end
      return default unless default.nil?
      raise ArgumentError.new("Invalid value for Boolean: \"#{el}\"")
    end
  end
end
