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
    @meme.stub :i_can_has_cheezburger?, nil, 0, 1 do
      @meme.i_can_has_cheezburger?(0) do |u,v|
        puts "u: #{u}, v: #{v}" #u: 0, v: 1
      end
    end
  end

  it "fails when stubbed method does not exist" do
    @meme.stub :this_does_not_exist, "no" do
      @meme.this_does_not_exist
    end
  end
end
