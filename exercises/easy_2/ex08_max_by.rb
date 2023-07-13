=begin
Question:
max_by
The Enumerable#max_by method iterates over the members of a collection, passing
each element to the associated block. It then returns the element for which the
block returned as the largest value.

Write a method called max_by that behaves similarly for Arrays. It should take
an Array and a block, and return the element that contains the largest value.

If the Array is empty, max_by should return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.

-----------------------
Problem:

Rules:
  Explicit Requirements
  - Take an array and block by method invocation
  - Return element that has largest value
  - Empty array returns `nil`

  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure: (skipping)
I:
W:
O:

Algorithm/Modeling:
< given an array `arr` and a block via method invocation >

Explicit return of `nil` if `arr` is empty
Init `largest_val` to `nil`
Init `first_pass` to `true`

Iterate each element of `arr` |ele|
  `largest_val` and `first_pass` = `ele`, true
  result = yield(ele)
  `largest_val` = result if result > `largest_val`

Implicitly return `largest_val`

-----------------------
Code:
=end

def max_by(arr)
  return nil if arr.empty?
  
  ele_to_return = arr[0]
  highest_return_val = nil

  arr.each do |ele|
    return_val = yield(ele)
    highest_return_val = return_val if highest_return_val == nil
    if return_val > highest_return_val
      highest_return_val = return_val
      ele_to_return = ele
    end
  end

  ele_to_return
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil