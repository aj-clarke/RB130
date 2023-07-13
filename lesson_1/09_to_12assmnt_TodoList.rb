

# ------------------------------------------------------------------------------

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# todo1 = Todo.new('Complete TodoList Assignment')
# todo2 = Todo.new('Get kids to bed')

# puts todo1
# puts todo2

# todo2.done!
# todo2.done?

# puts todo1
# puts todo2

# ------------------------------------------------------------------------------

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(item)
    raise TypeError, 'Can only add Todo objects' unless item.instance_of? Todo

    todos << item
    item
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    todos.all? { |todo| todo.done }
  end

  def done!
    # todos.each { |todo| todo.done! }
    todos.each_index { |idx| mark_done_at(idx) }
  end

  def to_a
    # arr = []
    # todos.each { |todo| arr << todo }
    # arr
    todos.clone
  end

  def item_at(idx)
    # raise IndexError if idx >= todos.size

    # todos[idx] # fetch a better option to force `IndexError`
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    # raise IndexError if idx >= todos.size

    # todos[idx].done!
    item_at(idx).done!
  end

  def mark_undone_at(idx)
        # raise IndexError if idx >= todos.size

    # todos[idx].undone!
    item_at(idx).undone!
  end

  def remove_at(idx)
    # raise IndexError if idx >= todos.size

    # todos.delete_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    puts "---- #{title} ----"
    todos.each do |todo|
      puts todo
    end
    # LS SOLUTION
    # text = "--- #{title} ----\n"
    # text << @todos.map(&:to_s).join("\n")
    # text
  end

  def each
    # manual way
    # counter = 0
    # while counter < todos.size
    #   yield(item_at(counter))
    #   counter += 1
    # end

    # or

    todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    # works!
    # todos.select do |todo|
    #   yield(todo)
    # end
    # or LS WAY
    temp_list = TodoList.new("#{title}")
    each do |todo|
      temp_list.add(todo) if yield(todo)
      # or
      # temp_list.todos << todo if yield(todo)
    end
    temp_list
  end

  def find_by_title(str)
    str = str.downcase
    each do |todo|
      down_title = todo.title.downcase
      return todo if str == down_title
    end
    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    title = title.downcase
    each do |todo|
      down_title = todo.title.downcase
      todo.done! if title == down_title
    end
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  protected

  attr_accessor :todos
end


# given
todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new('Go to gym')
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                   # raises TypeError with message "Can only add Todo objects"
# p list.todos                  # Validated working, then removed `attr_reader :todos`

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# p list.size                     # returns 3

# # first
# p list.first                    # returns todo1, which is the first item in the list

# # last
# p list.last                     # returns todo3, which is the last item in the list

# # to_a
# p list.to_a                     # returns an array of all items in the list

# # done?
# p list.done?                    # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# # item_at
# # list.item_at                  # raises ArgumentError
# p list.item_at(1)               # returns 2nd item in list (zero based index)
# p list.item_at(100)           # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(0)              # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# p list.shift                      # removes and returns the first item in list

# # pop
# p list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# list.each do |todo|
#   puts todo
# end

# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect

# p list.find_by_title('Buy milk')

# p list.mark_done('Clean roOm')

p list.mark_all_done

p list.mark_all_undone

p list.object_id

p list.all_done

p list.all_not_done