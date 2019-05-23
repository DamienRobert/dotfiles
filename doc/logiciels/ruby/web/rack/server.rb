# hello_world.rb
require 'rack'
require 'rack/server'

class HelloWorld
  def response
    [200, {}, 'Hello World']
  end
end

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

class HelloWorldApp
  def self.call(env)
    request = Rack::Request.new env #proxy to the env hash
    p request.params # contains the union of GET and POST params
    request.xhr?   # requested with AJAX
    request.body   # the incoming request IO stream

    if request.params['message']
      [200, {}, request.params['message']]
    else
      response = Rack::Response.new #abstraction around the response
      response.write 'Hello World' # write some content to the body
      response.body = ['Hello World'] # or set it directly
      response['X-Custom-Header'] = 'foo'
      response.set_cookie 'bar', 'baz'
      response.status = 202
      response.finish # return the generated triplet
    end
  end
end

#launched on localhost:8080, see handler/*.rb: options[:Port] || 8080,
Rack::Server.start :app => HelloWorldApp
#curl 'http://localhost:8080/index.html?message=foo'
#options: server, Host, Port

#Launch the server directly
#(warning this does not wrap the application with the environment specific
#middlewares)
#Rack::Handler::Mongrel.run HelloWorld.new, :Port => 9292
