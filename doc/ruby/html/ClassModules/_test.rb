$VERBOSE = nil
require File.expand_path('../rooby', __FILE__)


Person = Rooby::Class.new 'Person' do
  define :initialize do |name|
    @name = name
  end
  
  define :name do
    @name
  end
end

p Person.new('Alice').name      # "Alice"
p Person.new('Bob').name        # "Bob"


JSON = Rooby::Module.new 'JSON' do
  define :to_json do
    '{"hello": "world"}'
  end
end

Sum = Rooby::Module.new 'Sum' do
  define :wat do |a, b|
    a + b
  end
end

Product = Rooby::Module.new 'Product' do
  define :wat do |a, b|
    a * b
  end
end

Log = Rooby::Module.new 'Log' do
  define :wat do |a, b|
    Math.log(a) / Math.log(b)
  end
end

Foo = Rooby::Class.new 'Foo' do
  include JSON
  include Sum
  
  metaclass.define :a_singleton_method do
    [name, :this_is_cool]
  end
  
  define :hello do
    :hello_there
  end
  
  define :wat do |a, b|
    a ** b
  end
  
  define :method_missing do |sym, *args|
    [:missing, sym, args]
  end
end

Bar = Rooby::Class.new 'Bar', Foo


p Foo.ancestors                 # [Foo, Sum, JSON, Kernel]
p Foo.instance_methods.sort     # [:extend, :hello, :inspect, :is_a?, :method, :method_missing, :methods,
                                #     :respond_to?, :to_json, :to_s, :wat]

p Foo.a_singleton_method        # ["Foo", :this_is_cool]
p Bar.a_singleton_method        # ["Bar", :this_is_cool]

p Foo.new.is_a?(Foo)            # true
p Foo.new.is_a?(Bar)            # false
p Bar.new.is_a?(Foo)            # true
p Bar.new.is_a?(Bar)            # true
p Bar.new.is_a?(JSON)           # true

p Foo.new.method(:hello)        # <Method: <Foo:5af2d6dd>#hello>
p Foo.new.no_method(42)         # [:missing, :no_method, [42]]

p Foo.new.hello                 # :hello_there
p Foo.new.to_json               # "{\"hello\": \"world\"}"

p Foo.new.wat(3,4)              # 81
Foo.prepend(Product)
p Foo.ancestors                 # [Product, Foo, Sum, JSON, Kernel]
p Foo.new.wat(3,4)              # 12

o = Foo.new
p o.wat(3,4)                    # 12
o.extend(Log)
p o.wat(3,4)                    # 0.7924812503605781