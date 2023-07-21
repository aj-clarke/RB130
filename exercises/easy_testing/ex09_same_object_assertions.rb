require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class List
  def process
    self
  end
end

class ListTest < MiniTest::Test
  def test_same_object
    list = List.new

    assert_same list, list.process
  end
end