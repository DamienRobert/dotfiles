vim: foldmethod=expr ft=markdownlight

# Doc and Infos
ES5: http://speakingjs.com/es5/index.html
https://github.com/getify/You-Dont-Know-JS #in depth reference
ES6=ES2015

Alternatives:
- coffee-script (1 to 1 mapper with more ruby/python like syntax)
  icedcoffeescript = coffeescript + await/defer control
  Similar to coffee-script: http://livescript.net/ (with better scoping,
  more functional), gorillascript (seems dead)
- typescript (strict superset, closely looks like future ecma 6.0 script)
- dart (google new langage)
- js6: https://github.com/lukehoban/es6features
       http://www.smashingmagazine.com/2015/10/es6-whats-new-next-version-javascript/
  babel: js6 transpiler => http://exploringjs.com/setting-up-es6.html
  Javascript object model and ES6 new class keyword: https://reinteractive.net/posts/235-es6-classes-and-javascript-prototypes
  http://blog.kwanso.com/using-ecmascript-6-with-rails-4-2-projects/

Javascript and ruby:
- https://medium.com/@gboxmuchacho/implementing-ruby-type-system-on-javascript-d1c242b7e721
- http://stantona.github.io/blog/2012/12/12/a-tale-of-two-object-models-javascript-and-ruby/ http://stantona.github.io/blog/2012/12/20/a-tale-of-two-object-models-javascript-and-ruby-part-2/ http://stantona.github.io/blog/2013/01/21/a-tale-of-two-object-models-javascript-and-ruby-part-3/
- http://howtonode.org/object-graphs-3 for a nice explanation of the two object models with graphs
[See also http://howtonode.org/object-graphs and http://howtonode.org/object-graphs-2]
- https://websela.wordpress.com/2013/08/14/object-models-smalltalk-ruby-javascript/
- http://resistor.io/blog/2013/08/31/a-bit-of-fun-javascript-behaviour-in-ruby/
- http://stackoverflow.com/questions/28359048/ruby-method-lookup-comparison-with-javascript

Ruby in javascript:
+ http://opalrb.org/
  ruby2js compiler
- http://rubyjs.org/
 RubyJS is a JavaScript implementation of all methods from Ruby classes like Array, String, Numbers, Time and more. 
- http://jsclass.jcoglan.com/ Ruby class model in javascript

Promises, async/await:
- https://zeit.co/blog/async-and-await

# Objects
JS equality is a bit insane: https://thomas-yang.me/projects/oh-my-dear-js/

a={foo: bar, 'foo bar': ["plim", "plom"]}
a.foo; a['foo bar']; var='foo bar'; a[var]

Constructor:
a="2"
'2'
b=String(2) //primitive value
'2'
c=new String("2") //wrapper object, see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[String: '2']
a===b //true
a===c //false
a==c //true
a===c.valueOf() //true
typeof(a) //'string'
typeof(c) //'object'

bar=Object.create(foo): create bar and set bar.__proto__=foo
The second argument to Object.create is passed to Object.defineProperties()
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperties
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty

Object.defineProperties(obj, {
  "property1": {
    value: true,
    writable: true
  },
  "property2": {
    value: "Hello",
    writable: false
  }
  // etc. etc.
});

Syntax: Object.defineProperties(obj, props)
- obj: The object on which to define or modify properties.
- props:
    An object whose own enumerable properties constitute descriptors for the properties to be defined or modified. Properties have the following optional keys:
  - configurable: true if and only if the type of this property descriptor may be changed and if the property may be deleted from the corresponding object.
  - enumerable: true if and only if this property shows up during enumeration of the properties on the corresponding object.
  - value: The value associated with the property. Can be any valid JavaScript value (number, object, function, etc).
  - writable: true if and only if the value associated with the property may be changed with an assignment operator.
  - get: A function which serves as a getter for the property, or undefined if there is no getter. The function return will be used as the value of property.
  - set: A function which serves as a setter for the property, or undefined if there is no setter. The function will receive as only argument the new value being assigned to the property.

# Prototypes:

http://stackoverflow.com/questions/572897/how-does-javascript-prototype-work
http://stackoverflow.com/questions/9959727/proto-vs-prototype-in-javascript

An object follow the __proto__ pseudo attribute for the attribute
inheritence chain.
When using 'obj=new Foo(20)', then
obj.__proto__ === Foo.prototype

Exemple: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
var mycar = new Car('Eagle', 'Talon TSi', 1993);

If using obj=Object.create(foo), then
obj.__proto__ === foo
(see below to see how to reimplement 'new' using Object.create)
Here is how to implement 'create':
~~~ js
function create(parent) {
  var F = function() {};
  F.prototype = parent;
  return new F();
}
~~~

obj -> Foo.prototype -> Object.prototype
Foo -> Function.prototype -> Object.prototype

Use 'hasOwnProperty' to check if the property is directly accessible from
the object without going through the __proto__ chain.

Example: left to right: __proto__, up to down: constructor
"abc" -> String.prototype -> Object.prototype 
       ( String              Object ) -> Function.prototype -> Object.prototype
                                         Function -> Function.prototype -> Object.prototype

# Functions

~~~ js
var foo=function(x) {
  this.foo=x
}
var obj={setfoo: foo}
obj.setfoo("foo")
obj.foo
~~~

A function return undefined if there is no explicit return.
In a 'method' call like above, this is set to the calling object.
There is also 'arguments' available that list the passed arguments
(if a function are more arguments than those passed, the left arguments are
'undefined', if there is more arguments passed, the extra arguments are
ignored, but available in 'arguments')

If a function is directly called, this is like calling a method on the
'main' global object

~~~ js
foo(2)
this.foo //2
~~~

To call a submethod inside a method, a trick is to use 'that' in a closure.

~~~
obj={
  double: function() {
    var that = this;
    var helper = function () {
      that.value = that.value+that.value;
    };
    helper();
  };
}
obj.double();
~~~

If the function is called with new: 'obj = new Foo()' then
'this' refers to a new object, whose __proto__ is Foo.prototype.

Finally, in foo.apply(that,[args]) then foo is called with 'this=that' and
the specified arguments. (alias: foo.call(that,arg1,arg2,...))
~~~
a=new Object()
a.foo="foo"
bar=function() { return this.foo }
bar.apply(a) //'foo'
~~~

foo.bind(that,arg1,arg2) creates a currified function (with this=that in
the currified function)
See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind

On function foo() vs var foo=function (): http://stackoverflow.com/questions/336859/var-functionname-function-vs-function-functionname
https://javascriptweblog.wordpress.com/2010/07/06/function-declarations-vs-function-expressions/

# Scope

The scope goes across blocks; it only respect function scopes which are
closures.

~~~ js
Function.method('curry', function ( ) {
  var slice = Array.prototype.slice,
      args = slice.apply(arguments),
      that = this;
  return function ( ) {
    return that.apply(null, args.concat(slice.apply(arguments)));
  };
});
add.curry(1)
~~~

Hoisting: http://www.w3schools.com/js/js_hoisting.asp
Une variable peut-être déclarée 'var' après sa définition
~~~ js
    f=function (x) { y=x; var y; return x}
    g=function (x) { y=x;  return x}
// dans f, 'y' est local mais pas dans g.
~~~

Si on déclare une fonction, 'function foo(x) {return x+1}', foo est aussi
sujet au hoisting, ie on peut utiliser foo avant de l'avoir déclarée:
var f=function(x) { g(3) ;function g(x) { return x+1}; return 2};
ici g est locale à f et on peut appeler g avant de la définir.
http://www.w3schools.com/js/js_function_definition.asp

Enfin si on oublie d'utiliser 'var', la règle est la suivante:
http://stackoverflow.com/questions/2485423/is-using-var-to-declare-variables-optional

"With regards to scope, it is not true that variables automatically become global. Rather, Javascript will traverse up the scope chain to see if you have used the variable before. If it finds an instance of a variable of the same name used before, it'll use that and whatever scope it was declared in. If it doesn't encounter the variable anywhere it'll eventually hit the global object (window in a browser) and will attach the variable to it."
~~~ js
var foo = "I'm global";
var bar = "So am I";

function () {
    var foo = "I'm local, the previous 'foo' didn't notice a thing";
    var baz = "I'm local, too";

    function () {
        var foo = "I'm even more local, all three 'foos' have different values";
        baz = "I just changed 'baz' one scope higher, but it's still not global";
        bar = "I just changed the global 'bar' variable";
        xyz = "I just created a new global variable";
    }
}

var foo = 1; // declared properly
bar = 2; // implied global (in a browser)
window.baz = 3; // global via window object
// Based on the answers so far, these global variables, foo, bar, and baz are all equivalent. This is not the case. Global variables made with var are (correctly) assigned the internal [[DontDelete]] property, such that they cannot be deleted.
delete foo; // false
delete bar; // true
delete baz; // true
foo; // 1
bar; // ReferenceError
baz; // ReferenceError
~~~

More details:
http://adripofjavascript.com/blog/drips/variable-and-function-hoisting
http://exploringjs.com/es6/ch_overviews.html

         Hoisting 	        Scope 	 Creates global properties
var 	 Declaration 	        Function Yes
let 	 Temporal dead zone 	Block 	 No
const 	 Temporal dead zone 	Block 	 No
function Complete 	        Block 	 Yes
class 	 No 	                Block 	 No
import 	 Complete 	        Module-global No

# Methods

When a function is created, the Function constructor does
    this.prototype = {constructor: this};
so when using the function in new, we can recover the constructor:
~~~ js
bar=new String("bar")
bar.__proto__ //=String.prototype
bar.constructor //=String.prototype.constructor=[Function: String]
~~~

~~~ js
//Add an instance method to a 'class' function
Function.prototype.method = function (name, func) {
  if (!this.prototype[name]) {
    this.prototype[name] = func;
  }
  return this;
};

//Set up Parent (technically Parent.prototype) as the superclass
Function.method('inherits', function (Parent) {
  this.prototype = new Parent();
  return this;
});

// reimplementation of 'new'
Function.method('new', function ( ) {
  // Create a new object that inherits from the  constructor's prototype.
  var that = Object.create(this.prototype);
  // Invoke the constructor, binding –this- to the new object.
  var other = this.apply(that, arguments);
  // If its return value isn't an object, substitute the new object.
  return (typeof other === 'object' && other) || that;
});
~~~

# Flow
switch (style) { //fallthrough
  case "latte":
  case "cappuccino":
    return true;
  default:
    return false;
};

Comments: /* */, //

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...of
for (var prop in obj) {} //iterates over the properties of obj
[2, 5, , 9].forEach(function(element,index,array){});
//for an array this is better than for in because the for in may output the elements in any order
for (let prop of obj) {} //iterates over the value of an iterator

Difference between for of and for in:
~~~ js
let arr = [3, 5, 7];
arr.foo = "hello";

for (let i in arr) {
   console.log(i); // logs "0", "1", "2", "foo"
}

for (let i of arr) {
   console.log(i); // logs "3", "5", "7"
}
~~~

# Global

In a browser, the top level variable is 'window', in nodejs 'global'

In nodejs, to write use 'console.log/info/warn'

# Null

> typeof(undefined)
'undefined'
> typeof(null)
'object'

# JSON
JSON.stringify; JSON.parse

# ECMA Script 6/ ECMA Script 2015
http://exploringjs.com/es6/index.html

- let (block scoped variable), const (like let but not modifiable)

- Destructuring with default:
  http://exploringjs.com/es6/ch_destructuring.html#ch_destructuring
  // Fail-soft destructuring with defaults
  var [a = 1] = [];
  a === 1 //true;

- modules, map, set, weakmap, weakset (weak mean that a reference to an object from a weakset does not prevent its garbage collection; it will be garbage collected unless another non weak structure/variable has a reference to it)
- binary and octal literal, new Math api, tail cail recursion

- symbols
https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Symbol
Used to get a unique identifier (locally in the scope) from a string; usage
is like symbols in ruby, but Symbol("foo") will produce a different symbol
each time it is called

## Proxy
https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Proxy

var p = new Proxy(target, handler);
Methos in p are routed to target, except if they are intercepted ('traps')
by handler
  var handler = {
      get: function(target, name){
          return name in target?
              target[name] :
              37;
      }
  };
  var p = new Proxy({}, handler);
  p.a = 1;
  p.b = undefined;
  console.log(p.a, p.b); // 1, undefined
  console.log('c' in p, p.c); // false, 37

## Classes
Classes are similar to coffee-script: http://www.2ality.com/2015/02/es6-classes-final.html
    class Foo {
        constructor(prop) {
            this.prop = prop;
        }
        static staticMethod() { //would be @staticMethod: ... in coffee
            return 'classy';
        }
        prototypeMethod() {
            return 'prototypical';
        }
    }
    let foo = new Foo(123);

    class Bar extends Foo { ... }

They also support getter and setter:

   class MyClass {
        get prop() {
            return 'getter';
        }
        set prop(value) {
            console.log('setter: '+value);
        }
    }
    let inst = new MyClass();
    inst.prop = 123;
    // setter: 123
    inst.prop
    // 'getter'
Method names can be dynamically computed when put inside brackets (in fact
this work for objects too: 'let foo={["var"+"name"]: "varname"}'
    class Foo() {
        myMethod() {}
    }
    class Foo() {
        ['my'+'Method']() {}
    }
    const m = 'myMethod';
    class Foo() {
        [m]() {}
    }

Using super:
- A class constructor (the pseudo-method constructor in a class literal) uses it like a function call (super(···)), in order to make a super-constructor call (line A).
- Method definitions (in object literals or classes, with or without static) use it like property references (super.prop) or method calls (super.method(···)), in order to refer to super-properties (line B).
(in coffee-script 'super' in a method calls directly the super method)

Note: The prototype of a subclass is the superclass, so that static methods
are inherited (in Coffee extends copies all class attributes, so it work the
same but not dynamically if a class method is added afterwads it won't be
in the subclass)

## Promises
https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise
https://www.promisejs.org/
Standard: https://promisesaplus.com/

- Promise.prototype.catch(onRejected)
    Appends a rejection handler callback to the promise, and returns a new promise resolving to the return value of the callback if it is called, or to its original fulfillment value if the promise is instead fulfilled.
- Promise.prototype.then(onFulfilled, onRejected)
    Appends fulfillment and rejection handlers to the promise, and returns a new promise resolving to the return value of the called handler. 
- Promise.resolve: https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve
  The Promise.resolve(value) method returns a Promise object that is resolved with the given value. If the value is a thenable (i.e. has a "then" method), the returned promise will "follow" that thenable, adopting its eventual state; otherwise the returned promise will be fulfilled with the value

function timeout(duration = 0) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, duration);
    })
}
var p = timeout(1000).then(() => {
    return timeout(2000);
}).then(() => {
    throw new Error("hmm");
}).catch(err => {
    return Promise.all([timeout(100), timeout(200)]);
})

When the promise is fullfilled, the 'then(onFulfilled)' callbacks are
called, this callback is the 'resolve' variable in the promise; when the
promise is rejected then the 'then(onRejected)' callback are called and
they arethe 'reject' variable (and 'catch' callbacks are called too)

Ex: http://www.html5rocks.com/en/tutorials/es6/promises/
var promise = new Promise(function(resolve, reject) {
  // do a thing, possibly async, then…

  if (/* everything turned out fine */) {
    resolve("Stuff worked!");
  }
  else {
    reject(Error("It broke"));
  }
});
promise.then(function(result) {
  console.log(result); // "Stuff worked!"
}, function(err) {
  console.log(err); // Error: "It broke"
});
// .then and .catch return promises so can be chained:
var promise = new Promise(function(resolve, reject) {
  resolve(1);
});
promise.then(function(val) {
  console.log(val); // 1
  return val + 2;
}).then(function(val) {
  console.log(val); // 3
});

"catch", it's just sugar for then(undefined, func)
 Promise rejections skip forward to the next "then" with a rejection callback (or "catch", since it's equivalent). With then(func1, func2), func1 or func2 will be called, never both. But with then(func1).catch(func2), both will be called if func1 rejects, as they're separate steps in the chain.

- Exemples:
fs.readFile('config.json',
    function (error, text) {
        if (error) {
            console.error('Error while reading config file');
        } else {
            try {
                const obj = JSON.parse(text);
                console.log(JSON.stringify(obj, null, 4));
            } catch (e) {
                console.error('Invalid JSON in file');
            }
        }
    });
readFilePromisified('config.json')
.then(function (text) { // (A)
    const obj = JSON.parse(text);
    console.log(JSON.stringify(obj, null, 4));
})
.catch(function (error) { // (B)
    // File read error or JSON SyntaxError
    console.error('An error occurred', error);
});

// How to convert between callback and promises
// cf https://www.promisejs.org/ which I made generic
function callback_to_promise(callback_func) {
  return function(value) {
    return new Promise(
      function (resolve, reject) {
        callback_func(value, function(error, result))
          if(error) reject(error);
          else resolve(result);
      }
    );
  }
}
function promise_to_callback(promise) {
  return function(value, callback) {
    promise.resolve(value).then(function(result) {
        callback(null, result);
      },
      function(error) {
        callback(error);
      }
    );
  }
}


## Iterator and for...of
/*
interface IteratorResult {
  done: boolean;
  value: any;
}
interface Iterator {
  next(): IteratorResult;
}
interface Iterable {
  [Symbol.iterator](): Iterator
}
*/
let fibonacci = {
  [Symbol.iterator]() {
    let pre = 0, cur = 1;
    return {
      next() {
        [pre, cur] = [cur, pre + cur];
        return { done: false, value: cur }
      }
    }
  }
}
for (var n of fibonacci) {
  // truncate the sequence at 1000
  if (n > 1000)
    break;
  console.log(n);
}

## Generators:
https://ponyfoo.com/articles/es6-generators-in-depth

/*
interface Generator extends Iterator {
    next(value?: any): IteratorResult;
    throw(exception: any);
    return(value?: any): value;
}
*/
var fibonacci = {
  [Symbol.iterator]: function*() {
    var pre = 0, cur = 1;
    for (;;) {
      var temp = pre;
      pre = cur;
      cur += temp;
      yield cur;
    }
  }
}
// Or simply:
function* fibonnaci() {
...
}
for (var n of fibonacci) {
  // truncate the sequence at 1000
  if (n > 1000)
    break;
  console.log(n);
}

Can use yield* to delegate to another generator function or an iterable
var foo = {
  [Symbol.iterator]: () => ({
    items: ['p', 'o', 'n', 'y', 'f', 'o', 'o'],
    next: function next () {
      return {
        done: this.items.length === 0,
        value: this.items.shift()
      }
    }
  })
}
function* multiplier (value) {
  yield value * 2
  yield value * 3
  yield value * 4
  yield value * 5
}
function* trailmix () {
  yield 0
  yield* [1, 2]
  yield* [...multiplier(2)]
  yield* multiplier(3)
  yield* foo
}
console.log([...trailmix()])
// <- [0, 1, 2, 4, 6, 8, 10, 6, 9, 12, 15, 'p', 'o', 'n', 'y', 'f', 'o', 'o']


## Modules
http://www.2ality.com/2013/07/es6-modules.html

// lib/math.js
export function sum(x, y) {
  return x + y;
}
export var pi = 3.141593;
// app.js
import * as math from "lib/math";
alert("2π = " + math.sum(math.pi, math.pi));

Alternative to export, after variable definition: export { multiply as mult, MY_CONSTANT as SOME_CONSTANT };

Import/Export:
  - import { multiply as mult } from 'lib/calc';
  - import 'lib/calc' as c; //=> c.multipliy
    import * as math from "lib/math";
  - Reexporting:     export * from 'lib/crypto';
  - default export:
      export default class { // anonymous class
      import Customer from 'models/Customer'; //the default exported class
Example:
  //  lib/mathplusplus.js
  export * from "lib/math";
  export var e = 2.71828182846;
  export default function(x) {
      return Math.exp(x);
  }
  // app.js
  import exp, {pi, e} from "lib/mathplusplus";
  alert("2π = " + exp(pi, e));

Module loader api:
  // Dynamic loading – ‘System’ is default loader
  System.import('lib/math').then(function(m) {
    alert("2π = " + m.sum(m.pi, m.pi));
  });
  // Create execution sandboxes – new Loaders
  var loader = new Loader({
    global: fixup(window) // replace ‘console.log’
  });
  loader.eval("console.log('hello world!');");
  // Directly manipulate module cache
  System.get('jquery');
  System.set('jquery', Module({$: $})); // WARNING: not yet finalized

# ECMA Script 7/ ECMA Script 2016

https://flaviocopes.com/es2016/
    Array.prototype.includes()
    Exponentiation Operator

# ECMA Script 8/ ECMA Script 2017
http://exploringjs.com/es2016-es2017.html
https://flaviocopes.com/es2017/

async/await: [cf also concurrency]
  https://ponyfoo.com/articles/understanding-javascript-async-await
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function

// Returns a promise
async function read () {
  //await a promise
  var html = await getRandomPonyFooArticle();
  /* Note in fact in the translation code bellow the awaited value is
   * wrapped under Promise.resolve() so it can be a Promise, a thenable or
   * even any value */
}

Under the hood use generators (await is like yield) and promises:
async function example (a, b, c) {
  example function body
}
  is transformed into
function example (a, b, c) {
  return spawn(function* () {
    example function body
  }, this);
}

function spawn (genF, self) {
  return new Promise(function (resolve, reject) {
    var gen = genF.call(self);
    step(() => gen.next(undefined));
    function step (nextF) {
      var next;
      try {
        next = nextF();
      } catch(e) {
        // finished with failure, reject the promise
        reject(e);
        return;
      }
      if (next.done) {
        // finished with success, resolve the promise
        resolve(next.value);
        return;
      }
      // not finished, chain off the yielded promise and `step` again
      Promise.resolve(next.value).then(
        v => step(() => gen.next(v)),
        e => step(() => gen.throw(e))
      );
    }
  });
}

Examples:
0) Callbacks
request('https://ponyfoo.com/articles/random', (err, res, html) => {
  if (err) { throw(err); }
  var md = hget(html);
  var txt = marked(md, { renderer: new Term() });
  console.log(txt);
});

1) Promises
// Wrap the request into a promise
function getRandomPonyFooArticle () {
  return new Promise((resolve, reject) => {
    request('https://ponyfoo.com/articles/random', (err, res, body) => {
      if (err) {
        reject(err); return;
      }
      resolve(body);
    });
  });
}
printRandomArticle();
function printRandomArticle () {
  getRandomPonyFooArticle()
    .then(html => hget(html, {
      markdown: true,
      root: 'main',
      ignore: '.at-subscribe,.mm-comments,.de-sidebar'
    }))
    .then(md => marked(md, {
      renderer: new Term()
    }))
    .then(txt => console.log(txt))
    .catch(reason => console.error(reason));
}

2) Generators
function getRandomPonyFooArticle (gen) {
  var g = gen();
  request('https://ponyfoo.com/articles/random', (err, res, body) => {
    if (err) {
      g.throw(err); return;
    }
    g.next(body);
  });
}
getRandomPonyFooArticle(function* printRandomArticle () {
  var html = yield;
  var md = hget(html, {
    markdown: true,
    root: 'main',
    ignore: '.at-subscribe,.mm-comments,.de-sidebar'
  });
  var txt = marked(md, {
    renderer: new Term()
  });
  console.log(txt);
});

3) Async
read();
async function read () {
  // Here getRandomPonyFooArticle is the Promise version
  var html = await getRandomPonyFooArticle();
  var md = hget(html, {
    markdown: true,
    root: 'main',
    ignore: '.at-subscribe,.mm-comments,.de-sidebar'
  });
  var txt = marked(md, {
    renderer: new Term()
  });
  console.log(txt);
}

# ES 9 / ES 2018

* https://flaviocopes.com/es2018/
- Rest/Spread Properties
  http://2ality.com/2016/10/rest-spread-properties.html

ES6 introduced the concept of a rest element when working with array destructuring:
const numbers = [1, 2, 3, 4, 5]
[first, second, ...others] = numbers
and spread elements:
const numbers = [1, 2, 3, 4, 5]
const sum = (a, b, c, d, e) => a + b + c + d + e
const sumOfNumbers = sum(...numbers)

ES2018 introduces the same but for objects.
Rest properties:
const { first, second, ...others } = { first: 1, second: 2, third: 3, fourth: 4, fifth: 5 }

Spread properties allow to create a new object by combining the properties of the object passed after the spread operator:
const items = { first, second, ...others }
items //{ first: 1, second: 2, third: 3, fourth: 4, fifth: 5 }

- Asynchronous iteration
for await of

- Promise.prototype.finally()
  finally() allow you to run some code regardless of the successful or not successful execution of the promise

- Regular Expression improvements 

* More detail on asynchronous iteration here:
http://2ality.com/2016/10/asynchronous-iteration.html

const asyncIterable = createAsyncIterable(['a', 'b']);
const asyncIterator = asyncIterable[Symbol.asyncIterator]();
asyncIterator.next() //<- this is a promise

Within an asynchronous function, you can process the results of the Promises via await and the code becomes simpler:
async function f() {
    const asyncIterable = createAsyncIterable(['a', 'b']);
    const asyncIterator = asyncIterable[Symbol.asyncIterator]();
    console.log(await asyncIterator.next());
}

- For await:
async function f() {
    for await (const x of createAsyncIterable(['a', 'b'])) {
        console.log(x);
    }
}

for-await-of can also be used to iterate over sync iterables:
for-await-of converts each iterated value via Promise.resolve() to a Promise, which it then awaits. That means that it works for both Promises and normal values.

- Asynchronous generators
async function* createAsyncIterable(syncIterable) {
    for (const elem of syncIterable) {
        yield elem;
    }
}
You can use await and for-await-of inside async generators. 

Queuing next() invocations:
Use case: Async generators as sinks for data, where you don’t always need to know when they are done.
const writer = openFile('someFile.txt');
writer.next('hello'); // don’t wait
writer.next('world'); // don’t wait
await writer.return(); // wait for file to close

async function* asyncGenerator() {
    console.log('Start');
    const result = await doSomethingAsync(); // (A)
    yield 'Result: '+result; // (B)
    console.log('Done');
}
Let’s take a closer look at line (A) and (B):
  - The yield in line (B) fulfills a Promise. That Promise is returned by next() immediately.
  - Before that Promise is fulfilled, the operand of await (the Promise returned by doSomethingAsync() in line (A)) must be fulfilled.

# ES 10 / ES 2019
https://medium.com/@selvaganesh93/javascript-whats-new-in-ecmascript-2019-es2019-es10-35210c6e7f4b

https://news.ycombinator.com/item?id=20563293
What’s New in ES2019 (tildeloop.com)
 => Now if we could just get pattern matching[1] and optional chaining[2], that would really elevate things.
  [1] https://github.com/tc39/proposal-pattern-matching
  [2] https://github.com/tc39/proposal-optional-chaining 

# Libraries

- Notes: full coroutine are implemented in node via fibers, see
https://github.com/yortus/asyncawait/issues/51
https://www.npmjs.com/package/fibers

- Observables (not in ecma script 7): http://reactivex.io/intro.html
Like promise but can return a collection of events.
A bit like python's async generators

- https://github.com/fantasyland/fantasy-land
  Specification for interoperability of common algebraic structures in JavaScript
  => Monads
  Started following the discussion at https://github.com/promises-aplus/promises-spec/issues/94

- Angular/Ember/React
https://github.com/infernojs/inferno
 An extremely fast, React-like JavaScript library for building modern user interfaces http://infernojs.org

- Flow https://flowtype.org/
  A static type checker for JavaScript
  Type inference and checking for a safer JavaScript.
  https://github.com/sinelaw/infernu 

- async/await implementations:
  https://github.com/yortus/asyncawait
  Note: asyncawait use node's fibers while the library co https://github.com/tj/co uses generators

  bluebird: promise (pre ES6 implementation)
  Promise.promisify convert callback to promise

  nodejs: util.promisify()
  http://2ality.com/2017/05/util-promisify.html
