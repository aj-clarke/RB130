require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class IncludedObjectTest < MiniTest::Test
  def test_for_included_object
    arr = ['xyz', 'zyx']

    assert_includes arr, 'xyz'
  end

  def test_for_nonincluded_object
    arr = ['abc', 'zyx']

    assert_includes arr, 'xyz'
  end
end
