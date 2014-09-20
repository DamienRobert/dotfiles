require "minitest/autorun"

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
