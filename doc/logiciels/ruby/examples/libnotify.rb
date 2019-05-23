#!/usr/bin/ruby
#example of ruby binding for libnotify
#requires the gem 'gir_ffi'
require 'gir_ffi'
GirFFI.setup :Notify
Notify.init("Hello world")
Hello = Notify::Notification.new("Hello world!", "This is an example notification.", "dialog-information")
Hello.show
sleep(2)
Hello.update("Good bye world","This is the updated notification.","dialog-warning")
Hello.show
