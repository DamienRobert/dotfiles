# vi: ft=ruby
#Pry.config.prompt = Pry::NAV_PROMPT
begin
  require 'hirb'
  #require awesome_print
  #already loaded: pp, FileUtils, Pathname, Shellwords
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Dirty hack to support in-session Hirb.disable/enable
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
      end
    end

    def disable_output_method
      Pry.config.print = proc { |output, value| Pry::DEFAULT_PRINT.call(output, value) }
      @output_method = nil
    end
  end

  #Hirb.enable
end

def loaded_features()
  $LOADED_FEATURES.
    map { |feature| File.dirname(feature).split('/') }.
    select { |feature| feature.include? 'gems' }.
    map { |feature| feature[feature.rindex('gems')+1] }.
    uniq.sort
end
