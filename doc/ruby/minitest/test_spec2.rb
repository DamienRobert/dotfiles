require "minitest/autorun"

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
