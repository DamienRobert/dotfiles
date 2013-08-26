require 'erb'
require 'pathname'

module DR
  module Eruby
    def erb_include(template, opt={})
      opt={bind: binding}.merge(opt)
      file=Pathname.new(template)
      file=file.expand_path
      Dir.chdir(file.dirname) do |cwd|
        erb = ERB.new(file.read)
        #if context is not empty, then we probably want to evaluate
        if opt[:evaluate] or opt[:context]
          r=erb.evaluate(opt[:context])
        else
          r=erb.result(opt[:bind])
        end
        #if using erubis, it is better to invoke the template in <%= =%> than
        #chop=true
        r=r.chomp if opt[:chomp]
        return r
      end
    end
  end
end
