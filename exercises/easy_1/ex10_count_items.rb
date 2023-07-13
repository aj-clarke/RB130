=begin
Question:
Count Items
Write a method that takes an array as an argument, and a block that returns true
or false depending on the value of the array element passed to it. The method
should return a count of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

-----------------------
Problem:

Rules:
  Explicit Requirements
  - Takes an array as an arg, and a block as part of the method invocation
  - Block returns `true` or `false` depending on the value of the arr element
    passed into it
  - Method returns a count of times the block returns `true`

  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure: (skip)
I:
W:
O:

Algorithm/Modeling:
< given an array `arr` and a block as part of method invocation >

Init `count` to 0
Iterate `arr` with |ele|
  Increment `count` if `yield` with `ele` arg returns `true`

Implicit return of `count`

-----------------------
Code:
=end

def count(arr)
  # arr.select do |ele|
  #   yield(ele)
  # end.size

  count = 0
  arr.each do |ele|
    count += 1 if yield(ele)
  end
  count

end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2