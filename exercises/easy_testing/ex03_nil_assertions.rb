require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NilTest < MiniTest::Test
  def test_nil
    # is_not_nil = 'not nil'   # Uncomment to test
    is_nil = nil

    # assert_nil is_not_nil    # Fails as expected when uncommented
    assert_nil is_nil
  end
end
