vim: foldmethod=expr ft=markdownlight
http://coffeescript.org/
In the repl, use ^V to go to multiline mode

coffee2 now output es6: http://coffeescript.org/announcing-coffeescript-2/

# Objects

Like in js, or more yaml like
bar=
  ploum: "plom"
  plim: "plam"

bar=ploum: "plom", plim: "plam"

Ranges: [1..10], [1...10] #exclude 10

foo['prop'] ?= "bar" //alias for 'if !foo['prop']? then foo['prop']="bar"

Object.create accept a descriptor (see Javascript for more details):
homer =
  'first-name': 'Homer'
  'last-name': 'Simpson'
homerTwo = Object.create homer,
  clone:
    value: true
    writable: false
  'middle-name':
    value: 'Clone'
    writable: false
homerTwo.clone # true

# this

foo.method() // this=foo in method
In coffeescript, @ is an alias for this, and with @ the dot is unnecessary:
someElement.onclick = ->
  this.innerHTML = 'Got clicked!'
someElement.onclick = ->
  @innerHTML = 'Got clicked!'

Remember than a function call without a receiver use the global object as
'this', so the following code won't work
someElement.onclick = ->
  setTimeout ->                    
    this.innerHTML 'Got clicked' , 1000
A solution is to use a closure:
someElement.onclick = ->
  clicked=this
  setTimeout ->                    
    clicked.innerHTML 'Got clicked' , 1000
In coffee, the fat arrow bind 'this' lexically to its current value, so we
can do
someElement.onclick = ->
  setTimeout =>                    
    this.innerHTML 'Got clicked' , 1000

# Class

~~~ coffee
class Animal
  constructor: (@name) ->
  //shortcut for constructor: (name) -> @name = name

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()
~~~
Compiles to
~~~ js
var Animal, Horse, Snake, sam, tom,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Animal = (function() {
  function Animal(name) {
    this.name = name;
  }

  Animal.prototype.move = function(meters) {
    return alert(this.name + (" moved " + meters + "m."));
  };

  return Animal;

})();

Snake = (function(superClass) {
  extend(Snake, superClass);

  function Snake() {
    return Snake.__super__.constructor.apply(this, arguments);
  }

  Snake.prototype.move = function() {
    alert("Slithering...");
    return Snake.__super__.move.call(this, 5);
  };

  return Snake;

})(Animal);

Horse = (function(superClass) {
  extend(Horse, superClass);

  function Horse() {
    return Horse.__super__.constructor.apply(this, arguments);
  }

  Horse.prototype.move = function() {
    alert("Galloping...");
    return Horse.__super__.move.call(this, 45);
  };

  return Horse;

})(Animal);

sam = new Snake("Sammy the Python");
tom = new Horse("Tommy the Palomino");
sam.move();
tom.move();
~~~

Access to the prototype has a shortcut via '::'
String::dasherize = ->
  this.replace /_/g, "-"
So Class.method -> class method
   Class::method -> instance method

Class methods can be set easily since in a class 'this' is the class:
class Animal
  this.find = (name) ->
  //equivalently: @find: or @find=
Animal.find("Parrot")

Examples: http://arcturo.github.io/library/coffeescript/03_classes.html
extend = (obj, mixin) ->
  obj[name] = method for name, method of mixin
  obj
include = (klass, mixin) ->
  extend klass.prototype, mixin
include Parrot,
  isDeceased: true
(new Parrot).isDeceased

Class variables: http://www.cs8.my/2012/09/coffeescript-classes-and-their-variables/
    class Animal 
      @nose: 1
      nose2: 1
      @nose3 = 1
      nose4 = 1
      constructor: () ->
        legs: 5
        legs2 = 4
        @legs3 = 4
    a = new Animal
    b = new Animal
Compiles to
    var Animal, a, b, c, d;
    Animal = (function() {
      var nose4;
      Animal.nose = 4;
      Animal.prototype.nose2 = 1;
      Animal.nose3 = 1;
      nose4 = 1;
      function Animal() {
        var legs2;
        ({
          legs: 5
        });
        legs2 = 4;
        this.legs3 = 4;
      }
      return Animal;
    })();
So the dictionary is 
    @nose:   -> Animal.nose
    nose2:   -> Animal.prototype.nose2
    @nose3 = -> Animal.nose3
    nose4 =  -> nose4
    within the constructor: 
    legs: -> ({legs})
    legs2 = -> legs2
    @legs3 = -> this.legs3
so to sum it up, in your class definition:
  @nose: or @nose = defines a static (class) variable/function
  nose: defines a prototype variable/function
  nose= defines a private variable/function
in your constructor:
  nose= defines a private variable for an instance of the class
  @nose= defines an ‘instance’ variable for an instance of the class 

# Strings

String interpolation: "foo #{bar}"
Heredocs:
a="""
foo
bar
"""
(the """ form can be interpoled, not the ''' form)

# Functions

f=(x)->x+1 //implicit return
f(2); f 3
f.call(obj,args) #in f, makes 'this' equals to 'obj'

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."

awardMedals = (first, second, others...) -> //splats
  gold   = first
  silver = second
  rest   = others
medals=["foo","bar"]
awardMedal "one", "two", medals...

do
  1+1
  2+2
-> Shortcut for defining an anonymous function and calling it immediatly
afterwards, allows to have block level variables inside the do block

Examples:
do (a,b) ...
is converted to 'function (a,b) { ... } (a,b)'
and
do (a="foo") ...
is converted to 'function(a) {...} ("hello")

# Variables

Variables are created automatically, they bubble up the scope (which is
functional based, like in js), and if they bubble all the way
up the variable is created locally (by contrast with js where it is created
globally if not declared with 'var')
Cf https://github.com/jashkenas/coffeescript/issues/712

[So in practice the first time a variable foo is declared coffee script
translates to 'var foo=...' but then inside the scope it uses 'foo=...'
so the js code bubble up to the foo variable in the upper scope. With
javascript one can decide whether to use 'var foo=' or 'foo='. One can
emulate this with coffee by using javascript interpolation: `var foo` or by
using a function scope. Recall that 'do' defines an anonymous function which
gets called immediatly, so something like
foo=10
do(foo) -> //we use the name foo as a parameter to not overwrite the variable foo
  foo=11
foo //=>10
]

Destructuring:
[theBait, theSwitch] = [theSwitch, theBait]
[open, contents..., close] = tag.split("")
futurists =
  sculptor: "Umberto Boccioni"
  painter:  "Vladimir Burliuk"
  poet:
    name:   "F.T. Marinetti"
    address: [
      "Via Roma 42R"
      "Bellagio, Italy 22021"
    ]
{poet: {name, address: [street, city]}} = futurists
// compiled to: ref = futurists.poet, name = ref.name, (ref1 = ref.address, street = ref1[0], city = ref1[1]);

class Person
  constructor: (options) -> 
    {@name, @age, @height} = options
tim = new Person age: 4

  user = name: 'Foo', age: 42
  # { name: 'Foo', age: 42 }
  { name: name, age: age } = user //destructuring
  # { name: 'Foo', age: 42 }
  { name, age } = user //destructuring shortcut
Similar shortcut: handler="handler"; foo={handler} #=>{handler: "handler"}

# Flow

Whitespace based, as in python:
for i in [1,2,3]
  console.log(i)

for key of object
  console.log(key)
for key,value of object
  ...

if true then 2 else 3
foo if true

object? #check that object is defined and not null
Works also for accessor:
zip = lottery.drawWinner?().address?.zipcode
(returns null if an accessor is not defined)

a is var; a isnt var #aliases for == and != (mapped in js to === and !==)
&& (alias and), || (alias or)

switch style
  when "latte", "cappuccino"
    yes //alias for true
  else
    no //alias for false

Comments: #
Herecomments: ### comment ###
Hereregexps: /// regexp ///

Weakly typed: "foo"+8 #-> "foo8"

try, catch, finally; throw

Raw js: `js`

Chained comparison: healthy = 200 > cholesterol > 60

# Comprehension

(parentheses here are only for visibility)
foo=(i+1 for i in [1,2,3] when i%2==1)
foo=(i for i in [1..10] by 2) #=>[1,3,5,7,9]

for own property of object ...

//a for expression is in fact a list comprehension
values=for key,value of bar
  value

courses = ['greens', 'caviar', 'truffles', 'roast', 'cake']
menu i + 1, dish for dish, i in courses //here i is the index in the array

# Async

Standard sync composition:
~~~ coffee
compose = (f, g) -> (x) -> f g x
before = (decoration) ->
  (base) ->
    (params...) ->
      decoration params...
      base params...
after = (decoration) ->
  (base) ->
    (params...) ->
      result = base params...
      decoration params...
      result
around = (decoration) ->
  (base) ->
    (params...) ->
      callback = -> base params...
      decoration ([callback].concat params)...
~~~
Usage:
~~~ coffee
withAuditLog = before (params...) ->
  auditLog params...
auditedRefund = withAuditLog refund
withOpenDb = around (dbActivity) ->
  openDbConnection()
  dbActivity()
  closeDbConnection()
~~~

~~~ Listing 6.6 Before, after, and around with function binding
before = (decoration) ->
  (base) ->
    (params...) ->
      decoration.apply @, params
      base.apply @, params
after = (decoration) ->
  (base) ->
    (params...) ->
      result = base.apply @, params
      decoration.apply @, params
      result
around = (decoration) ->
  (base) ->
    (params...) ->
      result = undefined
      func = => result = base.apply @, params
      decoration.apply @, ([func].concat params)
      result
~~~

Async composition:
~~~ coffee
composeAsync = (f, g) -> (x) -> g -> f x
//ie fog = (callback) -> g(() -> f(callback))
beforeAsync = (decoration) ->
  (base) ->
    (params..., callback) ->
      result = undefined
      applyBase = => 
        result = base.apply @, (params.concat callback)
      decoration.apply @, (params.concat applyBase)
      result
afterAsync = (decoration) ->
  (base) ->
    (params..., callback) ->
      decorated = (params...) => 
        decoration.apply @, (params.concat -> (callback.apply @, params))
      base.apply @, (params.concat decorated)
~~~

# ECMA Script 6

- Rest arguments:
Coffee:
rest = (a, b, r...) -> r
rest 1,2,3,4,5,6,7
spread = [1,2,3,4,5,6,7]
rest spread

JS:
rest = function (a, b, ...r) {  return r; }  
rest(1,2,3,4,5,6,7); 

- String interpolation:
Coffee: "ploum #{plam}"
JS: `ploum ${plam}`

- Fat arrow:
let square = (x) => x * x

- generators: in ES6 the generators functions are marked with '*': 'function ploum*', in coffee they are automatically detected by their use of 'yield'

# Future of coffee script

See coffee 2.0 which will implement ES6
https://github.com/jashkenas/coffeescript/milestone/10
https://github.com/coffeescript6/discuss
Ex: 
- https://github.com/coffeescript6/discuss/issues/1
  let/const/var
- https://github.com/coffeescript6/discuss/issues/35
  Block assignment let and const operators
  See https://github.com/jashkenas/coffeescript/issues/712 for the discussion of variable scope in cs1
- https://github.com/coffeescript6/discuss/issues/36
  coffeescript 2.0
