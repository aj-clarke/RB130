def testing2(block)
  puts 'hello'
  block.call        # calls the block that was originally passed to test()
  puts 'good-bye'
end

def testing(&block)
  puts '1'
  testing2(block)
  puts '2'
end

testing { |prefix| puts 'xyz' } # tested without |prefix| and it functioned the same

# 1
# hello
# xyz
# good-bye
# 2

puts
# ------------------------------------------------------------------------------
puts

def display(block)
  block.call('>>>') # Passing the prefix argument to the block
end

def test(&block)
  puts '1'
  display(block)
  puts '2'
end

test { |prefix| puts prefix + 'xyz' }
# => 1
# => >>>xyz
# => 2
