=begin
Question:
Iterators: True for One?
In the previous 3 exercises, you developed methods called any?, all?, and none?
that are similar to the standard Enumerable methods of the same names. In this
exercise, you will develop one last method from this family, one?.

Enumerable#one? processes elements in a collection by passing each element value
to a block that is provided in the method call. If the block returns a truthy
value for exactly one element, then #one? returns true. Otherwise, #one? returns
false. Note in particular that #one? will stop searching the collection the
second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an
Array as an argument, and a block. It should return true if the block returns
true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block
returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is
defined.

Your method may not use any standard ruby method that is named all?, any?,
none?, or one?.

Examples:

-----------------------
Problem:

Rules:
  Explicit Requirements
  - Take an array as arg; block as part of method invocation
  - Return `true` if ONLY 1 block return value is `true`
  - Return `false` if more than 1 returns `true` or if array is empty

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

Return `false` if `arr` is empty
Init `status` to `nil`
Iterate `arr` with |ele|
  return `false` if `status` is `true`
  init `result` to `yield` with `ele`
  reassign `status` to `true` if `result` is `true`

implicit return of `status`
-----------------------
Code:
=end

def one?(arr)
  # return false if arr.empty?

  status = nil
  arr.each do |ele|
    result = yield(ele)
    if result
      return false if status# == true
      status = true
    end
  end
  status == nil ? false : true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false