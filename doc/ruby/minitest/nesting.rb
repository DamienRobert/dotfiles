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
