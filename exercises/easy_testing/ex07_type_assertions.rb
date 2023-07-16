require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NumericTest < MiniTest::Test
  def test_instance_of
    value = Numeric.new
    assert_instance_of Numeric, value
  end
end
