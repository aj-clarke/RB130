# # simple `increment` method
# def increment(number)
#   number + 1
# end

# # method invocation
# increment(5) # => 6

# #-------------------------------------------------------------------------------

# # `increment` with `yield` functionality

# # method implementation
# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# # method invocation
# increment(5) do |num|
#   puts num
# end
# # Outputs 6
# # Returns 6
# # Check notion notes for execution sequence

# #-------------------------------------------------------------------------------

# # Test for incorrect num of arguments passed with a `yield(arg, arg)` scenario

# # method implementation
# def test
#   yield(1, 2) # passing 2 block arguments at block invocation time
# end

# # method invocation
# test { |num| puts num } # expecting 1 parameter in block implementation
# # Outputs 1, second block arg is ignored

# #-------------------------------------------------------------------------------

# What if we pass in 1 less block arg instead of 1 more?

# method implementation
def test
  yield(1)    # passing 1 block arg at block invocation time
end

# method invocation
test do |num1, num2| # expecting 2 parameters in block implementation
  puts "#{num1} #{num2}"
end
# Outputs 1  (extra space after the 1)