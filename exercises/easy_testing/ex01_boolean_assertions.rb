=begin
Boolean Assertions
Write a minitest assertion that will fail if the value.odd? is not true.

Change `false` on line 36 to `true` to fulfill above requirement.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Numberz
  attr_accessor :num

  def initialize(num)
    @num = num
  end
end

# two = Numberz.new(2)
# p two.num

class NumberzTest < MiniTest::Test
  def setup
    @one = Numberz.new(1)
    @two = Numberz.new(2)
  end

  def test_if_even
    assert_equal(false, @one.num.even?)
    assert_equal(true, @two.num.even?)
  end

  def test_if_odd
    assert_equal(true, @one.num.odd?)
    assert_equal(false, @two.num.odd?) # change to `true` for failure requirement
  end
end