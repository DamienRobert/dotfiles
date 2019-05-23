require "minitest/autorun"
require "minitest/benchmark" #if ENV["BENCH"]

class TestMeme < Minitest::Benchmark
  def fib n
    a, b = 0, 1
    n.times do
      a, b = b, a + b
    end
    a
  end
  def bench_algorithm
    assert_performance_constant 0.9999 do |n|
      100.times do
        n+n
      end
    end
  end

  def bench_algorithm_linear
    assert_performance_constant 0.9999 do |n|
      1000.times do
        fib n
      end
    end
  end
end

describe "Meme Benchmark" do
  bench_performance_linear "my_algorithm", 0.9999 do |n|
    n.times do
      100.times do
        n+n
      end
    end
  end

  #this pass althought it should really not...
  bench_performance_constant "my_algorithm two", 0.9999 do |n|
    n.times do
      1000.times do
        n+n
      end
    end
  end
end
