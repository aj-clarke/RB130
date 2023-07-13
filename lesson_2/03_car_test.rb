require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # test expected to fail
  def test_bad_wheels
    skip('This test is not ready yet')
    car = Car.new
    assert_equal(3, car.wheels)
  end
end