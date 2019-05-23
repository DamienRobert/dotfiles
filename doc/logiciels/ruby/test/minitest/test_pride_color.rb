class Meme
  def i_can_has_cheezburger?
    "OHAI!"
  end

  def will_it_blend?
    "YES!"
  end
end

require "minitest/autorun"
require "minitest/pride"
#choose PrideLOL rather than PrideIO for the output if ENV["TERM"] =~ /^xterm|-256color$/
#pride can also be called in a normal minitest via
#ruby  test.rb -p

class TestMeme < Minitest::Test
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
