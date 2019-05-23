# vi: ft=ruby
#Pry.config.prompt = Pry::NAV_PROMPT

#Pry.config.history.file="~/var/history/pry.history"
begin
  require 'hirb'
  #require awesome_print
  #already loaded: pp, FileUtils, Pathname, Shellwords
rescue LoadError
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  # From https://github.com/pry/pry/wiki/FAQ
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end
    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end
  #Hirb.enable
end

def Pry.loaded_features()
  $LOADED_FEATURES.
    map { |feature| File.dirname(feature).split('/') }.
    select { |feature| feature.include? 'gems' }.
    map { |feature| feature[feature.rindex('gems')+1] }.
    uniq.sort
end

#From https://gist.github.com/lucapette/807492, found in http://lucapette.me/pry-everywhere/
def Array.toy(n=10, &block)
  block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
end
def Hash.toy(n=10)
  Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
end

begin
	#remove these annoying aliases from pry-byebug
	Pry.commands.delete('f','c','s','n')
rescue ArgumentError
end
