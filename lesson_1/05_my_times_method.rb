# my implementation prior to looking at LS solution (pasted below mine)
def times(int)
  start = 0
  loop do
    break if start == int
    yield(start)
    start += 1
  end
  int # returns the original argument just like the Integer#times method
end

times(5) do |int|
  puts int
end

# ------------------------------------------------------------------------------
# LS Solution

# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number  # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5