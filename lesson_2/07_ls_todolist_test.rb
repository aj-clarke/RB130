require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '07_ls_todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    result = @list.shift

    assert_equal(@todo1, result)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    result = @list.pop

    assert_equal(@todo3, result)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    # @list.mark_all_done
    # assert_equal(true, @list.done?)
    assert_equal(false, @list.done?)
  end

  def test_a_typeerror
    assert_raises(TypeError) do
      @list.add('string')
    end

    assert_raises(TypeError) { @list.add(18)}
  end

  def test_shovel
    new_todo = Todo.new('Test adding item')
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new('Test adding item')
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(100)}
  end
   
  def test_mark_done_at
    @list.mark_done_at(0)

    assert_raises(IndexError) { @list.mark_done_at(100) }
    # assert_equal(@todo1.done?, @list.item_at(0).done?)
    # instead test for `true`/`false`
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    @list.mark_all_done
    @list.mark_undone_at(0)

    assert_raises(IndexError) { @list.mark_done_at(100) }
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_exclamation
    @list.done!
    @list.each { |todo| assert_equal(true, todo.done?) }
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    @list.remove_at(0)

    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_when_one_todo_is_done
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_when_all_todos_are_done
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    OUTPUT

    # @list.mark_all_done
    # or
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each_iteration
    @list.each { |todo| assert_equal(false, todo.done?) }
  end

  def test_each_return_value
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    @list.mark_done_at(0)
    new_list = TodoList.new("Today's Todos")
    new_list << @todo2
    new_list << @todo3
    assert_equal(new_list.to_s, @list.select { |todo| !todo.done?}.to_s)
    assert_equal(new_list.title, @list.title)
  end
  
  def test_find_by_title
    # p @list.find_by_title('Buy milk')
    assert_equal(@todo1.title, @list.find_by_title('Buy milk').title )
  end

  def test_todo_item
    p @todo1.description
    assert_equal('Buy Milk', @todo1.description)
  end
end