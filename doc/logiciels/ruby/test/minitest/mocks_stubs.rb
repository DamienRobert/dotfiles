# mocks
class MemeAsker
  def initialize(meme)
    @meme = meme
  end

  def ask(question)
    method = question.tr(" ","_") + "?"
    @meme.__send__(method)
  end
end

require "minitest/autorun"

## Mock#expect: def expect(name, retval, args = [], &blk)

# Expect that method +name+ is called, optionally with +args+ or a
# +blk+, and returns +retval+.
#
#   @mock.expect(:meaning_of_life, 42)
#   @mock.meaning_of_life # => 42
#
#   @mock.expect(:do_something_with, true, [some_obj, true])
#   @mock.do_something_with(some_obj, true) # => true
#
#   @mock.expect(:do_something_else, true) do |a1, a2|
#     a1 == "buggs" && a2 == :bunny
#   end
#   #=> If a block is passed, the arguments are ignored, and the mock raises
#   #a MockFailure if the block returns false
#
# +args+ is compared to the expected args using case equality (ie, the
# '===' operator), allowing for less specific expectations.
#
#   @mock.expect(:uses_any_string, true, [String])
#   @mock.uses_any_string("foo") # => true
#   @mock.verify  # => true
#
#   @mock.expect(:uses_one_string, true, ["foo"])
#   @mock.uses_one_string("bar") # => true
#   @mock.verify  # => raises MockExpectationError

describe MemeAsker do
  before do
    @meme = Minitest::Mock.new
    @meme_asker = MemeAsker.new @meme
  end

  describe "#ask" do
    describe "when passed an unpunctuated question" do
      it "should invoke the appropriate predicate method on the meme" do
        @meme.expect :will_it_blend?, :return_value
        @meme_asker.ask "will it blend"
        @meme.verify
      end
    end
  end
end

describe "Test mocks" do
  before do
    @meme = Minitest::Mock.new
  end

  it "Return retval" do
    @meme.expect(:ploum,:plam)
    @meme.ploum.must_equal :plam
    @meme.verify
  end

  it "Fails when method not called" do
    @meme.expect(:ploum,:plam)
    @meme.verify #error
  end

  it "Can't be called several times" do
    @meme.expect(:ploum,:plam)
    @meme.ploum
    @meme.ploum #error
    @meme.verify
  end

  it "Can't be called several times except if specified several times" do
    @meme.expect(:ploum,:plam)
    @meme.expect(:ploum,:plam)
    @meme.ploum
    @meme.ploum
    @meme.verify
  end

  it "Can specify arguments" do
    @meme.expect(:ploum,:plam, [0,1])
    @meme.expect(:ploum,:plam, [String])
    @meme.ploum(0,1)
    @meme.ploum("ahah")
    @meme.verify
  end

  it "Arguments are compared with ===" do
    @meme.expect(:ploum,:plam, [0,1])
    @meme.ploum(0,2) #error
  end

  it "Can use a block (args are then ignored)" do
    @meme.expect(:ploum,:plam) do |x,y|
      x+y #raise a failure if the block returns false
    end
    @meme.ploum(1,2).must_equal :plam #the return value is still plam!
    @meme.verify
  end

  it "With a block has to be called with the right number of args" do
    @meme.expect(:ploum,:plam) do |x,y|
      x+y
    end
    @meme.ploum(1).must_equal :plam #error
    @meme.verify
  end
end

# stubs: def stub name, val_or_callable, *block_args
##
# Add a temporary stubbed method replacing +name+ for the duration
# of the +block+. If +val_or_callable+ responds to #call, then it
# returns the result of calling it, otherwise returns the value
# as-is. If stubbed method yields a block, +block_args+ will be
# passed along. Cleans up the stub at the end of the +block+. The
# method +name+ must exist before stubbing.
#
#     def test_stale_eh
#       obj_under_test = Something.new
#       refute obj_under_test.stale?
#
#       Time.stub :now, Time.at(0) do
#         assert obj_under_test.stale?
#       end
#     end

class Meme
  def i_can_has_cheezburger?
    "OHAI!"
  end

  def will_it_blend?
    "YES!"
  end
end

require "minitest/autorun"

describe Meme do
  before do
    @meme = Meme.new
  end

  describe "when asked about cheeseburgers" do
    it "must respond positively" do
      @meme.stub :i_can_has_cheezburger?, "Miaow" do   # stub goes away once the block is done
        @meme.i_can_has_cheezburger?.must_equal "Miaow"
      end
      @meme.i_can_has_cheezburger?.must_equal "OHAI!"
    end
  end

  it "won't say no" do
    @meme.will_it_blend?.wont_match /^no/i
  end

  it "will be stubbed and fail" do
    @meme.stub :will_it_blend?, "no" do
      @meme.will_it_blend?.wont_match /^no/i
    end
  end

  it "can call a lambda" do
    ploum=lambda do |x|
      puts "ploum called with #{x}"
    end
    @meme.stub :i_can_has_cheezburger?, ploum do
      @meme.i_can_has_cheezburger?(0) #ploum called with 0
    end
  end

  it "will yield a block" do
  	#nil: return value, 0, 1 block args
    @meme.stub :i_can_has_cheezburger?, nil, 0, 1 do
      @meme.i_can_has_cheezburger?(3) do |u,v|
        puts "u: #{u}, v: #{v}" #u: 0, v: 1
      end #return nil here
    end
  end

  it "fails when stubbed method does not exist" do
    @meme.stub :this_does_not_exist, "no" do
      @meme.this_does_not_exist
    end
  end
end
