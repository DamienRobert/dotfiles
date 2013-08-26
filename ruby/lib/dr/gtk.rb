#From:
#http://ruby-gnome2.sourceforge.jp/hiki.cgi?tips_threads
#helps using Gtk with threads

require 'monitor.rb'

module Gtk
  GTK_PENDING_BLOCKS = []
  GTK_PENDING_BLOCKS_LOCK = Monitor.new

  def Gtk.queue &block
    if Thread.current == Thread.main
      block.call
    else
      GTK_PENDING_BLOCKS_LOCK.synchronize do
        GTK_PENDING_BLOCKS << block
      end
    end
  end

  def Gtk.main_with_queue timeout
    Gtk.timeout_add timeout do
      GTK_PENDING_BLOCKS_LOCK.synchronize do
        for block in GTK_PENDING_BLOCKS
          block.call
        end
        GTK_PENDING_BLOCKS.clear
      end
      true
    end
    Gtk.main
  end
end

##First, force all your your Ruby threads to start from within the main loop using the standard Gtk.init method. You can call Gtk.init as many times as necessary. For example:

#Gtk.init_add do
#  DBus.start_listener
#end

## Start your Gtk application by calling Gtk.main_with_queue rather than Gtk.main. The "timeout" argument is in milliseconds, and it is the maximum time that can pass until queued blocks get called: 100 should be fine.
## 
## Whenever you need to queue a call, use Gtk.queue. For example:

# def my_event_callback
#   Gtk.queue do
#     @image.pixbuf = Gdk::Pixbuf.new @image_path, width, height
#   end
# end
