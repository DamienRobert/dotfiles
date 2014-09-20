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
      x+y
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

