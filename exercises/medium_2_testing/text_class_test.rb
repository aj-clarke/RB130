require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'text_class'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
    # created second text file with a's changed to e's
    @text_file = Text.new(@file.read)
  end

  def test_swap_method
    @file_swapped = File.open('sample_text_swapped.txt', 'r')
    assert_equal @file_swapped.read, @text_file.swap('a', 'e')
  end

  def test_word_count
    assert_equal 72, @text_file.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
