require "minitest/autorun"

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

  def test_two
    assert_equal 0, 0
  end
end
