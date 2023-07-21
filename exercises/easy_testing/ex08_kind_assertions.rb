require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NotNumericOrSubclassTest < MiniTest::Test
  def test_is_class_or_subclass
    int = 1
    float = 1.0
    num = Numeric.new

    assert_kind_of Numeric, int
    assert_kind_of Numeric, float
    assert_kind_of Numeric, num
  end

  def test_is_not_class_or_subclass
    str = 'I am a string, not a Numeric (or one of its subclasses) object(s)'

    assert_kind_of Numeric, str
  end
end