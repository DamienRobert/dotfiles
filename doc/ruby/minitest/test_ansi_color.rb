  class Meme
    def i_can_has_cheezburger?
      "OHAI!"
    end

    def will_it_blend?
      "YES!"
    end
  end

  require "minitest/autorun"
  require "minitest/ansi"
  MiniTest::ANSI.use!

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

