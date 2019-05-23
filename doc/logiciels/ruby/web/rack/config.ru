#config.ru is wrapped inside Rack::Builder

class HelloApp
  def self.call(env)
    env_info=env.to_a.sort.map {|i| i.join(':')}.join("\n")
    #return value should be
    #[result code, hash of headers, list of strings for content]
    [200, {'Content-Type' => 'text/html'}, ["Hello there.", "Here is the env hash", "<pre>",env_info,"</pre>"]]
  end
end

run HelloApp #any object that responds to call
#rackup #by default rackup lauches on localhost:9292

#when calling rackup, it just launches
#Rack::Server.start
#since it passes no options, it uses the default options
#in particular options[:config]='config.ru' so it launches
#app, options = Rack::Builder.parse_file(self.options[:config], opt_parser)
#which calls eval "Rack::Builder.new {\n" + builder_script + "\n}.to_app"
