def for_each_in(arr)
  arr.each { |element| yield element }
end

arr = [1, 2, 3, 4, 5]
results = [0] # manual stepping through [0, 1, 3, 6, 10, 15]

for_each_in(arr) do |number|
  total = results[-1] + number
  results.push(total)
end

p results # => [0, 1, 3, 6, 10, 15]

# Though the block passed to for_each_in is invoked from inside for_each_in, the
# block still has access to the results array through closure.