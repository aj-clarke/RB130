# Passing Parameters Part 3
# Given this code:


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

# 1)
gather(items) do | *obj1, obj2 |
  puts obj1.join(', ')
  puts obj2
end

# => Let's start gathering food.
# => apples, corn, cabbage
# => wheat
# => We've finished gathering!

# 2)
gather(items) do | obj1, *obj2, obj3 |
  puts obj1
  puts obj2.join(', ')
  puts obj3
end

# => Let's start gathering food.
# => apples
# => corn, cabbage
# => wheat
# => We've finished gathering!

# 3)
gather(items) do | obj1, *obj2 |
  puts obj1
  puts obj2.join(', ')
end

# => Let's start gathering food.
# => apples
# => corn, cabbage, wheat
# => We've finished gathering!

# 4)
gather(items) do | obj1, obj2, obj3, obj4 |
  puts "#{obj1}, #{obj2}, #{obj3}, and #{obj4}"
end

# => Let's start gathering food.
# => apples, corn, cabbage, and wheat
# => We've finished gathering!
