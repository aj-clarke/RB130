require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class RefutationsTest < MiniTest::Test
  def test_refutation_fail
    arr = %w[abc xyz]

    refute_includes arr, 'xyz'
  end

  def test_refutation_pass
    arr = %w[abc zyx]

    refute_includes arr, 'xyz'
  end
end