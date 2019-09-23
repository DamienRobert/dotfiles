vim: foldmethod=expr ft=markdownlight
see also doc/html/*

# Static web generators
- webgen
- middleman:
http://12devs.co.uk/articles/204/ #Building static websites with Middleman
http://swapp.sexy/2015/02/26/build-a-blog-with-middleman-and-host-on-github-pages/
- jekyll (used by github https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/) 
  octopress (blog framework on top of jekyll) https://github.com/octopress/octopress

# Rack
- Rack: https://github.com/rack/rack
https://github.com/rack/rack/wiki/Tutorials
http://www.leighhalliday.com/what-is-rack
http://hawkins.io/2012/07/rack_from_the_beginning/
http://m.onkey.org/ruby-on-rack-2-the-builder

# Rack Helpers
+ Sprockets: Rack-based asset packaging [js and css with coffee/sass]
- https://github.com/charliesome/better_errors
  Better error page for Rack apps

# Microframeworks on top of rack:
+ https://github.com/jeremyevans/roda
  cf http://icelab.com.au/articles/put-http-in-its-place-with-roda/
- https://github.com/soveran/cuba
- https://github.com/wardrop/Scorched "Sinatra 2.0"
- https://github.com/ruby-grape/grape
  An opinionated micro-framework for creating REST-like APIs in Ruby
- https://github.com/sinatra/sinatra

-> Light stack: roda, sequel, dry-rb, dry-web/trailblazer (operations objects)
   http://dry-rb.org/ (types/validation)
   Sequel is used by rom (http://rom-rb.org/) and hanami-model
   Trailblazer can run above rails, hanami, roda, sinatra, grape...

Doc:
http://webdesignmoo.com/2014/10-best-ruby-frameworks-for-developers/
http://www.sitepoint.com/ruby-microframeworks-round/
https://blog.engineyard.com/2015/life-beyond-rails-brief-look-alternate-web-frameworks-ruby
https://www.reddit.com/r/ruby/comments/3ghp6o/nonrails_frameworks_in_ruby_cuba_sinatra_padrino/
http://www.madebymarket.com/blog/dev/ruby-web-benchmark-report.html

# Web frameworks:
+ rails: the ruby web framework [http://www.skilledup.com/guides/learn-ruby-programming-language-course-guide/]
+ padrino: web framework built on top of sinatra
+ lotus: http://lotusrb.org/ (simple mvc framework)
  Now hanami: http://hanamirb.org/
  Example of rails code vs hanami code:
  https://blog.codeminer42.com/from-rails-to-hanami-controllers-ad7ef6d09dd0
+ volt: client and server in ruby
  http://www.toptal.com/ruby/meet-volt-a-promising-ruby-framework-for-dynamic-applications
? https://hyperstack.org/
  Hyperstack is a Ruby DSL, compiled by Opal, bundled by Webpack, powered by React.

Old frameworks:
- http://ramaze.net/
- https://github.com/camping/camping

# Rails helpers

- Installing rails installs:
rails coffee-rails jquery-rails sprockets-rails [asset pipeline] sass-rails jbuilder [json DSL] sdoc [searchable HTML RDoc generator] spring [rail app preloader] sqlite3 turbolinks web-console [web debugger] uglifier [js compressor]
- Gems I also install (cf :webrailsextra):
  pry-rails jquery-ui-rails
  kaminari will_paginate [pagination]
  sorcery clearance [auth]
  formtastic [forms] refile [attachement] sidekiq [background process] letter_opener [Preview email in the default browser instead of sending it]

Usefull Gems [note: some are also rack helpers]:
- https://vexxhost.com/blog/10-essential-useful-ruby-on-rails-4-gems/
- https://medium.com/@riklomas/my-favourite-ruby-gems-services-89fb47341c05
- http://www.codebeerstartups.com/2013/04/must-have-gems-for-development-machine-in-ruby-on-rails/
- http://www.devinterface.com/blog/en/2013/12/le-15-migliori-gemme-per-web-applications-ruby-on-rails/
- http://www.reddit.com/r/ruby/comments/2ynx5j/a_gem_for_every_occasion_11_great_ruby_libraries/
- http://hawkins.io/2015/03/on-ruby/ #minimalist gems

Authentification:
https://www.ruby-toolbox.com/categories/rails_authentication
+ https://github.com/plataformatec/devise
  Flexible authentication solution for Rails with Warden
  [More Complete than Clearance]
+ https://github.com/NoamB/sorcery
  devise a bit too complicated, people recommand sorcery
  Or a bit like sequel vs activerecord: rodauth (rack compatible, based on roda)
  cf https://www.reddit.com/r/ruby/comments/5pz317/dhh_answers_what_makes_rails_a_framework_worth/
- https://github.com/thoughtbot/clearance
  Rails authentication with email & password.
- https://github.com/intridea/omniauth
  OmniAuth is a flexible authentication system utilizing Rack middleware.
- https://github.com/doorkeeper-gem/doorkeeper
  Doorkeeper is an OAuth 2 provider for Rails.
- Authorization Library: Authority or Pundit (or CanCanCan)

Pagination:
- https://github.com/amatsuda/kaminari
  A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3 and 4
  [Another pagination gem is will_paginate]

Nortification: (instead of 'flash')
- https://github.com/RobinBrouwer/gritter
This Ruby on Rails gem allows you to easily add Growl-like notifications to your application using a jQuery plugin called 'gritter'.

Controllers:
- https://github.com/hashrocket/decent_exposure
  A helper for creating declarative interfaces in controllers

Views:
- https://github.com/drapergem/draper
  Decorators/View-Models for Rails Applications
- https://github.com/apotonick/cells
  Components for Rails.
  http://nicksda.apotomo.de/2015/06/cells-4-0-goodbye-rails-hello-ruby/

Forms: SimpleForm, +Formtastic
Attachements: PaperClip, CarrierWave, +Refile
Background Processing: Delayed_Job, +Sidekiq (https://github.com/mperham/sidekiq)
Administration: Active Admin
Mails Debug: Letter Opener (letter opener intercepts the mail when it gets sent and opens it in a new tab in your browser, you don't have to write anything extra, just tell letter opener to work in development.rb)

# Javascript libraries:
React: http://reactrb.org/ [Ex: to use in Cuba http://www.sitepoint.com/use-react-today-in-ruby-by-heading-to-cuba/]

# Ruby on Rails with javascript libraries:
- https://github.com/reactjs/react-rails
- http://angular-rails.com/
- https://github.com/zetachang/react.rb
  Opal Ruby wrapper of React.js library.
# ORM
- ActiveRecord
- Sequel http://sequel.jeremyevans.net/
  https://mrbrdo.wordpress.com/2013/10/15/why-you-should-stop-using-activerecord-and-start-using-sequel/
  https://bits.theorem.co/building-sql-expressions-with-sequel/
- DataMapper [seem to be no longer updated]
- https://github.com/rom-rb/rom [=DataMapper2]
  http://rom-rb.org/
See: http://solnic.eu/2011/11/29/the-state-of-ruby-orm.html

- https://github.com/DatabaseCleaner/database_cleaner
Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.

# Testing
- capybara: https://github.com/jnicklas/capybara
  Capybara helps you test web applications by simulating how a real user would interact with your app
- watir: automating web browsers (ie, firefox, chrome)
- spork: A DRb server for testing frameworks (RSpec / Cucumber currently) that forks before each run to ensure a clean testing state.
- factory girl: A library for setting up Ruby objects as test data. 
  https://robots.thoughtbot.com/mind-bending-factories

- http://planetruby.github.io/gems/html-proofer.html
  Test html files

# Servers
- thin: faster and more flexible web server than webbrick
  (see also mongrel, unicorn, puma, phusion passenger now rebranded raptor
  cf http://www.rubyraptor.org/how-we-made-raptor-up-to-4x-faster-than-unicorn-and-up-to-2x-faster-than-puma-torquebox/
  Nowadays puma and passenger are the most interesting:
  http://blog.scoutapp.com/articles/2017/02/10/which-ruby-app-server-is-right-for-you)

# CMS
http://codecall.net/2014/02/10/best-ruby-on-rails-content-management-systems-cms/
https://www.ruby-toolbox.com/categories/content_management_systems

On rails: refinery, http://refinerycms.com/
On sinatra: nesta, http://nestacms.com/

# HTTP Clients
- Faraday
  Similar to rack, can have middleware, and different adapters
  By default use net/http in the stdlib; but can also use among others:
  - httpclient ('httpclient' gives something like the functionality of libwww-perl (LWP) in Ruby => binary httpclient)
  - typhoeus (Typhoeus wraps libcurl in order to make fast and reliable requests [parallel requests])
  - patron (Ruby HTTP client based on libcurl)
  - excon (Usable, fast, simple Ruby HTTP 1.1)

- httparty: simpler to use than faraday but less configurable 
  No middleware, wraps around net/http
- http.rb: pure ruby http implementation (do not use net/http)
- rest-client.rb: Simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions [wraps around net/http]

- https://github.com/janko-m/down: wrapper around open-uri which is a
  wrapper of net/http

# Xml parsers

- nokogiri
- oga: Oga is an XML/HTML parser written in Ruby
  http://code.yorickpeterse.com/oga/latest/file.migrating_from_nokogiri.html
