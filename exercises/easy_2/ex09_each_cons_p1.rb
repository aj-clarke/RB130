=begin
Question:
each_cons (Part 1)
The Enumerable#each_cons method iterates over the members of a collection taking
each sequence of n consecutive elements at a time and passing them to the
associated block for processing. It then returns a value of nil.

Write a method called each_cons that behaves similarly for Arrays, taking the
elements 2 at a time. The method should take an Array as an argument, and a
block. It should yield each consecutive pair of elements to the block, and
return nil.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.

-----------------------
Problem:

Rules:
  Explicit Requirements
  - Takes an array as an arg; block as part of method invocation
  - Two elements (consecutively) are arguments during each yield to the block
    ex: arr = [1,2,3,4] then args are passed as follows:
      1,2 > 2,3 > 3,4
  - `each_cons` returns `nil`

  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure:
I:
W:
O:

Algorithm/Modeling:
< given an array `arr` and a block as part of the method invocation >

Explicitly return `nil` if `arr` is empty
Init `counter` to 0

While loop that continues while `counter` is less than `arr`s length
  Init `arg1` to `counter`
  Increment `counter` by 1
  Init `arg2` to `counter`
  yield(arg1, arg2)

Implicit return of nil 
-----------------------
Code:
=end

def each_cons(arr)
  return nil if arr.empty?

  counter = 0
  while counter < arr.length - 1
    arg1 = arr[counter]
    counter += 1
    arg2 = arr[counter]
    yield(arg1, arg2)
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil