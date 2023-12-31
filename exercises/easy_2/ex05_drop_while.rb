=begin
Question:
The Enumerable#drop_while method begins by iterating over the members of a
collection, passing each element to the associated block until it finds an
element for which the block returns false or nil. It then converts the remaining
elements of the collection (including the element that resulted in a falsey
return) to an Array, and returns the result.

Write a method called drop_while that behaves similarly for Arrays. It should
take an Array as an argument, and a block. It should return all the elements of
the Array, except those elements at the beginning of the Array that produce a
truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element,
drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.

Examples:

Copy Code
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []
-----------------------
Problem:

Rules:
  Explicit Requirements
  - Takes an array and a block as part of the method invocation
  - Return all elements of the array except those at the beginning that produced
    a truthy value whe passed to the block
  - Empty array, or array that returns `truthy` for all elements should return
    an empty array

  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure:
I: Array of args
W: New array based on block return value
O: New array

Algorithm/Modeling:
< given an array `arr` and a block as part of the method invocation >

Init `triggered` to `false`
Iterate each element of `arr` with an array object `result` and |ele|
  If `triggered` is equal to false
    result = `yield` with `ele`
    move to `next` iteration if `result` is `true`
    OTHERWISE
    reassign `triggered` to `true`
    push `ele` into `result`
  Else
    push `ele` into `result`

-----------------------
Code:
=end

def drop_while(arr)
  triggered = false
  arr.each_with_object(new_arr = []) do |ele|
    if triggered == false
      result = yield(ele)
      next if result
      triggered = true
      new_arr << ele
    else
      new_arr << ele
    end
  end
end

=begin

LS Solution was clean pasting as reference:

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end

  array[index..-1]
end

=end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []