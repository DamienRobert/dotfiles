require 'rack'

class EnsureJsonResponse
  def initialize(app)
    @app = app
  end

  # Set the 'Accept' header to 'application/json' no matter what.
  # Hopefully the next middleware respects the accept header :)
  def call(env)
    env['HTTP_ACCEPT'] = 'application/json'
    @app.call env
  end
end

class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now
    status, headers, body = @app.call env

    #adds X-Timing to the header of the answer
    headers['X-Timing'] = (Time.now - before).to_i.to_s

    [status, headers, body+["Called at #{before}"]]
  end
end

app = Rack::Builder.new do
  #this block is run under instance_eval of the Rack::Builder object
  use Timer # put the timer at the top so it captures everything below it
  use EnsureJsonResponse
  run ->(env) {[200,{},["Hello"]]}
end

Rack::Server.start :app => app
