vim: foldmethod=expr ft=markdownlight

Libraries
=========

python completion: https://docs.python.org/2/tutorial/interactive.html
Standard gui: idle

Better interpreters: bpython (automatically show interface of functions), and ipython (more complete, with a gui: ipython qtconsole), ptpython (not on archlinux)
See: http://www.pythoncentral.io/review-of-bpython-and-dreampie-alternative-python-shells/
jupyter: web notebook (extracted from ipython as a separate component;
'jupyter notebook' stores files as *.ipynb in the $PWD)

Packaging:
see http://stackoverflow.com/questions/6344076/differences-between-distribute-distutils-setuptools-and-distutils2
and http://xahlee.info/python/python_whats_pip_easyinstall_setuptools.html
Summary: pip is more powerfull than easy_install which is itself more
flexible than the original 'python setup.py install'
To build package use 'distutils' (in the stdlib) or 'setuptools' if more
features are needed.

Virtualenv: https://wiki.archlinux.org/index.php/Python_VirtualEnv

Scope
=====

http://stackoverflow.com/questions/291978/short-description-of-python-scoping-rules
LEGB Rule.
L. Local. (Names assigned in any way within a function (def or lambda)), and not declared global in that function.
E. Enclosing function locals. (Name in the local scope of any and all enclosing functions (def or lambda), form inner to outer.
G. Global (module). Names assigned at the top-level of a module file, or declared global in a def within the file.
B. Built-in (Python). Names preassigned in the built-in names module : open,range,SyntaxError,...

Les fonctions ne forment pas des closures, mais comme elles ouvrent un
nouveau scope on peut faire une closure en emboitant une fonction dans une
fonction:
x=0
def f(y): return x+y
f(3) #=> 3
x=1; f(3) #=> 4

def f(x):
  def g(y): return x+y
  return g
g=f(2) #cloture x->2+x

Scopes modifier: global, nonlocal (for nested function scopes)

Packages
========
* https://docs.python.org/3/reference/import.html

Unlike in ruby, in python
'import foo'
put all the names of foo.py into the 'foo' namespace.
To flatten the namespace, do
'from foo import ploum, plam' or 'from foo import *'
Use 'import foo.bar' to refer to the package foo/bar.py

* Regular package:
« Python defines two types of packages, regular packages and namespace packages. Regular packages are traditional packages as they existed in Python 3.2 and earlier. A regular package is typically implemented as a directory containing an __init__.py file. When a regular package is imported, this __init__.py file is implicitly executed, and the objects it defines are bound to names in the package’s namespace. The __init__.py file can contain the same Python code that any other module can contain, and Python will add some additional attributes to the module when it is imported. »

* python 3.3 implicit namespace package:
        If <directory>/foo/__init__.py is found, a regular package is imported and returned.
        If not, but <directory>/foo.{py,pyc,so,pyd} is found, a module is imported and returned. The exact list of extension varies by platform and whether the -O flag is specified. The list here is representative.
        If not, but <directory>/foo is found and is a directory, it is recorded and the scan continues with the next directory in the parent path.
        Otherwise the scan continues with the next directory in the parent path.
If the scan completes without returning a module or package, and at least one directory was recorded, then a namespace package is created. The new namespace package:
        Has a __path__ attribute set to an iterable of the path strings that were found and recorded during the scan.
        Does not have a __file__ attribute.

Then import foo.bar
will create the namespace foo (with contains as __path__ all the directory
foo/ found till now)
and then load the package bar in one of the foo found

Example:
Feanor /tmp/python $ tree                                                   ⚡25
├── foo1
│   └── baz
│       └── bar.py
├── foo2
│   └── baz
│       └── bar.py
└── main.py

~~~ python
 #foo1/baz/bar.py:
bar1="foo1"
 #foo2/baz/bar.py:
bar2="foo2"
 # main.py:
import sys
sys.path += ['foo1', 'foo2']
import baz.bar
print(baz.__path__) #=>_NamespacePath(['foo1/baz', 'foo2/baz'])
print(baz.bar.bar1) #=> foo1
print(baz.bar.bar2)
 #=>
Traceback (most recent call last):
  File "main.py", line 6, in <module>
    print(baz.bar.bar2)
AttributeError: 'module' object has no attribute 'bar2'
~~~
In this case still only the first 'bar.py' found is loaded.
Still if we rename foo2/baz/bar.py into foo2/baz/bar2.py, then
'import baz.bar2' would work because due to packages namespaces, 'baz'
refer to both 'foo1/baz' and 'foo2/baz' (cf the NamespacePath above)

* Note on names:
By default names with a leading underscore are not imported by import *.
This can be customized by setting the __all__ variable, to set up the
variables imported by import *

http://stackoverflow.com/questions/1301346/the-meaning-of-a-single-and-a-double-underscore-before-an-object-name-in-python
- _single_leading_underscore: weak "internal use" indicator. E.g. from M
  import * does not import objects whose name starts with an underscore.
- Any identifier of the form __spam (at least two leading underscores, at
  most one trailing underscore) is textually replaced with
  _classname__spam, where classname is the current class name with leading
  underscore(s) stripped. This mangling is done without regard to the
  syntactic position of the identifier, so it can be used to define
  class-private instance and class variables, methods, variables stored in
  globals, and even variables stored in instances. private to this class on
  instances of other classes.
- names __foo__ are internal to python
~~~ python
>>> class MyClass():
...     def __init__(self):
...             self.__superprivate = "Hello"
...             self._semiprivate = ", world!"
...
>>> mc = MyClass()
>>> print mc.__superprivate
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: myClass instance has no attribute '__superprivate'
>>> print mc._semiprivate
, world!
>>> print mc.__dict__
{'_MyClass__superprivate': 'Hello', '_semiprivate': ', world!'}
~~~

Syntax
======

python2 vs python3
------------------

In python2 strings are byte strings, use u'string' to get unicode strings:
  len("éà") #=>4
  len(u"éà") #=>2
  b"éà"=="éà" #=>True
open(file) reads binary file, the only effect of passing 'b' to the flags is
that no line conversion is done
  open("/tmp/ploum").read()
  '\xc3\xa9\nploum\n'
To open in utf-8:
  import codecs
  f = codecs.open(filename, encoding="utf-8")

In python3 strings are unicode strings, use b'string' to get byte streams
  u"éà"=="éà" #=>True
open(file) reads a unicode text, passing 'b' switchs to binary mode
  >>> open("/tmp/ploum").read()
  'é\nploum\n'
  >>> open("/tmp/ploum",'rb').read()
  b'\xc3\xa9\nploum\n'

In python2 'print' is a keyword, while in python3 it is a function call

Statements
----------

if test:
  block
elif test:
  block
else:
  block
end

if test: simple_statement1; simple_statement2
else: simple_statement3

x if y else z

for x in ploum:
  block
  if test: continue
  if test: break
else:
  block #called when there was no break

Examples:
for value in [1,2,3]: ...
for index,value in enumerate([1,2,3]): ...
h={"ploum": "plam", "plim": "plom"}
for k in {"ploum": "plam", "plim": "plom"}: h[k]
for k,v in h.items(): k,v

while test:
  block
  if test: continue
  if test: break
else:
  block #called when there was no break

try:
  block
except ValueError:
  block
except:
  block #catch all other errors
else:
  block #no errors
finally:
  block

Comprehension
-------------

squares = [x**2 for x in range(10)] #list comprehension
[(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
matrix = [
     [1, 2, 3, 4],
     [5, 6, 7, 8],
     [9, 10, 11, 12],
]
[[row[i] for row in matrix] for i in range(len(matrix[1])] #nested comprehension to transpose a matrix

{ x for x in range(10) } #set comprehension
{ x:x+1 for x in range(10) } #hash comprehension
( x for x in range(10) ) #generator

Slices
------

l=list(range(10))
l[:] #do a copy
l[1:3] #=> [1,2]
l[2:5:2] #=> [2,4]
l[5:2:-2] #=> [5,3]
l[::-1] #=> like l.revese() but do a copy

Assignement
-----------

a,*b,c=[1,2,3,4] #=> a=1, b=[2,3], c=4 #splat (like ruby)
(a,b),c=[(1,2),3] #stacked assignement (like ruby), a=1,b=2,c=3
a,(b,c)=(1,2),(3,4) #another example (like ruby): a=(1,2), b=3, c=4

Functions
---------

def foo(a,b=1,*args,c=5,**keywords):
  print(a,b,args,c,keywords)
foo(0) #=> 0, 1, (), 5, {}
foo(0,2) #=> 0, 2, (), 5, {}
foo(b=3,a=1) #=> 1, 3, (), 5, {}
foo(2,3,4) #=> 2 3 (4,) 5 {}
foo(2,3,4,5) #=> 2 3 (4, 5) 5 {}
foo(2,3,4,5,c=0, e=1, f=2) #=> 2 3 (4, 5) 0 {'e': 1, 'f': 2}

Lambda
------

f=lambda x: x+1
lambda x,y: x+y
(a lambda can only contain an expression, not several statements)

# Generators
## Generators as iterators
https://www.python.org/dev/peps/pep-0255/
https://wiki.python.org/moin/Generators
~~~ python
 # a generator that yields items instead of returning a list
def firstn(n):
    num = 0
    while num < n:
        yield num
        num += 1

sum_of_first_n = sum(firstn(1000000))

 # Using the generator pattern (an iterable) via a class
class firstn(object):
    def __init__(self, n):
        self.n = n
        self.num = 0
    def __iter__(self):
        return self
    # Python 3 compatibility
    def __next__(self):
        return self.next()
    def next(self):
        if self.num < self.n:
            cur, self.num = self.num, self.num+1
            return cur
        else:
            raise StopIteration()

 #square is a generator
square = (i*i for i in range(1000000))
 #add the squares
total = 0
for i in square:
   total += i
~~~

## Generators as coroutine:
https://www.python.org/dev/peps/pep-0342/
https://docs.python.org/2/reference/expressions.html

Voir aussi les references: https://marcarea.com/weblog/2016/04/06/coroutines-via-generateurs-ameliores-en-python
- Using Generators As an Alternative to Threads: http://chimera.labs.oreilly.com/books/1230000000393/ch12.html#_solution_208
- Generator Tricks for Systems Programmers: http://www.dabeaz.com/generators-uk/

  generator.next() [this is like generator.send(None)]
      Starts the execution of a generator function or resumes it at the last executed yield expression. When a generator function is resumed with a next() method, the current yield expression always evaluates to None. The execution then continues to the next yield expression, where the generator is suspended again, and the value of the expression_list is returned to next()‘s caller. If the generator exits without yielding another value, a StopIteration exception is raised.
  
  generator.send(value)
      Resumes the execution and “sends” a value into the generator function. The value argument becomes the result of the current yield expression. The send() method returns the next value yielded by the generator, or raises StopIteration if the generator exits without yielding another value. When send() is called to start the generator, it must be called with None as the argument, because there is no yield expression that could receive the value.
  
  generator.throw(type[, value[, traceback]])
      Raises an exception of type type at the point where generator was paused, and returns the next value yielded by the generator function. If the generator exits without yielding another value, a StopIteration exception is raised. If the generator function does not catch the passed-in exception, or raises a different exception, then that exception propagates to the caller.
  
  generator.close()
      Raises a GeneratorExit at the point where the generator function was paused. If the generator function then raises StopIteration (by exiting normally, or due to already being closed) or GeneratorExit (by not catching the exception), close returns to its caller. If the generator yields a value, a RuntimeError is raised. If the generator raises any other exception, it is propagated to the caller. close() does nothing if the generator has already exited due to an exception or normal exit.

Here is a simple example that demonstrates the behavior of generators and generator functions:
>>>

>>> def echo(value=None):
...     print "Execution starts when 'next()' is called for the first time."
...     try:
...         while True:
...             try:
...                 value = (yield value)
...             except Exception, e:
...                 value = e
...     finally:
...         print "Don't forget to clean up when 'close()' is called."
...
>>> generator = echo(1)
>>> print generator.next() #generator.__next__() in python3
Execution starts when 'next()' is called for the first time.
1
>>> print generator.next()
None
>>> print generator.send(2)
2
>>> generator.throw(TypeError, "spam")
TypeError('spam',)
>>> generator.close()
Don't forget to clean up when 'close()' is called.

## yield from
https://www.python.org/dev/peps/pep-0380/
New syntax in python3.3 to delegate to a subgenerator: yield from https://docs.python.org/dev/whatsnew/3.3.html#pep-380-syntax-for-delegating-to-a-subgenerator

Note that this syntax allows generators to return a value which will be
wrapped by StopIteration(value). This value is the result value of 'yield
from'. But this mean that StopIteration exception was not distinguished
from its use as a return value, so a normal StopIteration is wrapped into
RuntimeError; cf https://www.python.org/dev/peps/pep-0479/

'yield from g' is equivalent to 'for v in g: yield v'
except it also handles sending values or throwing exceptions to the generator
ie handles generator as coroutines: 
- http://stackoverflow.com/questions/9708902/in-practice-what-are-the-main-uses-for-the-new-yield-from-syntax-in-python-3
- http://simeonvisser.com/posts/python-3-using-yield-from-in-generators-part-2.html

~~~ python
def generator2():
    for i in range(10):
        yield i
def generator3():
    for j in range(10, 20):
        yield j

def generator():
    yield from generator2()
    yield from generator3()
~~~

Cf https://dl.dropboxusercontent.com/u/44884329/yield-from.pdf
How Python 3.3 "yield from" construct works

yield from is an expression:
 The value of the yield from expression is the first argument to the StopIteration exception raised by the iterator when it terminates.
return expr in a generator causes StopIteration(expr) to be raised upon exit from the generator.

## Coroutines with async/await
https://www.python.org/dev/peps/pep-0492/
https://snarky.ca/how-the-heck-does-async-await-work-in-python-3-5/
http://benno.id.au/blog/2015/05/25/await1

async def py35_coro():
    await stuff()

https://docs.python.org/3/reference/datamodel.html#coroutines
An awaitable object generally implements an __await__() method. Coroutine objects returned from async def functions are awaitable.

'await' = 'yield from', except it takes a coroutine as argument, ie an awaitable object rather than a generator (the two are similar but the types are different to distinguish between the usage;  It was a SyntaxError to have yield or yield from expressions in an async function; now by PEP 525 a yield in a async function generates an asynchronous generator)
'async def' transforms a function into a coroutine.
A generator can also be flagged as a coroutine using the decorator '@types.coroutine', it then becomes awaitable and can yield from an async def coroutine.

One can start an async def coroutine with coroutine().send(None)

https://www.python.org/dev/peps/pep-0492/
 await , similarly to yield from, suspends execution of read_data coroutine until db.fetch awaitable completes and returns the result data.
It uses the yield from implementation with an extra step of validating its argument. await only accepts an awaitable , which can be one of:
  - A native coroutine object returned from a native coroutine function .
  - A generator-based coroutine object returned from a function decorated with types.coroutine() .
  - An object with an __await__ method returning an iterator.
Also gives examples of 'async with' and 'async for' (cf below)

Example: https://docs.python.org/3/library/asyncio.html
~~~ python
async def display_date(loop):
    end_time = loop.time() + 5.0
    while True:
        print(datetime.datetime.now())
        if (loop.time() + 1.0) >= end_time:
            break
        await asyncio.sleep(1)

@types.coroutine
def display_date(loop):
    end_time = loop.time() + 5.0
    while True:
        print(datetime.datetime.now())
        if (loop.time() + 1.0) >= end_time:
            break
        yield from asyncio.sleep(1)
~~~

asynchronous iteration protocol (async for): define a class that implements __aiter__ and __anext__ to be able to use it in an async for statement.  __anext__ must returns an awaitable

~~~ python
class AsyncIterable:
    def __aiter__(self):
        return self

    async def __anext__(self):
        data = await self.fetch_data()
        if data:
            return data
        else:
            raise StopAsyncIteration

    async def fetch_data(self):

async for row in Cursor():
    print(row)
#would be equivalent to the following code:
i = Cursor().__aiter__()
while True:
    try:
        row = await i.__anext__()
    except StopAsyncIteration:
        break
    else:
        print(row)
~~~

Differences between 'native coroutines' and 'generator coroutines':
 Great effort has been made to make sure that coroutines and generators are treated as distinct concepts:
- Native coroutine objects do not implement __iter__ and __next__ methods. Therefore, they cannot be iterated over or passed to iter() , list() , tuple() and other built-ins. They also cannot be used in a for..in loop.
- An attempt to use __iter__ or __next__ on a native coroutine object will result in a TypeError .
- Plain generators cannot yield from native coroutines : doing so will result in a TypeError .
- generator-based coroutines (for asyncio code must be decorated with @asyncio.coroutine) can yield from native coroutine objects .
- inspect.isgenerator() and inspect.isgeneratorfunction() return False for native coroutine objects and native coroutine functions .
See https://hg.python.org/cpython/rev/7a0a1a4ac639,
http://bugs.python.org/issue24400 for why 'native coroutines' have a
different type from generators.

http://stackoverflow.com/questions/32582573/generator-based-coroutine-versus-native-coroutine
- Generators are iterable, and native coroutines are not.
- await foo is an expression whereas yield from foo is a statement, which means await can be used in places that yield from cannot.
- Native coroutines also permit new syntaxes like async context managers and async iterators. (because they are wrapped in awaitable)
- Coroutines have useful debugging messages, e.g. a warning if you never await a coroutine object.

http://stackoverflow.com/questions/39671950/is-there-any-reason-to-use-pythons-generator-based-coroutines-over-async-await?rq=1
At the end of the chain we need a 'generator based coroutine' to yield the
values (a 'native coroutine' can only return once). In practice
"coroutines yield asyncio.Future objects up to the event loop, and the event loop sends those same future objects back into the coroutine once the associated operations have been completed (they are typically scheduled via call_soon() and the other event loop methods)"
-> reference the very interesting thread on pep482: https://mail.python.org/pipermail/python-dev/2015-April/thread.html#139728


## Asynchronous generators
A generator allows to easily implement an iterable (__iter__,__next__),
while an asynchronous generator allow to easily implement an asynchronous
iterable (__aiter__, __anext__)

https://www.python.org/dev/peps/pep-0525/
~~~ python
class Ticker:
    """Yield numbers from 0 to `to` every `delay` seconds."""

    def __init__(self, delay, to):
        self.delay = delay
        self.i = 0
        self.to = to

    def __aiter__(self):
        return self

    async def __anext__(self):
        i = self.i
        if i >= self.to:
            raise StopAsyncIteration
        self.i += 1
        if i:
            await asyncio.sleep(self.delay)
        return i

async def ticker(delay, to):
    """Yield numbers from 0 to `to` every `delay` seconds."""
    for i in range(to):
        yield i
        await asyncio.sleep(delay)

## Summary
~~~ python
def func():            # a function
    return

def genfunc():         # a generator function
    yield
#=> this produce an iterable, ie with a __iter__ and __next__

async def coro():      # a coroutine function
    await smth()
#=> it is awaitable, ie with a __await__
#(both coro and genfunc have a send, throw, close)

async def asyncgen():  # an asynchronous generator function
    await smth()
    yield 42
#=> this produce an async iterable, ie with a __aiter__ and __anext__,
    and asend, athrow, aclose

## Ex: generator
def gen():
  for i in range(5):
    yield i

for i in gen():
  print(i)

### Manually:
g=gen()
g.__next__()
next(g)

## Coroutine generator
from types import *
@coroutine
def coro():
  for i in range(5):
    yield i
### Note: coro is still a generator, c=coro() has __next__ but not __anext__

for i in coro():
  print(i)

async def bar():
  await coro()

b=bar()
b.send(None)
b.send(None)
b.send(None)

async def agen():
  for i in range(5):
    yield i

async for i in agen():
  print(i)

def run(coros):
    coros = list(coros)

    while coros:
        # Duplicate list for iteration so we can remove from original list.
        for coro in list(coros):
            try:
                coro.send(None)
            except StopIteration:
                coros.remove(coro)
~~~

                         ========================
0) Genrators as iterators
for i in foo:
=> iter=foo.__iter__() puis next(iter)...
A genrator function returns a generator object: o=gen()
where o.__iter__() is simply o.

1) async from generators
def foo:
  yield from bar()
end
def bar:
  yield blocking_stuff
  return 42

=> The trampoline calls foo; which transfer to bar. The yield transfer back
'blocking_stuff' to the trampoline. The trampoline can launch other
procedures waiting for 'blocking_stuff' to be fullfilled. It then resumes
back bar, which returns 42; which is the value of 'yield from bar()'.
In async_io 'blocking_stuff' est une future, où
   def __iter__:
     if not self.done():
       # - Set by __iter__() below so that Task._step() can tell
       #   the difference between `yield from Future()` (correct) vs.
       #   `yield Future()` (incorrect).
       self._asyncio_future_blocking = True
       yield self  # This tells Task to wait for completion.
ie asyncio demande explicitement qu'on fasse 'yield from blocking_stuff'
plutôt que 'yield blocking_stuff' (qui marcherait en fait). Ca permet de
prendre le réflexe de mettre des 'yield from' partout, ie d'éviter 'yield
bar()' qui lui ne marcherait pas.
Ensuite quand asyncio reçoit une future dans le 'yield from future()', il
fait `future.add_done_callback(self._wakeup)`.

2) async/await
Quand on se sert des générateurs dans 1), il n'y a que le plus bas niveau
qui a besoin d'être un vrai générateur; les fonctions intermédiaires ne
font que faire du transfert en appelant 'yield from'. Pour ces fonctions
intermédiaires, on va donner le nouveau type 'coroutines' avec async/await.
Si c=coro(), c est une coroutine object, et c.__await__() donne
l'équivalent de asyncio ensure_future(c), ie wrappe c dans une generator
based coroutine:
def wrap(c)
  return (yield from c.__await__)

Cf the doc:
https://docs.python.org/3/reference/datamodel.html#object.__await__
object.__await__(self)
    Must return an iterator. Should be used to implement awaitable objects. For instance, asyncio.Future implements this method to be compatible with the await expression.

3.4.2. Coroutine Objects
Coroutine objects are awaitable objects. A coroutine’s execution can be controlled by calling __await__() and iterating over the result. When the coroutine has finished executing and returns, the iterator raises StopIteration, and the exception’s value attribute holds the return value. If the coroutine raises an exception, it is propagated by the iterator. Coroutines should not directly raise unhandled StopIteration exceptions.

 types.coroutine(gen_func)
    This function transforms a generator function into a coroutine function which returns a generator-based coroutine. The generator-based coroutine is still a generator iterator, but is also considered to be a coroutine object and is awaitable. However, it may not necessarily implement the __await__() method.

=> coroutines based generator: flag a generator with types.coroutine -- technically the flag is the CO_ITERABLE_COROUTINE
wheras CO_COROUTINE is used to mark native coroutines (defined with new syntax).
=> yield from checks for __iter__ while await checks for __await__ OR a
coroutine based generator


Classes
=======

x=0
class Foo:
  x=1 #Foo.x=1 (ie class variables map to class attributes)
  def f(self,y):
    return x+y #x refer to the global x(x=0) here
Foo().f(3)

A class is just a package of (method) attributes with inheritence chain:
class Foo(Bar,Baz) look at the inheritence of Bar then of Baz
Foo.__bases__ list the super classes of Foo
obj=Foo() #instance
obj.method(ploum) is a syntaxtic shortcut for Foo.method(obj,ploum)

In python2 Foo.f is an unbound method, whild in python3 Foo.f is simply a
function (so it gives an easy way to to get static class methods)

Classes and functions
---------------------
Foo.f => function (in python3, unbound method in python 2)
Foo().f => bound method

One can also define class methods by assigning functionals:
~~~ python
def f(self):
  print(self)
class Foo:
  fun=f
  l=lambda x: x
foo=Foo(); foo.fun(); foo.l()
~~~

New style classes
-----------------

In python2 old-style classes, attribute search is done in a depth first way
(starting on the left superclass).
In python3 we have new-style classes, to get them in python2 we need to
subclass object.
In this case the search is done in a breadth like fashion for diamond
shaped inheritence. The order of the search is available via Foo.__mro__:
~~~ python
class Bar: pass
class Baz: pass
class Foo: pass
class Foo(Bar,Baz): pass
Foo.__mro__ #=>(<class '__main__.Foo'>, <class '__main__.Bar'>, <class '__main__.Baz'>, <class 'object'>)
~~~

In new style:
- all classes inherit from object
- The super keyword looks through the mro inheritence chain
- A class can define __slots__ to restrict the attributes available to
  instances
- type(obj) returns the class of obj
  type(Class) is 'type', a metaclass is simply a subclass of type.
- buitin functions don't call __getattr__ and __getattribute__ on instance
  but on class.
  Ie before X[I] was X.__getitem__(I) but now is type(X).__getitem__(X,I)

Ex: slots
~~~ python
class Foo: pass
foo=Foo()
foo.__dict__ #hash managing foo's attributes
class Bar:
  __slots__=['age','name']
end
bar=Bar()
bar.name="bar" #ok
bar.foo="foo" #=>AttributeError: 'Bar' object has no attribute 'foo'
bar.__slots__ #=>['age', 'name']
bar.__dict__ #=>AttributeError: 'Bar' object has no attribute '__dict__'
~~~
Note: one can cheat by putting __dict__ in the __slots__ array, this give
back non slots attributes access

For all magic methods, cf http://www.rafekettler.com/magicmethods.html
For instance, to make an instance callable as a function, use __call__
~~~ python
class Foo:
  def __init__(self,x):
    self.x=x
  def __call__(self,y):
    return self.x+y

foo=Foo(2)
foo(3) #=> 5
~~~

# Decorators and descriptors

Decorator
---------
http://simeonfranklin.com/blog/2012/jul/1/python-decorators-in-12-steps/

@foo
def f:
  ...
Replace f by foo(f)

For instance to define a static method, use
@staticmethod
def f...
(In python 2 this is the only way to call a class method. In python 3,
Class.instance returns a function rather than an unbound method, so it can
be called directly. The @classmethod is still useful to call it from an
instance (because otherwise the instance would try to call the method f by
passing 'self' as first argument)
Cf http://stackoverflow.com/questions/735975/static-methods-in-python

Use @classmethod to define a class method
@classmethod
def f(cls,args) #here cls refer to the class

~~~ python
 #via a function
def logger(func):
    def inner(*args, **kwargs): #1
        print "Arguments were: %s, %s" % (args, kwargs)
        return func(*args, **kwargs) #2
    return inner
 #Notice our inner function takes any arbitrary number and type of parameters at point #1 and passes them along as arguments to the wrapped function at point #2. This allows us to wrap or decorate any function, no matter it's signature.
@logger
def foo1(x, y=1):
    return x * y

 #via an object
 #see: http://www.artima.com/weblogs/viewpost.jsp?thread=240808
class myDecorator:
  def __init__(self, f):
    self.f=f
  def __call__(self,*args,**kwargs):
    print("Self is: %s" % self)
    print("Arguments were: %s, %s" % (args, kwargs))
    return self.f(*args, **kwargs)

@myDecorator
def foo(x, y=1):
  return x+y
print(foo(3)) #self if myDecorator; Arguments were: (3,), {} => 4

class Foo:
  @myDecorator
  def foo(self):
    print("In foo")
    return self
 #this does not work because when Foo().foo is wrapped myDecorator it is just a function, not yet a method. So in myDecorator, 'self.f' refer to the foo with self unbound. Now when called, since foo is now a myDecorator and not an instance method, it won't get passed the current instance as parameter. This would work with a function wrapper for decorator because it would still be interpreted as a class method
print(Foo().foo())
~~~

See: http://stackoverflow.com/questions/306130/python-decorator-makes-function-forget-that-it-belongs-to-a-class
and http://www.ianbicking.org/blog/2008/10/decorators-and-descriptors.html
A trick to solve the above problem for instance methods is to combine the
decorator with a descriptor
~~~ python
    def __get__(self, obj, type=None):
        if obj is None:
            return self
        new_func = self.func.__get__(obj, type) #curry the function with the instance 'obj' [*]
        return self.__class__(new_func) #we wrap the curried function rather than the original function
        #this works because we use a descriptor to wrap the function at runtime rather than when the method is defined
 #Full example from the stackoverflow answer
class logger(object):
    def __init__(self, func):
        self.func = func
    def __get__(self, obj, type=None):
        return self.__class__(self.func.__get__(obj, type))
    def __call__(self, *args, **kw):
        print 'Entering %s' % self.func
        return self.func(*args, **kw)
class C(object):
    @logger
    def f(self, x, y):
        return x+y
C().f(1, 2)
 # => Entering <bound method C.f of <__main__.C object at 0x...>>
~~~
[*] Indeed according to https://docs.python.org/2/howto/descriptor.html,
the way a function is transformed to a method is via __get__:
~~~ python
class Function(object):
    def __get__(self, obj, objtype=None):
        "Simulate func_descr_get() in Objects/funcobject.c"
        return types.MethodType(self, obj, objtype)
~~~

Descriptor
----------

class Descriptor
  def __get__: pass
  def __set__: pass

class Foo
  foo=Descriptor() #use setter and getter from Descriptor

Ex: http://stackoverflow.com/questions/3798835/understanding-get-and-set-and-python-descriptors
~~~ python
class Celsius(object):
    def __init__(self, value=0.0):
        self.value = float(value)
    def __get__(self, instance, owner):
        #we store the property in the descriptor (=self=Celsius instance)
        #rather than the Temperature instance (=instance)
        return self.value
    def __set__(self, instance, value):
        self.value = float(value)
class Temperature(object):
    celsius = Celsius()

class Celsius:
    def __get__(self, instance, owner): return 9 * (instance.fahrenheit + 32) / 5
    def __set__(self, instance, value): instance.fahrenheit = 32 + 5 * value / 9
class Temperature:
    def __init__(self, initial_f): self.fahrenheit = initial_f
    celsius = Celsius()
t = Temperature(212)
print(t.celsius)
t.celsius = 0
print(t.fahrenheit)
~~~

Shortcut: 'property(getter,setter...)' or '@property attribute'
See http://stackoverflow.com/questions/17330160/how-does-the-property-decorator-work
~~~ python
class C(object):
    def __init__(self):
        self._x = None
    def getx(self):
        return self._x
    def setx(self, value):
        self._x = value
    def delx(self):
        del self._x
    x = property(getx, setx, delx, "I'm the 'x' property.")
#via a decorator
class C(object):
    def __init__(self):
        self._x = None
    @property
    def x(self):
        """I'm the 'x' property."""
        return self._x
    @x.setter
    def x(self, value):
        self._x = value
    @x.deleter
    def x(self):
        del self._x
~~~
The Descriptor Howto includes a pure python sample implementation of the property() type:
~~~ python
    class Property(object):
        "Emulate PyProperty_Type() in Objects/descrobject.c"

        def __init__(self, fget=None, fset=None, fdel=None, doc=None):
            self.fget = fget
            self.fset = fset
            self.fdel = fdel
            if doc is None and fget is not None:
                doc = fget.__doc__
            self.__doc__ = doc

        def __get__(self, obj, objtype=None):
            if obj is None:
                return self
            if self.fget is None:
                raise AttributeError("unreadable attribute")
            return self.fget(obj)

        def __set__(self, obj, value):
            if self.fset is None:
                raise AttributeError("can't set attribute")
            self.fset(obj, value)

        def __delete__(self, obj):
            if self.fdel is None:
                raise AttributeError("can't delete attribute")
            self.fdel(obj)

        def getter(self, fget):
            return type(self)(fget, self.fset, self.fdel, self.__doc__)

        def setter(self, fset):
            return type(self)(self.fget, fset, self.fdel, self.__doc__)

        def deleter(self, fdel):
            return type(self)(self.fget, self.fset, fdel, self.__doc__)
~~~

# Metaclasses

class ploum(metaclass=foo)
end
http://stackoverflow.com/questions/100003/what-is-a-metaclass-in-python

add a __metaclass__ attribute to ploum, so that class(ploum) is foo
The attribute lookup is as follow:
- look first on __bases__ as the __mro__ (for an instance, there is no
  superclasses, so only look on the instance)
- then go to the class, and search the __mro__ there (so for a class we go
  to the metaclass after superclasses)
There is a special case for handling descriptors (a descriptor with __set__
is prioritary to the whole scheme), and builtins go directly to step 2
(they skip the instance attribute)

In more details:
To look up an explicit attribute name:
1. From an instance I, search the instance, then its class, and then all its superclasses, using:
a. The __dict__ of the instance I
b. The __dict__ of all classes on the __mro__ found at I’s __class__ , from left to right
2. From a class C, search the class, then all its superclasses, and then its metaclasses tree, using:
a. The __dict__ of all classes on the __mro__ found at C itself, from left to right
b. The __dict__ of all metaclasses on the __mro__ found at C’s __class__ , from
left to right
3. In both rule 1 and 2, give precedence to data descriptors located in step b sources
4. In both rule 1 and 2, skip step a and begin the search at step b for built-in operations
[Note: step 3 is even more crazy than that, data descriptors in classes
override the object attributes if they have a setter but not if they only
have a getter. See the diagram in the link below]

https://docs.python.org/3/reference/datamodel.html#invoking-descriptors
http://blog.ionelmc.ro/2015/02/09/understanding-python-metaclasses/

# Examples
 ## read json file encoding information on servers (was used in offlineimap.py)
 #recursive merge from http://stackoverflow.com/questions/7204805/dictionaries-of-dictionaries-merge
def mergedicts(dict1, dict2):
    for k in set(dict1.keys()).union(dict2.keys()):
        if k in dict1 and k in dict2:
            if isinstance(dict1[k], dict) and isinstance(dict2[k], dict):
                yield (k, dict(mergedicts(dict1[k], dict2[k])))
            else:
                # If one of the values is not a dict, you can't continue merging it.
                # Value from second dict overrides one in first and we move on.
                yield (k, dict2[k])
                # Alternatively, replace this with exception raiser to alert you of value conflicts
        elif k in dict1:
            yield (k, dict1[k])
        else:
            yield (k, dict2[k])

if serverdict is None:
  file=open(os.environ['HOME']+"/mine/config/.authinfo")
  serverdict=json.load(file)
  auth = subprocess.check_output(["gpg", "--no-tty", "-d", os.environ['HOME']+"/mine/config/.authinfo.gpg"]).decode("utf-8")
  serverdict=dict(mergedicts(serverdict,json.loads(auth)))
  #print(serverdict)

# Asyncio
Originally called tulip
Pep: https://www.python.org/dev/peps/pep-3156/

asyncio is the event loop in the stdlib of python
- Cf https://snarky.ca/how-the-heck-does-async-await-work-in-python-3-5/
for the link with async/await
- Some Thoughts on Asynchronous Programming
  http://python-notes.curiousefficiency.org/en/latest/pep_ideas/async_programming.html#using-special-methods-in-explicitly-asynchronous-code
  "One challenge that arises when writing explicitly asynchronous code is how to compose it with other elements of Python syntax like operators, for loops and with statements. The key to doing this effectively is the same as that adopted when designing the concurrent.futures.as_completed() iterator API: these other operations should always return a Future or coroutine object, even if the result of the operation happens to be available immediately. This allows the user code to consistently retrieve the result via yield from. The implementation of __iter__ on Future objects and coroutines is such that they will return immediately if the result is already available, avoiding the overhead of a trip through the event loop." => this explain why 'await' is similar to 'yield from'

Other event librairies:
- http://www.gevent.org/
  gevent is a coroutine -based Python networking library that uses greenlet to provide a high-level synchronous API on top of the libev event loop. (greenlets are like ruby fibers)
- https://github.com/dabeaz/curio
  Curio - The coroutine concurrency library.
- http://trollius.readthedocs.io/index.html
  Port of asyncio to python2 (using yield since yield from does not exist and
  wrapping the objects in Future)
- twisted https://twistedmatrix.com/trac/
  Twisted is an event-driven networking engine written in Python

https://docs.python.org/3/library/asyncio-task.html#future
  A mix between a future and a promise (because of the 'add_done_callback')
  'This class is almost compatible with concurrent.futures.Future https://docs.python.org/3/library/concurrent.futures.html#concurrent.futures.Future'

Exemples:
- How to use asyncio ensure_future to act as a trampoline https://docs.python.org/3/library/asyncio-task.html#asyncio.ensure_future
  http://stackoverflow.com/questions/30380110/mutually-recursive-coroutines-with-asyncio (Note: one could also use asyncio's queue to send messages between the
  two coroutines rather than wrap the results into future)
  http://calebmadrigal.com/recursion-with-asyncio/

Implementation:

~~~ python
 # cpython/Lib/asyncio:
 # - coroutine.py
 # flag a generator as a 'coroutine'
 # also support awaitables and functions returning a future, not just generators
 # so that when wrapping a future result the return value is the result of
 # the future, not the future itself.
 # Note types.coroutine only flags a generator as a coroutine, cf Lib/types.py
def coroutine(func):
  if inspect.iscoroutinefunction(func):
      # In Python 3.5 that's all we need to do for coroutines
      # defined with "async def".
      return func

  if inspect.isgeneratorfunction(func):
      coro = func
  else:
    @functools.wraps(func)
    def coro(*args, **kw):
        res = func(*args, **kw)
        if (base_futures.isfuture(res) or inspect.isgenerator(res) or
              isinstance(res, CoroWrapper)):
            res = yield from res
        else:
            # If 'res' is an awaitable, run it.
            try:
                await_meth = res.__await__
            except AttributeError:
                pass
            else:
                if isinstance(res, collections.abc.Awaitable):
                    res = yield from await_meth()
            return res
        return res
    wrapper = _types_coroutine(coro)
    wrapper._is_coroutine = _is_coroutine  # For iscoroutinefunction().
    return wrapper

- future.py
 # yield from future => this yield the future to the event loop which adds a
 # callback to resume when the future is done (cf __iter__ below)
 # ie this is the way to wait for a future

class Future:
    # This field is used for a dual purpose:
    # - Its presence is a marker to declare that a class implements
    #   the Future protocol (i.e. is intended to be duck-type compatible).
    #   The value must also be not-None, to enable a subclass to declare
    #   that it is not compatible by setting this to None.
    # - It is set by __iter__() below so that Task._step() can tell
    #   the difference between `yield from Future()` (correct) vs.
    #   `yield Future()` (incorrect).
    _asyncio_future_blocking = False

    def __await__(self):
        if not self.done():
            self._asyncio_future_blocking = True
            yield self  # This tells Task to wait for completion.
        assert self.done(), "await wasn't used with future"
        return self.result()  # May raise too.
    __iter__ = __await__ # make compatible with 'yield from'.

- tasks.py
 # Essentially the event loop serves as a trampoline for the futures yielded
 # by the coroutines. A coroutine is wrapped into a future via the Task
 # class.

class Task(futures.Future):
    """A coroutine wrapped in a Future."""

    def __init__(self, coro, *, loop=None):
        assert coroutines.iscoroutine(coro), repr(coro)
        super().__init__(loop=loop)
        self._coro = coro
        self._fut_waiter = None
        self._loop.call_soon(self._step)
        self.__class__._all_tasks.add(self)

    def _step(self, exc=None):
        coro = self._coro
        self._fut_waiter = None
        try:
            # We use the `send` method directly, because coroutines
            # don't have `__iter__` and `__next__` methods.
            result = coro.send(None)
        except StopIteration as exc:
            self.set_result(exc.value)
        else:
            blocking = getattr(result, '_asyncio_future_blocking', None)
            if blocking is not None:
                # Yielded Future must come from Future.__iter__().
                if blocking:
                    result._asyncio_future_blocking = False
                    result.add_done_callback(self._wakeup)
                    self._fut_waiter = result
                else:
                    self._loop.call_soon(
                        self._step,
                        RuntimeError(
                            'yield was used instead of yield from '
                            'in task {!r} with {!r}'.format(self, result)))
            elif result is None:
                # Bare yield relinquishes control for one event loop iteration.
                self._loop.call_soon(self._step)
            else
               # Error a future was not yielded

    def _wakeup(self, future):
        try:
            future.result()
        except Exception as exc:
            # This may also be a cancellation.
            self._step(exc)
        else:
            # Don't pass the value of `future.result()` explicitly,
            # as `Future.__iter__` and `Future.__await__` don't need it.
            # If we call `_step(value, None)` instead of `_step()`,
            # Python eval loop would use `.send(value)` method call,
            # instead of `__next__()`, which is slower for futures
            # that return non-generator iterators from their `__iter__`.
            self._step()

 # cf http://stackoverflow.com/questions/27076577/yield-from-coroutine-vs-yield-from-task
 # ensure_future wraps a coro inside a Task (which is a future), so that we
 # can start a coroutine in the background
def ensure_future(coro_or_future, *, loop=None):
    """Wrap a coroutine or an awaitable in a future.
    If the argument is a Future, it is returned directly.
    """
    => return coro_or_future #for a future
    => return 'loop.create_task(coro_or_future)' #for a coroutine
       which essentially does 'tasks.Task(coro_or_future, loop=self)'
    => return ensure_future(_wrap_awaitable(coro_or_future), loop=loop) #for an awaitable
@coroutine
def _wrap_awaitable(awaitable):
    """Helper for asyncio.ensure_future().
    Wraps awaitable (an object with __await__) into a coroutine
    that will later be wrapped in a Task by ensure_future().
    """
    return (yield from awaitable.__await__())


* Exemple:
import asyncio
@asyncio.coroutine
def test1():
    print("in test1")

@asyncio.coroutine
def dummy():
    yield from asyncio.sleep(1)
    print("dummy ran")

@asyncio.coroutine
def main():
    asyncio.ensure_future(test1()) #using just 'test1()' would do nothing since it is wrapped into a coroutine object
    #=> we don't care to wait for the result of test1() in main, we can do other stuff
    yield from dummy()

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
 #=> in test1; dummy ran
~~~

# Ruby vs Python

Legend: + -> Advantage ruby, - -> Advantage python, = -> equality

= In ruby, everything (apart from keywords and variables) is a method call.
This is great for unicity, but this mean that to call a lambda one has to
use l.call(*args) or l[*args] or l.(*args); l(*args) will refer to the
method call self.l(*args).
By contrast python has methods (more precisely attributes that are functions) and functions

+ pry is better than ipython or bpython
+ rubygem is much much better than pip. + it is integrated directly on ruby
  On python the state fo packaging is not clear cut yet, see
  http://stackoverflow.com/questions/6344076/differences-between-distribute-distutils-setuptools-and-distutils2
+ python2 vs python3 is a horrible mess
- it's easier to access docstrings in python (where they are automatically
  transformed into attributes) than in ruby where we must use
  Method#source_location (or the gem MethodSource that wraps
  source_location)
- for scientific programming, there is a lot more available in python
  (sage, scipython...)

- python has multiple inheritences, and the inheritence can be changed at
  runtime. Ruby support multiple inheritence which is a bit less flexible
  (one can only include module although now on 2.2 refinements can transform
  class into modules) and we can only add to the inheritence at runtime (by
  dynamic include statements), not remove them (there are C extensions to
  manipulate the inheritence chain directly but it is not baked in the
  langage)
+ ruby has singleton_class. And the singleton_class of a class has for
ancestors the singleton_class of the ancestors of this class. This is
inspired by smalltalk and is so elegant that it solves all metaclass
problems, and allows to have metaclasses of metaclasses. The python
equivalent of metaclass is just subclassing type (in ruby this would be
subclassing Module) and class decorators; this is a lot less flexible
+ Likewise in ruby function decorator are simply instance methods of
Module, there is no need for the special @ syntax of python
- python has list/set/hash/generator comprehensions
+ ruby has blocks. Blocks are awesome!
+ ruby has continuations! And coroutines. Python has generators and
coroutines, but not continuations. Also coroutines are easier to handle in
ruby than in python (where we need decorators)
+ ruby has string interpolation directly in the string, there is no need to
call % or format like in python. Also regexp are there by defaut, no need
to load a module
+ reduce is there by default, no need to load a module either
- In python3 most of the builtins handling list like objects return
generators; while ruby2 has 'lazy' it has to be enabled by hand on an
enumerator, by default it won't be lazy
= both ruby and python easily support autovivication
cf http://en.wikipedia.org/wiki/Autovivification
http://stackoverflow.com/questions/651794/whats-the-best-way-to-initialize-a-dict-of-dicts-in-python
+ ruby can be used to replace some of perl's short oneliners; it uses the
same magic variables convention as perl and the same -F,-p,-e,-n,-a command
lines arguments

+ python has only lambda that wraps one expression. Also python don't have
real closures (python functions are like Proc.new in ruby:
~~~ python
x=0
def foo(y):
  return x+y
x=1
foo(2) #=>3
~~~
~~~ ruby
x=0; l=lambda {|y| x+y}; x=1; l.call(3) #=>3
 #to check, this now gives 4??
~~~
