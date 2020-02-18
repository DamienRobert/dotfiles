vim: fdm=expr ft=markdownlight

* C
See the gnu lib c version: https://stackoverflow.com/questions/9705660/check-glibc-version-for-a-particular-gcc-compiler
$ ldd --version
Ou
$ gcc -print-file-name=libc.so
$ cat /usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/../../../../lib/libc.so
$ /usr/lib/libc.so.6
GNU C Library (GNU libc) stable release version 2.30.

To see the required version, cf ldd -v

* Tar
http://unix.stackexchange.com/questions/108100/why-are-tar-archive-formats-switching-to-xz-compression-to-replace-bzip2-and-wha

* Ruby
http://stackoverflow.com/questions/1381725/how-to-make-no-ri-no-rdoc-the-default-for-gem-install

* Shell
http://unix.stackexchange.com/questions/213799/can-bash-write-to-its-own-input-stream/217390#217390

http://stackoverflow.com/questions/27159322/rgb-values-of-the-colors-in-the-ansi-extended-colors-index-17-255

* Containers
http://superuser.com/questions/111152/whats-the-proper-way-to-prepare-chroot-to-recover-a-broken-linux-installation

* How to switch up to a live tmpfs system:
http://unix.stackexchange.com/questions/226872/how-to-shrink-root-filesystem-without-booting-a-livecd/227318#227318
- takeover.sh: automatic script to do this
  https://news.ycombinator.com/item?id=13622301, hacker's news discussion
- https://github.com/drizzt/vps2arch
  Similar ideas to install archlinux on top of a running vps

* Git
http://stackoverflow.com/questions/9392365/how-would-git-handle-a-sha-1-collision-on-a-blob/34599081#34599081

* Core files
https://stackoverflow.com/questions/1050482/debug-core-file-with-no-symbols
https://stackoverflow.com/questions/10616417/debugging-core-files-generated-on-a-customers-box/10629444#10629444

* Meta:
https://meta.mathoverflow.net/questions/4351/how-to-cite-comment-by-unknown-user-disproving-erd%c5%91s-conjecture/4352#4352
=> https://meta.mathoverflow.net/questions/505/printer-friendly-versions#4175
=> StackPrinter

Questions
=========

* http://stackoverflow.com/questions/28649472/ruby-refinements-subtilities

There is a pretty good documentation of the current implementation of refinements in ruby here:
http://ruby-doc.org//core-2.2.0/doc/syntax/refinements_rdoc.html,
but there are some strange corner cases.

First, `include module` is orthogonal to `using module` (one include the instance method of module while the other activates the refinement). But there is a trick to include a refinement module itself, see
http://stackoverflow.com/questions/18551058/better-way-to-turn-a-ruby-class-into-a-module-than-using-refinements.

    def to_module(klass)
      Module.new do
        #note that we return the refinement module itself here
        return refine(klass) {
          yield if block_given?
        }
      end
    end
    
    class Base
      def foo
        "foo"
      end
    end
    class Receiver
      include to_module(Base) {
        def foo
          "refined " + super
        end
      }
    end
    Receiver.new.foo #=> "refined foo"

Strangely this refinement module can't be used with `using`!

    m=to_module(Base) {}
    m.class #=> Module
    using m    
    #=>TypeError: wrong argument type Class (expected Module)

So using only work on the enclosing module of the refinement modules.
Secondly I wanted to use the above yield trick to be able to pass a Proc to refine (even through it only accepts a block), without resorting to converting the Proc back to source as in
https://www.new-bamboo.co.uk/blog/2014/02/05/refinements-under-the-knife/.
But using `yield` as in the include example does not work:

    def ref_module1(klass)
      Module.new do
        refine(klass) {
          yield
        }
      end
    end
    
    class Receiver1
      using ref_module1(Base) {
        def foo
          "refined " + super
        end
      }
      def bar
        Base.new.foo
      end
    end
    Receiver1.new.bar #=> NoMethodError: super: no superclass method `foo'

We see that Receiver1 still use Bar#foo and not the refined method.
Howewer we can use `module_eval` instead:

    def ref_module2(klass,&b)
      Module.new do
        refine(klass) {
          module_eval(&b)
        }
      end
    end

    class Receiver2
      using ref_module2(Base) {
        def foo
          "refined " + super
        end
      }
      def bar
        Base.new.foo
      end
    end
    Receiver2.new.bar #=> "refined foo"

I don't quite understand why `module_eval` works here and not the `yield` method. Inside the refinement block, the 'default_definee' is the refinement module, so `module_eval` which puts the 'default_definee' to `self`='the refinement module' should not affect it. And indeed in the 'include' example at the beginning, I get the same result when I use `module_eval` or a direct `yield`.

Can anyone explain this behavior?
