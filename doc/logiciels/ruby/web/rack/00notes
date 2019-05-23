vim: ft=markdownlight foldmethod=expr

# Documentation:
http://www.rubydoc.info/github/rack/rack/file/SPEC
http://www.rubydoc.info/github/rack/rack/

Rack environment:
- REQUEST_METHOD: The HTTP request method, such as “GET” or “POST”. This cannot ever be an empty string, and so is always required.
- SCRIPT_NAME: The initial portion of the request URL's “path” that corresponds to the application object, so that the application knows its virtual “location”. This may be an empty string, if the application corresponds to the “root” of the server.
- PATH_INFO: The remainder of the request URL's “path”, designating the virtual “location” of the request's target within the application. This may be an empty string, if the request URL targets the application root and does not have a trailing slash. This value may be percent-encoded when I originating from a URL.
- QUERY_STRING: The portion of the request URL that follows the ?, if any. May be empty, but is always required!
- SERVER_NAME, SERVER_PORT: When combined with SCRIPT_NAME and PATH_INFO, these variables can be used to complete the URL. Note, however, that HTTP_HOST, if present, should be used in preference to SERVER_NAME for reconstructing the request URL. SERVER_NAME and SERVER_PORT can never be empty strings, and so are always required.
- HTTP_ Variables: Variables corresponding to the client-supplied HTTP request headers (i.e., variables whose names begin with HTTP_). The presence or absence of these variables should correspond with the presence or absence of the appropriate HTTP header in the request. See <a href=“tools.ietf.org/html/rfc3875#section-4.1.18”> RFC3875 section 4.1.18</a> for specific behavior.

- rack.version: The Array representing this version of Rack See Rack::VERSION, that corresponds to the version of this SPEC.
- rack.url_scheme: http or https, depending on the request URL.
- rack.input: See below, the input stream.
- rack.errors: See below, the error stream.
- rack.multithread: true if the application object may be simultaneously invoked by another thread in the same process, false otherwise.
- rack.multiprocess: true if an equivalent application object may be simultaneously invoked by another process, false otherwise.
- rack.run_once: true if the server expects (but does not guarantee!) that the application will only be invoked this one time during the life of its containing process. Normally, this will only be true for a server based on CGI (or something similar).
- rack.hijack?: present and true if the server supports connection hijacking. See below, hijacking.
- rack.hijack: an object responding to #call that must be called at least once before using rack.hijack_io. It is recommended #call return rack.hijack_io as well as setting it in env if necessary.
- rack.hijack_io: if rack.hijack? is true, and rack.hijack has received #call, this will contain an object resembling an IO. See hijacking.

Additional environment specifications have approved to standardized middleware APIs. None of these are required to be implemented by the server.
- rack.session: A hash like interface for storing request session data. The store must implement: store(key, value) (aliased as []=); fetch(key, default = nil) (aliased as []); delete(key); clear;
- rack.logger: A common object interface for logging messages 
- rack.multipart.buffer_size: An Integer hint to the multipart parser as to what chunk size to use for reads and writes.
- rack.multipart.tempfile_factory: An object responding to #call with two arguments, the filename and content_type given for the multipart form field, and returning an IO-like object that responds to #<< and optionally #rewind. This factory will be used to instantiate the tempfile for each multipart form file upload field, rather than the default class of Tempfile.

# Rack Structure
## Core Rack:
Rack::Builder: build a rack application
Rack::Server: launch a rack application
Rack::Handler: connect web servers with Rack

## Helpers:
- Rack::Request: proxy to the env hash
- Rack::Response: abstraction around the response
- Rack::BodyProxy: ?? Used by other middlewares
- Rack::Mime: mime typo of extension Rack::Mime.mime_type('.foo')
- Rack::Multipart: A multipart form data parser, adapted from IOWA.
  -> parse_multipart(env), build_multipart(params)
- Rack::RewindableInput: Class which can make any IO object rewindable, including non-rewindable ones.

- Rack::Utils contains a grab-bag of useful methods for writing web applications adopted from all kinds of Ruby libraries.
  -> HeaderHash: A case-insensitive Hash that preserves the original case of a header when set.
  -> HHTP_STATUS_CODES

## Test:
- Rack::MockRequest helps testing your Rack application without actually using HTTP. Returns a Rack::MockResponse

## Contrib:
https://github.com/rack/rack-contrib

# Included Middlewares:
- Rack::Auth:
  -> Rack::Auth::Basic implements HTTP Basic Authentication, as per RFC 2617.
  -> Rack::Digest::MD5: authentication with md5 digest
- Rack::Session
  -> Rack::Sesssion::Cookie: provides simple cookie based session management. By default, the session is a Ruby Hash stored as base64 encoded marshalled data set to :key (default: rack.session).  The object that encodes the session data is configurable and must respond to +encode+ and +decode+.
  -> Rack::Session::Memcache provides simple cookie based session management. Session data is stored in memcached. The corresponding session key is maintained in the cookie.
  -> Rack::Session::Pool provides simple cookie based session management. Session data is stored in a hash held by @pool.

- Rack::Cascade tries a request on several apps, and returns the first response that is not 404 or 405 (or in a list of configurable status codes).
- Rack::Chunked: Middleware that applies chunked transfer encoding to response bodies when the response does not include a Content-Length header.
- Rack::CommonLogger forwards every request to the given app, and logs a line in the Apache common log format to the logger.
- Rack::ConditionalGet: Middleware that enables conditional GET using If-None-Match and If-Modified-Since. The application should set either or both of the Last-Modified or Etag response headers according to RFC 2616. When either of the conditions is met, the response body is set to be zero length and the response status is set to 304 Not Modified.
- Rack::Config: modifies the environment using the block given during initialization.
- Rack::ContentLength: Sets the Content-Length header on responses with fixed-length bodies.
- Rack::ContentType: Sets the Content-Type header on responses which don't have one.
- Rack::Deflater: This middleware enables compression of http responses.
- Rack::Directory: serves entries below the root given, according to the path info of the Rack request. If a directory is found, the file's contents will be presented in an html based index. If a file is found, the env will be passed to the specified app
- Rack::ETag: Automatically sets the ETag header on all String bodies.
- Rack::File: Rack::File serves files below the root directory given, according to the path info of the Rack request. e.g. when Rack::File.new(“/etc”) is used, you can access 'passwd' file as localhost:9292/passwd
- Rack::Head: returns an empty body for all HEAD requests. It leaves all other requests unchanged.
- Rack::Lint: validates your application and the requests and responses according to the Rack spec.
- Rack::Lock: locks every request inside a mutex, so that every request will effectively be executed synchronously.
- Rack::Logger: Sets up rack.logger to write to rack.errors stream
- Rack::MethodOverride: transform a POST request into a
  Request.new(env).POST["_method"] to simulate 'PUT/DELETE..."
- Rack::NullLogger: set the logger to null
- Rack::Recursive: allows applications called down the chain to include data from other applications (by using 'rack['rack.recursive.include'][...]' or raise a ForwardRequest to redirect internally.
  Rack::ForwardRequest gets caught by Rack::Recursive and redirects
  the current request to the app at +url+. 
  -> raise ForwardRequest.new("/not-found")
- Rack::Reloader: High performant source reloader
- Rack::Runtime: Sets an "X-Runtime" response header, indicating the response time of the request, in seconds
- Rack::Sendfile: The Sendfile middleware intercepts responses whose body is being served from a file and replaces it with a server specific X-Sendfile header. 
- Rack::ShowExceptions: catches all exceptions raised from the app it wraps.  It shows a useful backtrace with the sourcefile and clickable context, the whole Rack environment and the request data.
- Rack::ShowStatus catches all empty responses and replaces them with a site explaining the error.
- Rack::Static: middleware intercepts requests for static files (javascript files, images, stylesheets, etc) based on the url prefixes or route mappings passed in the options, and serves them using a Rack::File object. This allows a Rack stack to serve both static and dynamic content.
- Rack::TempfileReaper: tracks and cleans Tempfiles created throughout a request (i.e. Rack::Multipart)
- Rack::URLMap takes a hash mapping urls or paths to apps, and dispatches accordingly.  Support for HTTP/1.1 host names exists if the URLs start with <tt>http://</tt> or <tt>https://</tt>.

# server.rb:
Rack::Server.start(options) -> new(options).start
Options:
- :app a rack application to run (overrides :config)
- :config a rackup configuration file path to load (.ru)
- :environment
   this selects the middleware that will be wrapped around
   your application. Default options available are:
     - development: CommonLogger, ShowExceptions, and Lint
     - deployment: CommonLogger
     - none: no extra middleware
   note: when the server is a cgi server, CommonLogger is not included.
- :server choose a specific Rack::Handler, e.g. cgi, fcgi, webrick
- :daemonize if true, the server will daemonize itself (fork, detach, etc)
- :pid path to write a pid file after daemonize
- :Host the host address to bind to (used by supporting Rack::Handler)
- :Port the port to bind to (used by supporting Rack::Handler)
- :AccessLog webrick access log options (or supporting Rack::Handler)
- :debug turn on debug output ($DEBUG = true)
- :warn turn on warnings ($-w = true)
- :include add given paths to $LOAD_PATH
- :require require the given libraries

~~~ ruby
def default_options
  environment  = ENV['RACK_ENV'] || 'development'
  default_host = environment == 'development' ? 'localhost' : '0.0.0.0'
  {
    :environment => environment,
    :pid         => nil,
    :Port        => 9292,
    :Host        => default_host,
    :AccessLog   => [],
    :config      => "config.ru"
  }
end

def start
  ...
  server.run wrapped_app, options, &blk
end

def server
  @_server ||= Rack::Handler.get(options[:server]) || Rack::Handler.default(options)
end
  #and in handler.rb, Rack::Handler.default is
  def self.default(options = {})
    # Guess.
    if ENV.include?("PHP_FCGI_CHILDREN")
      # We already speak FastCGI
      options.delete :File
      options.delete :Port
      Rack::Handler::FastCGI
    elsif ENV.include?(REQUEST_METHOD)
      Rack::Handler::CGI
    elsif ENV.include?("RACK_HANDLER")
      self.get(ENV["RACK_HANDLER"])
    else
      pick ['thin', 'puma', 'webrick']
    end
  end

def wrapped_app
  @wrapped_app ||= build_app app
end

def build_app(app)
  middleware[options[:environment]].reverse_each do |middleware|
    middleware = middleware.call(self) if middleware.respond_to?(:call)
    next unless middleware
    klass, *args = middleware
    app = klass.new(app, *args)
  end
  app
end

def middleware
  self.class.middleware
end
def self.middleware
  default_middleware_by_environment
end
~~~
def self.default_middleware_by_environment
-> depending on the environment (by default 'development'), rake adds
default middleware:
- deployment -> Rack::ContentLength, Rack::Chunked, Rack::CommonLogger, Rack::TempfileReaper
- development -> Rack::ContentLength, Rack::Chunked, Rack::CommonLogger, Rack::ShowExceptions, Rack::Lint, Rack::TempfileReaper

# builder.rb

   Rack::Builder implements a small DSL to iteratively construct Rack
   applications:
    require 'rack/lobster'
    app = Rack::Builder.new do
      use Rack::CommonLogger
      use Rack::ShowExceptions
      map "/lobster" do
        use Rack::Lint
        run Rack::Lobster.new
      end
    end
    run app
   Or
    app = Rack::Builder.app do
      use Rack::CommonLogger
      run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['OK']] }
    end
    run app
   +use+ adds middleware to the stack, +run+ dispatches to an application.
   You can use +map+ to construct a Rack::URLMap in a convenient way.

Note: the config file is evaluated via
    eval "Rack::Builder.new {\n" + builder_script + "\n}.to_app",
and the commands in the builder block are instance_evaluated

~~~ ruby
  def initialize(default_app = nil,&block)
    @use, @map, @run, @warmup = [], nil, default_app, nil
    instance_eval(&block) if block_given?
  end
  
  def self.app(default_app = nil, &block)
    self.new(default_app, &block).to_app
  end
  def call(env)
    to_app.call(env)
  end
   #as you can see Builder.app converts directly to an app, so we can't add
   #middleware after the block. In app=Rack::Builder.new {...}, one can still
   #do app.use foo and so on.
  
  def to_app
    app = @map ? generate_map(@run, @map) : @run
    fail "missing run or map statement" unless app
    app = @use.reverse.inject(app) { |a,e| e[a] }
    @warmup.call(app) if @warmup
    app
  end
  
  # Specifies middleware to use in a stack.
  #   class Middleware
  #     def initialize(app)
  #       @app = app
  #     end
  #     def call(env)
  #       env["rack.some_header"] = "setting an example"
  #       @app.call(env)
  #     end
  #   end
  #   use Middleware
  #   run lambda { |env| [200, { "Content-Type" => "text/plain" }, ["OK"]] }
  #
  # All requests through to this application will first be processed by the middleware class.
  # The +call+ method in this example sets an additional environment key which then can be
  # referenced in the application if required.
  def use(middleware, *args, &block)
    if @map
      mapping, @map = @map, nil
      #if there are mapping, we need to build the currently constructed map
      #first before wrapping it, so add a 'middleware' that just generates
      #the current app with mappings
      @use << proc { |app| generate_map app, mapping }
    end
    @use << proc { |app| middleware.new(app, *args, &block) }
  end
  
  # Takes an argument that is an object that responds to #call and returns a Rack response.
  # The simplest form of this is a lambda object:
  #   run lambda { |env| [200, { "Content-Type" => "text/plain" }, ["OK"]] }
  # However this could also be a class:
  #   class Heartbeat
  #     def self.call(env)
  #      [200, { "Content-Type" => "text/plain" }, ["OK"]]
  #    end
  #   end
  #   run Heartbeat
  def run(app)
    @run = app
  end
  
  # Takes a lambda or block that is used to warm-up the application.
  #   warmup do |app|
  #     client = Rack::MockRequest.new(app)
  #     client.get('/')
  #   end
  #   use SomeMiddleware
  #   run MyApp
  def warmup(prc=nil, &block)
    @warmup = prc || block
  end
  
  # Creates a route within the application.
  #   Rack::Builder.app do
  #     map '/' do
  #       run Heartbeat
  #     end
  #   end
  # The +use+ method can also be used here to specify middleware to run under a specific path:
  #   Rack::Builder.app do
  #     map '/' do
  #       use Middleware
  #       run Heartbeat
  #     end
  #   end
  # This example includes a piece of middleware which will run before requests hit +Heartbeat+.
  #
  def map(path, &block)
    @map ||= {}
    @map[path] = block
  end
  
  private def generate_map(default_app, mapping)
    mapped = default_app ? {'/' => default_app} : {}
    mapping.each { |r,b| mapped[r] = self.class.new(default_app, &b).to_app }
    URLMap.new(mapped)
  end
~~~

En pratique donc, un middleware rack prend en initialisation une appli
rack; donc on peut composer les middleware comme ceci:
~~~ ruby
  Rack::Server.start(
    :app => Rack::ShowExceptions.new(Rack::Lint.new(Rack::Lobster.new)), :Port => 9292
  )
~~~
Mais Builder fournit le dsl 'use' qui permet plus simplement de faire
~~~ ruby
require 'rack/lobster'
app = Rack::Builder.new do
  use Rack::ShowExceptions
  use Rack::Lint
  run Rack::Lobster.new
end
run app #ceci marche dans un config.ru, donc on est déjà dans un Rack::Builder!
~~~
