=begin
In this assignment, let's implement a reduce method, similar to
Enumerable#reduce. Your reduce should take at least 1 argument that represents
the array we'll operate on. It should also take an optional second argument that
represents the default value for the accumulator. Here's a few examples that we
should be able to call on your method.

=end

def reduce(arr, memo = 0)
  counter = 0
  while counter < arr.size
    memo = yield(memo, arr[counter])
    counter += 1
  end
  memo
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# Further Exploration for the `reduce` implementation per the material

def reduce(arr, memo = arr[0])
  counter = 1
  while counter < arr.size
    memo = yield(memo, arr[counter])
    counter += 1
  end
  memo
end

reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

# ------------------------------------------------------------------------------
# LS implementation (compared to my first implementation)

def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end