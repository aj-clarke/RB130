# Enumerable Class Creation

# Assume we have a Tree class that implements a binary tree.

class Tree
  include Enumerable

  def each#(obj) # Example of use
    # idx = 0

    # while idx < obj.size
    #   yield(obj[idx])
    #   idx += 1
    # end
  end
end

# A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include the Enumerable module, which means they have access to an each method, as well as many other iterative methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.

# To provide most of the functionality of the Enumerable module, all you need to do is include Enumerable in your class, and define an each method that yields each member of the collection, one at a time.

# Note

# We define an `each` method because `each` is not defined within the Enumerable module