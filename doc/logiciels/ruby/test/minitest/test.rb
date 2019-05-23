class Meme
  def i_can_has_cheezburger?
    "OHAI!"
  end

  def will_it_blend?
    "YES!"
  end
end

require "minitest/autorun"
#Assertions: http://docs.seattlerb.org/minitest/Minitest/Assertions.html

class TestMeme < Minitest::Test
	#called before each test
	#use teardown to setup something after each test
  def setup
    @meme = Meme.new
  end

  def test_that_kitty_can_eat
    assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  end

  def test_that_it_will_not_blend
    refute_match /^no/i, @meme.will_it_blend?
  end

  def test_that_error
    assert_equal "OHAI!!!", @meme.i_can_has_cheezburger?
  end

  def test_that_exception
    1/0
  end

  def test_that_will_be_skipped
    skip "test this later"
  end
end

class TestOne < Minitest::Test

  def test_one
    assert_equal 0, 0
  end

  def test_one #the second test is taken
    assert_equal 0, 1
  end

end

class TestTwo < TestOne
  def test_two
    assert_equal 0, 1
  end

  def test_two #the second test is taken
    assert_equal 0, 0
  end

  #also run test_one from TestOne
end
