require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EqualityTest < MiniTest::Test
  def test_downcase
    text = 'XYZ'
    assert_equal 'xyz', text.downcase
  end
end