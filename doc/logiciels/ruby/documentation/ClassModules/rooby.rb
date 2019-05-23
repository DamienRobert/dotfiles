# A simplified version of Ruby's object system, implemented in Ruby. This only
# supports a subset of Ruby, but is intended to accurately model inheritance
# and method lookup in as little code as possible, for ease of understanding by
# Ruby programmers.
#
# Classes implemented:
#
#     * Object
#     * Module < Object
#     * Class < Module
#     * Kernel, a module included in all Classes
#     * UnboundMethod
#     * Method
#
# This model implements the main features of Ruby's inheritance system:
#
#     * Instance method inheritance with #include
#     * Instance method inheritance with #prepend
#     * Instance and singleton method inheritance through subclassing
#     * Metaclasses, singleton methods and #extend
#
# It does diverge from Ruby on some edge cases. This has the effect of keeping
# the implementation simple while fixing what I consider to be bugs in the
# language ;)
#
#     * The double-inclusion problem does not exist in this implementation
#     * Class does not violate Liskov -- classes can be passed to #include
#     * The superclass of a Class can be a Module
#     * Metaclasses can be instantiated and subclassed
#
# Basically, a Class is just a Module that can be instantiated and that will
# inherit the singleton methods of its superclass.

module Rooby
  class Object
    RESERVED = [:instance_eval, :instance_exec, :==]
    (instance_methods - RESERVED).each { |m| undef_method m }

    attr_reader :class, :object_id

    def initialize(klass = nil)
      @class = klass
      @object_id = rand(2**32)
    end

    def metaclass
      @meta ||= Class.new(self, self.class)
    end

    def __send__(method_name, *args)
      if method = metaclass.instance_method(method_name)
        method.bind(self).call(*args)
      elsif method = metaclass.instance_method(:method_missing)
        method.bind(self).call(method_name, *args)
      else
        raise NoMethodError, "Undefined method `#{method_name}' for #{self}"
      end
    end
    alias :method_missing :__send__
  end

  class Module < Object
    def initialize(name = nil, &block)
      @name     = name
      @methods  = {}
      @includes = []
      @prepends = []
      instance_eval(&block) if block_given?
    end

    def ===(object)
      object.metaclass.ancestors.include?(self)
    end

    def ancestors(list = [])
      @includes.each { |m| m.ancestors(list) }
      list.unshift(self) unless list.include?(self)
      @prepends.each { |m| m.ancestors(list) }
      list
    end

    def define(method_name, &block)
      name = method_name.to_sym
      @methods[name] = UnboundMethod.new(self, name, block)
    end

    def include(mixin)
      @includes << mixin
    end

    def prepend(mixin)
      @prepends << mixin
    end

    def instance_method(method_name, include_ancestors = true)
      if include_ancestors
        ancestor = ancestors.find { |a| a.instance_methods(false).include?(method_name) }
        ancestor && ancestor.instance_method(method_name, false)
      else
        @methods[method_name]
      end
    end

    def instance_methods(include_ancestors = true, list = [])
      if include_ancestors
        @includes.each { |m| m.instance_methods(true, list) }
        @prepends.each { |m| m.instance_methods(true, list) }
      end
      @methods.each_key { |m| list << m unless list.include?(m) }
      list
    end

    def name
      case @name
      when String then @name
      else "<#{Class === self ? 'Class' : 'Module'}:#{@name}>"
      end
    end
    alias :inspect :name
  end

  class UnboundMethod < Object
    attr_reader :name

    def initialize(_module, name, block)
      @module = _module
      @name   = name
      @block  = block
    end

    def bind(receiver)
      Method.new(self, receiver, @block)
    end

    def inspect
      "<UnboundMethod: #{@module}##{name}>"
    end
  end

  class Method < Object
    def initialize(unbound, receiver, block)
      @unbound  = unbound
      @receiver = receiver
      @block    = block
    end

    def call(*args)
      @receiver.instance_exec(*args, &@block)
    end

    def inspect
      "<Method: #{@receiver}##{@unbound.name}>"
    end
  end

  Kernel = Module.new 'Kernel' do
    define :extend do |mixin|
      metaclass.include(mixin)
    end

    define :inspect do
      "<#{self.class.name}:#{object_id.to_s 16}>"
    end

    define :is_a? do |type|
      type === self
    end

    define :method do |method_name|
      metaclass.instance_method(method_name).bind(self)
    end

    define :methods do
      metaclass.instance_methods
    end

    define :respond_to? do |method_name|
      metaclass.instance_method(method_name) ? true : false
    end

    define :to_s do
      inspect
    end
  end

  class Class < Module
    attr_reader :superclass

    def initialize(name = nil, superclass = nil, &block)
      super(name, &block)
      @superclass = superclass
      if superclass
        @includes.unshift(superclass)
        metaclass.include(superclass.metaclass)
      end
      @includes.unshift(Kernel)
    end

    def new(*args)
      object = Object.new(self)
      object.__send__(:initialize, *args) if object.respond_to?(:initialize)
      object
    end
  end
end