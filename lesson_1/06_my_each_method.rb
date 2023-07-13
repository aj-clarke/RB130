# my `each` implementation prior to looking at LS implementation

def each(arr)
  counter = 0
  until counter == arr.size
    yield(arr[counter])
    counter += 1
  end
  arr
end

arr = [1, 2, 3, 4, 5]

each(arr) do |ele|
  puts ele
end

# ------------------------------------------------------------------------------
# LS Implementation

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end