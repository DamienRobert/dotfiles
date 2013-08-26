require 'iconv' unless String.method_defined?(:encode)
module DR
  module Encoding
    module_function
    #if a mostly utf8 has some mixed in latin1 characters, replace the
    #invalid characters
    def fix_utf8(s=nil)
      s=self if s.empty? #if we are included
      if String.method_defined?(:encode)
        #Ruby 1.9
        s.encode!('UTF-8', 'UTF-8', :invalid => :replace, :undef => :replace)
      else
        #Ruby 1.8
        ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
        s = ic.iconv(file_contents)
      end
      return s
    end

    def to_utf8(s=nil,from=nil)
      s=self if s.empty? #if we are included
      if from.nil?
        s.encode!('UTF-8', :invalid => :replace, :undef => :replace)
      else
        s.encode!(from,'UTF-8', :invalid => :replace, :undef => :replace)
      end
    end
  end
end
