# simple test

def test(&block)
  puts "What's a block? #{block}"
end

test { 'hey' }