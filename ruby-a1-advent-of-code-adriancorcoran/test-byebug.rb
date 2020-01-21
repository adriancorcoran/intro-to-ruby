# require 'byebug'


# Ruby requires not install its included. You must specify
# Require byebug

# ### Ruby Scripts 	- `gem install byebug`  	- `require 'byebug'` in your script

# For vanilla ruby you'd need to run `gem install byebug`

# Also check the resources section of our modules, there may be something there


#
# The n'th triangle number: triangle(n) = n*(n+1)/2 = 1 + 2 + ... + n
#


# byebug

def triangle(n)
  tri = 0

  0.upto(n) do |i|
    tri += i
  end
  tri
end

t = triangle(3)
puts t

# ********************************************************************************

#
# Solves the classic Towers of Hanoi puzzle.
#

# def hanoi(n, a, b, c)
#   hanoi(n - 1, a, c, b) if n - 1 > 0
#
#   puts "Move disk #{a} to #{b}"
#
#   hanoi(n - 1, c, b, a) if n - 1 > 0
# end
#
# byebug
#
# n_args = $ARGV.length
#
# raise("*** Need number of disks or no parameter") if n_args > 1
#
# n = 3
#
# if n_args > 0
#   begin
#     n = $ARGV[0].to_i
#   rescue ValueError
#     raise("*** Expecting an integer, got: #{$ARGV[0]}")
#   end
# end
#
# raise("*** Number of disks should be between 1 and 100") if n < 1 || n > 100
#
# hanoi(n, :a, :b, :c)
