require 'iconv' unless String.method_defined?(:encode)
#cf http://stackoverflow.com/questions/2982677/ruby-1-9-invalid-byte-sequence-in-utf-8
module DR
  module Encoding
    module_function
    #if a mostly utf8 has some mixed in latin1 characters, replace the
    #invalid characters
    def fix_utf8(s=nil)
      s=self if s.nil? #if we are included
      if String.method_defined?(:scrub)
        #Ruby 2.1
        #cf http://ruby-doc.org/core-2.1.0/String.html#method-i-scrub
        return s.scrub {|bytes| '<'+bytes.unpack('H*')[0]+'>' }
      else
        return DR::Encoding.to_utf8(s)
      end
    end

    def to_utf8(s=nil,from:nil)
      s=self if s.nil? #if we are included
      from=s.encoding if from.nil?
      if String.method_defined?(:encode)
        #Ruby 1.9
        return s.encode('UTF-8',from, :invalid => :replace, :undef => :replace,
                 :fallback => Proc.new { |bytes| '<'+bytes.unpack('H*')[0]+'>' }
               )
      else
        #Ruby 1.8
        ic = Iconv.new(from, 'UTF-8//IGNORE')
        return ic.iconv(s)
      end
    end

    #assume ruby>=1.9 here
    def to_utf8!(s=nil,from:nil)
      s=self if s.nil? #if we are included
      from=s.encoding if from.nil?
      return s.encode!('UTF-8',from, :invalid => :replace, :undef => :replace,
               :fallback => Proc.new { |bytes| '<'+bytes.unpack('H*')[0]+'>' }
             )
    end
  end
end
