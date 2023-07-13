=begin
Question:
From-To-Step Sequence Generator
The Range#step method lets you iterate over a range of values where each value
in the iteration is the previous value plus a "step" value. It returns the
original range.

Write a method that does the same thing as Range#step, but does not operate on a
range. Instead, your method should take 3 arguments: the starting value, the
ending value, and the step value to be applied to each iteration. Your method
should also take a block to which it will yield (or call) successive iteration
values.

Example:


step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10

What do you think would be a good return value for this method, and why?
-----------------------
Problem:

Rules:
  Explicit Requirements
  - Take 3 args; start int, end int, and step int; and a block as part of method
    invocation

  Implicit Requirements

-----------------------
Examples:


-----------------------
Data Structure: (skip)
I:
W:
O:

Algorithm/Modeling:
< given 3 args; `start_val`, `stop_val`, `step`, and block as part of method invocation >

Init `check_val` = `start_val`

Use a while loop that stops when the `check_val` is less than `stop_val`
  `yield` with `check_val`
  Increment `check_val` by `step`



-----------------------
Code:
=end

def step(start_val, stop_val, step)
  check_val = start_val
  while check_val <= stop_val
    yield(check_val)
    check_val += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# => value = 1
# => value = 4
# => value = 7
# => value = 10