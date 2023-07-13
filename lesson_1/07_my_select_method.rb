=begin
Write a select method that mirrors the behavior of Array#select. Note that the
Array#select method takes a block, then yields each element to the block. If the
block evaluates to true, the current element will be included in the returned
array. If the block evaluates to false, the current element will not be included
in the returned array.
=end

# my `#select` implementation prior to looking at LS implementation
def select(arr)
  counter = 0
  new_arr = []
  until counter == arr.size
    new_arr << arr[counter] if yield(arr[counter])# == true (this breaks the implementation)
    counter += 1
  end
  new_arr
end

arr = [1, 2, 3, 4, 5]

p select(arr) { |num| num.odd? }      # => [1, 3, 5]
p select(arr) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(arr) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# ------------------------------------------------------------------------------
# LS implementation

def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end