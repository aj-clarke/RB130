=begin
Question:
Iterators: True for None?
Enumerable#none? processes elements in a collection by passing each element
value to a block that is provided in the method call. If the block returns true
for any element, then #none? returns false. Otherwise, #none? returns true. Note
in particular that #none? will stop searching the collection the first time the
block returns true.

Write a method called none? that behaves similarly for Arrays. It should take an
Array as an argument, and a block. It should return true if the block returns
false for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block
returns true.

If the Array is empty, none? should return true, regardless of how the block is
defined.

Your method may not use any of the following methods from the Array and
Enumerable classes: all?, any?, none?, one?. You may, however, use either of the
methods created in the previous two exercises.

Examples:

-----------------------
Problem:

Rules:
  Explicit Requirements
  - Take an array as an arg; and block as part of method invocation
  - Return `true` if block returns `false` for ALL elements
  - Return `false` the first time a block returns `true`
  - Return `true` if the array is empty

  Implicit Requirements

-----------------------
Examples:
Skipping

-----------------------
Data Structure: (Skipping)
I: 
W:
O:

Algorithm/Modeling:
< given an array `arr` and a block as part of the method invocation >

# Explicit `true` if array is empty
Iterate `arr` |ele|
  return `false` if a block returns `true`

implicit `true`
-----------------------
Code:
=end

def none?(arr)
  # return true if arr.empty?
  arr.each do |ele|
    return false if yield(ele)
  end
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true