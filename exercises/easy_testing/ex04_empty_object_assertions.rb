require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EmptyArrTest < MiniTest::Test
  def test_empty_array
    arr = []

    assert_empty arr
  end

  def test_nonempty_array
    arr = [1, 2, 3]

    assert_empty arr  # Expecting failure (tested successfully)
  end
end
