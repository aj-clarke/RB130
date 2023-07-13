=begin
Question:
Zipper
The Array#zip method takes two arrays, and combines them into a single array in
which each element is a two-element array where the first element is a value
from one array, and the second element is a value from the second array, in
order. For example:

Copy Code
[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
Write your own version of zip that does the same type of operation. It should
take two Arrays as arguments, and return a new Array (the original Arrays should
  not be changed). Do not use the built-in Array#zip method. You may assume that
  both input arrays have the same number of elements.

Example:

Copy Code
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
-----------------------
Problem:

Rules:
  Explicit Requirements


  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure:
I:
W:
O:

Algorithm/Modeling:

-----------------------
Code:
=end

def zip(arr1, arr2)
  # new_arr = []
  # counter = 0
  # while counter < arr1.size
  #   new_arr << [arr1[counter], arr2[counter]]
  #   counter += 1
  # end
  # new_arr
  new_arr = []
  arr1.each_with_index do |ele, idx|
    new_arr << [ele, arr2[idx]]
  end
  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]