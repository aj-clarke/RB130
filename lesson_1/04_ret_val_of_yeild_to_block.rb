=begin

compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

=end

# # method implementation
# def compare(str)
#   puts "Before: #{str}"
#   # after = yield(str) <- Redundant code
#   puts "After: #{yield(str)}"
# end

# # method invocation
# compare('hello') do |word|
#   word.upcase
# end

#-------------------------------------------------------------------------------

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare('hello') { |word| puts 'hi' }