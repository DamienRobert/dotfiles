class Meme
  def i_can_has_cheezburger?
    "OHAI!"
  end

  def will_it_blend?
    "YES!"
  end
end

require "minitest/autorun"
#Expectations: http://docs.seattlerb.org/minitest/Minitest/Expectations.html
#begin ...: mapped to setup, after ...: mapped to teardown

#describe name, desc: will create a new class which is a subclass of the
#surrounding describe class:
# Defines a test class subclassing from either Minitest::Spec or
# from the surrounding describe's class. The surrounding class may
# subclass Minitest::Spec manually in order to easily share code:
#     class MySpec < Minitest::Spec
#       # ... shared code ...
#     end
#
#     class TestStuff < MySpec
#       it "does stuff" do
#         # shared code available here
#       end
#       describe "inner stuff" do
#         it "still does stuff" do
#           # ...and here
#         end
#       end
#     end

#it desc do ... end:
# Define an expectation with name +desc+. Name gets morphed to a
# proper test method name. For some freakish reason, people who
# write specs don't like class inheritance, so this goes way out of
# its way to make sure that expectations aren't inherited.
#
# This is also aliased to #specify and doesn't require a +desc+ arg.
#
# Hint: If you _do_ want inheritance, use minitest/test. You can mix
# and match between assertions and expectations as much as you want.

#There are two ways that using spec prevent inheritence:
#when using describe, the class is created and then calls
#nuke_test_methods! which undefine all public test_* methods. So all
#test_methods obtained by inheritence are erased.
#
#secondly, when calling it desc do..., the method created is undefined in
#each children (a children is created with an inner describe). This allow
#to undefine tests even after children creation:
#describe Foo do
#  it "foo" ...
#  describe Bar do # here Foo#foo is removed from Bar by 'describe'
#    it "ploum" ...
#  end
#  it "bar" ... # here Foo#bar is removed from Bar by 'it'

# Other spec methods:
# def let name, &block
# ...
#       define_method name do
#        @_memoized ||= {}
#        @_memoized.fetch(name) { |k| @_memoized[k] = instance_eval(&block) }
#      end
##
# Essentially, define an accessor for +name+ with +block+.
#
# Why use let instead of def? I honestly don't know.

##
# Another lazy man's accessor generator. Made even more lazy by
# setting the name for you to +subject+.
# 
# def subject &block
#   let :subject, &block
# end
#Typically used to describe the subject of the test

#Example of usage
describe Meme do
	foo="foo"
  before do
    @meme = Meme.new
  end

  describe "when asked about cheeseburgers" do
    it "must respond positively" do
      @meme.i_can_has_cheezburger?.must_equal "OHAI!"
    end

    it "can use local variables" do
    	foo.must_equal "foo"
    end

  end

  describe "when asked about blending possibilities" do
  	#I don't know why most peoples use instance variable or let for things
  	#that works with local variable
  	#ok instance variables have a better scope (internal to the object),
  	#and let memoize
    it "won't say no" do
      @meme.will_it_blend?.wont_match /^no/i
    end
  end
end

#Since test spec are numeroted, the same 'it ploum' will describe different
#tests
describe "one" do
  describe "one" do
    it "it_one" do #this is one::one#test_0002_it_one

      assert_equal 0, 2
    end
    it "it_one" do #this is one::one#test_0002_it_one
      assert_equal 0, 1
    end
  end

  describe "two" do
    it "it_one" do
      assert_equal 0, 2
    end
    it "it_one" do
      assert_equal 0, 1
    end
  end
end

#Example of before
describe "Describe A" do
  before do
    puts "Before A"
  end

  describe "Describe A.1" do
    it "A.1.1" do
      0.wont_equal 0
    end
    it "A.1.2" do
      refute_equal 0, 0
    end
  end

  describe "A.2" do
    it "A.2.1" do
      0.must_equal 1
    end
    it "A.2.2" do
      assert_equal 0, 1
    end
  end

  it "A.3" do
    0.must_equal 1
  end
end

describe "Ploum" do
  it "ploum" do
    0.must_equal 1
  end
  it "ploum" do
    0.must_equal 0
  end
end
