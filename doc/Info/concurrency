vim: foldmethod=expr ft=markdownlight

# Clojure delay/futures/promises
Delay: something that is evaluated when needed (and kept in memory)

~~~ clojure
user=> (def my-delay (delay (println "did some work") 100))
 #'user/my-delay
user=> @my-delay
 did some work
 100
user=> @my-delay
 100
~~~

Future: something run in a thread (or a pool of thread)

~~~ clojure
;; A future's calculation is started here and it runs in another thread
user=> (def f (future (Thread/sleep 10000) (println "done") 100))
 #'user/f
;;if you wait 10 seconds before dereferencing it you'll see "done"

;; When you dereference it you will block until the result is available.
user=> @f
 done
 100

;; Dereferencing again will return the already calculated value.
=> @f
 100
~~~

Promises: like a pipe, something that will get a value, and then can get chained to another promise

~~~ clojure
user=> (def x (promise))
 #'user/x
;; Trying to deref at this point will make your repl wait forever

user=> (deliver x 100)
 #<core$promise$reify__5534@4369a50b: 100>

;; the promise has been delivered, deref x will return immediately
user=> @x
 100
~~~

# JS promises:
https://promisesaplus.com/
https://blog.domenic.me/youre-missing-the-point-of-promises/
Rappel: 
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve
Promise.resolve(value)
  The Promise.resolve(value) method returns a Promise object that is
  resolved with the given value. If the value is a thenable (i.e. has a
  "then" method), the returned promise will "follow" that thenable,
  adopting its eventual state; if the value was a promise, that object
  becomes the result of the call to Promise.resolve; otherwise the returned
  promise will be fulfilled with the value.
promise.then(foo) => promise.fullfill(value)
va faire essentiellement Promise.resolve(foo(value))
en particulier foo(value) peut être une valeur, et donc la nouvelle promise
sera fullfillée avec cette valeur, ou une nouvelle Promise (ou un thenable
qu'on considère qu'il va se comporter comme une Promise)

# Async models/concurrency

Trampoline: https://en.wikipedia.org/wiki/Tail_call#Through_trampolining
Generators and Coroutines: 
- https://eli.thegreenplace.net/2009/08/29/co-routines-as-an-alternative-to-state-machines/
+ http://www.dabeaz.com/generators/index.html
  http://www.dabeaz.com/coroutines/
  http://www.dabeaz.com/finalgenerator/

## Callback to promises to async (see also [Javascript]):
https://medium.com/@bluepnume/learn-about-promises-before-you-start-using-async-await-eb148164a9c8#.wxf2gxxxv
https://medium.com/@rdsubhas/es6-from-callbacks-to-promises-to-generators-87f1c0cd8f2e#.1ip6tvy8j
https://developers.google.com/web/fundamentals/getting-started/primers/async-functions
https://strongloop.com/strongblog/node-js-callback-hell-promises-generators/

## async/await in
  C#: https://msdn.microsoft.com/en-us/library/mt674882.aspx
  Dart: https://www.dartlang.org/articles/language/await-async
        https://www.dartlang.org/articles/language/beyond-async
  Python: https://www.python.org/dev/peps/pep-0492/
  Js: https://github.com/tc39/ecmascript-asyncawait

## Promises are (almost) monads:
  https://gist.github.com/briancavalier/3296186 A proof that Promises/A is a Monad
  https://github.com/promises-aplus/promises-spec/issues/94 Incorporate monads and category theory
  http://kybernetikos.com/2012/07/10/design-pattern-wrapper-with-composable-actions/ Design Pattern: Wrapper with Composable Actions
  https://brianmckenna.org/blog/category_theory_promisesaplus Category Theory for Promises/A+ (very interesting discussion)
  https://hackernoon.com/from-callback-to-future-functor-monad-6c86d9c16cb5#.pwpt0ar4r From Callback to Future -> Functor -> Monad
  https://blog.jcoglan.com/2011/03/11/promises-are-the-monad-of-asynchronous-programming/ Promises are the monad of asynchronous programming

## Continuation:
[See Info/Functional/Continuations]
http://stackoverflow.com/questions/14019341/whats-the-difference-between-a-continuation-and-a-callback
http://softwareengineering.stackexchange.com/questions/212057/what-is-an-example-of-a-continuation-not-implemented-as-a-procedure

* callback passing style to continuation monads
http://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/
  => https://news.ycombinator.com/item?id=8984648

http://www.well-typed.com/blog/2015/02/ziria/ (=http://www.well-typed.com/blog/105/) "Monads: From Web 2.0 to Hardware Drivers"
http://blog.paralleluniverse.co/2015/08/07/scoped-continuations/ "From Imperative to Pure-Functional and Back Again: Monads vs. Scoped Continuations"

* Delimited continuations
https://en.wikipedia.org/wiki/Delimited_continuation
https://stackoverflow.com/questions/6058959/difference-between-delimited-and-undelimited-continuations

Implémentation en ruby:
https://max.computer/blog/delimited-continuations-in-ruby-part-1/
https://max.computer/blog/delimited-continuations-in-ruby-part-2-generators-and-coroutines/
https://github.com/mveytsman/DelimR

## Actors (scala) vs coroutines (go):
http://stackoverflow.com/questions/22621514/is-scalas-actors-similar-to-gos-coroutines
Mention the book reactive design pattern: https://www.manning.com/books/reactive-design-patterns

## Internal vs external iterators
  And why internal iterators need some sort of continuation (to return
  several level up)
  http://journal.stuffwithstuff.com/2013/01/13/iteration-inside-and-out/
  http://journal.stuffwithstuff.com/2013/02/24/iteration-inside-and-out-part-2/
  http://journal.stuffwithstuff.com/2013/04/17/well-done/

  Going from external to internal is easy. For the reverse you need some
  sort of continuations/coroutines/fibers: In C#
  https://blogs.msdn.microsoft.com/cyrusn/2004/05/19/internal-and-external-iterators/
  https://blogs.msdn.microsoft.com/cyrusn/2004/06/07/internal-vs-external-iterators-revisted/

## async/await in python and js

* Modèles de concurrence en python
https://bytes.yingw787.com/posts/2019/02/09/concurrency_with_python_csp_and_coroutines/
Historique sur async/await: http://masnun.com/2015/11/13/python-generators-coroutines-native-coroutines-and-async-await.html

* Résumé
On a des méthodes avac callback:
read_line(cb), fetch_url(url, cb)
=> read_line( 
     line => fetch_url(line,
       html => print(html)
     )
   )
Où en linéarisant:
do_fetch = line => fetch_url(line, print)
read_line(do_fetch)

On peut transformer ça en promise
Promise(read_line).then( line => Promise(fetch_url(line)) )

On peut aussi utiliser des générateurs
read_line_gen(gen):
  gen()
  read_line(line => gen.send(line))
read_line_gen(
  line=yield
  fetch_url(line, ...))

On peut wrapper tout ça dans asysnc/await:
async foo:
  await bar1
  await bar2
=> transforme foo en générateur, et lance wrap_foo:
wrap_foo:
  step(() => f.next)
  step(nextF):
    cb=nextF()
    cb(result => step(() => f.next(result))

Où quand les awaitable sont des promises:
wrap_foo:
  step(() => f.next)
  step(nextF):
    promise=nextF()
    promise.then(result => step(() => f.next(result))

C'est là que python et js diffère. Dans js une async func retourne une
promise, donc
async function bar() {...}
async function foo() { await bar() }
=> await bar() se comporte comme si on avait fait await promise
[on rappelle que promise1.then(() => promise2)) se transforme en promise2
quand promise1 est fullfillée]

Alors que dans python await fait juste du transfer de contrôle; jusqu'à ce
qu'on tombe sur une gérérator based coroutine qui va yielder une vrai
future (dans asyncio):
async def foo:
  await bar()
async def bar:
  await asyncio.sleep(1)
Ici le wrapper va directement recevoir la future représentée par
asyncio.sleep(1).
Ca a l'avantage d'être plus léger (pas besoin de wrapper les coroutines) et
de laisser le choix d'implém à la boucle d'évènements (en bout de chaîne
est-ce qu'on veut des futures... ou autre chose); par contre avec js comme
les async func sont wrappées dans des promises c'est plus simple à
manipuler (on ne les distingue pas des vraies promises).
