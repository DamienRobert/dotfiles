require "minitest/autorun"
class Thingy
  attr_accessor :a,:b
end

class TestThingy < Minitest::Test
  def setup
    super
    ploum=Thingy.new
    ploum.a="this is ploum"
    puts ploum.a
  end

  def teardown
    puts "First teardown"
  end

  def test_first_thing
    puts "first test"
    assert_equal 1, 1
  end
end

class TestSubThingy < TestThingy
  def setup
    ploum=Thingy.new
    ploum.b="this is plam"
    puts ploum.b
    super
  end
  def teardown
    puts "Inner teardown"
    super
  end

  def test_second_thing
    puts "second test"
    assert_equal 2, 2
  end
  #test_first_thing will also be called here
end

ploum=Thingy.new

#ploum is available in the scope here
describe Thingy do
  before do
    ploum.a="this is ploum"
    puts ploum.a
  end

  after do
    puts "outer after"
  end

  it "should do the first thing" do
    puts "first test"
    1.must_equal 1
  end

  describe Thingy do
    before do
    	#called before 'this is ploum'
      ploum.b="this is plam"
      puts ploum.b
    end

    after do
    	#called before 'outer after'
      puts "inner after"
    end

    it "should do the second thing" do
    puts "second test"
      2.must_equal 2
    end
  end
  #first thing is not called here
end
