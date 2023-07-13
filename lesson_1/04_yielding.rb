# def echo(str)
#   p str
# end

# # echo                  # ArgumentError: wrong num of arguments (0 for 1)
# echo('hello!')          # => 'hello!'
# # echo('hello', 'world')  # ArgumentError: wrong num of arguments (0 for 2)

# # this time, called with an implicit block

# # echo { puts 'world' }   # ArgumentError: wrong num of arguments (0 for 1)
# echo('hello!') { puts 'world' } # => 'hello!'
# echo('hello', 'world') { puts 'world' } # ArgumentError: wrong num of arguments (0 for 2)

#-------------------------------------------------------------------------------

# def echo_with_yield(str)
#   yield
#   p str
# end

# echo_with_yield { puts 'world' }  # ArgumentError: wrong num of arguments (0 for 1)
# echo_with_yield('hello!') { puts 'world' }  # world
#                                             # => 'hello!'
# echo_with_yield('hello', 'world') { puts 'world' } # ArgumentError: wrong num of arguments (2 for 1)

# EDGE CASE WITH YIELD
# echo_with_yield('hello!') # LocalJumpError: no block given (yield)
#-------------------------------------------------------------------------------

# Correct EDGE case above by only yielding if a block is actually passed in
# def echo_with_yield(str)
#   yield if block_given?
#   str
# end