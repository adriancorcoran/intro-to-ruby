def divide(a, b)
  a / b
end

def tell_a_story
  (-1..5).reverse_each do |i|
    value = divide(120, i)
    puts "120 divided by #{i} is #{value}"
  end
  puts "X: Will this line be executed?"
end

tell_a_story
puts "Y: Will this line be executed?"
