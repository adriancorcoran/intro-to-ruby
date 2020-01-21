class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(bicycles, customers, vehicle)
    @bicycles = bicycles
    @customers = customers
    @vehicle = vehicle
  end

  def prepare(preparers)
    puts "Lets get ready..."
    preparers.each do |preparer|
      preparer.prepare_for_trip(self)
    end
    puts "Good to go..."
  end
end

class Mechanic
  def prepare_for_trip(trip)
    prepare_bicycles(trip.bicycles)
  end

  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    puts "Preparing bicycles..."
  end
end

class TripCoordinator
  def prepare_for_trip(trip)
    puts "Buying Food..."
  end

  def buy_food(customers)
    # ...
  end
end

class Driver
  def prepare_for_trip(trip)
    puts "Gassing up..."
    puts "Filling the tank..."
  end

  def gas_up(vehicle)
    #...
  end

  def fill_water_tank(vehicle)
    #...
  end
end

Alicante = Trip.new(["bike 1", "bike 2"], "customers", "vehicle")
Alicante.prepare([Mechanic.new, TripCoordinator.new, Driver.new])



# def test_block
#   p "Start Now"
#   name    = "Adrian"
#   yield(name)
#   p "End Now"
# end
#
# test_block do |item|
#   p "Here in the middle with #{item}"
# end
#

# from Tim Anema
# def join(arr, joiner)
#   arr.reduce() do |final, array_value|
#     "#{final}#{joiner.to_s}#{array_value.to_s}"
#   end
# end
#
# puts join([1, 2, 3], ", ")


# from me
# def myJoin(arr, joiner)
#   arr.reduce { |first, second| first.to_s + joiner + second.to_s }.to_s
# end
# myArray = [1, 2, 3]
# result = myJoin(myArray, ", ")
# p result

# l = lambda do |string|
#   if string == "try"
#     return "There's no such thing"
#   else
#     return "Do or do not."
#   end
# end
# puts l.call("try") # Feel free to experiment with this



# arr = ['cat', 'dog', 'pony', 'bird']
# arr.each_with_index do |str, idx|
#     puts "#{str} and #{arr[idx-1]} show"
# end
#
# puts arr[5]





# str="Adrian"
#
# count = 0
# str.split('').each do |item|
#   item.downcase!
#   puts item.downcase
#   count += 1  if (item == "a" || item == "e" || item == "i" || item == "o" || item == "u")
# end
# puts count


# def non_duplicated_values(values)
#   return_array = []
#   values.uniq.each do |elem|
#     return_array << elem if values.count(elem) == 1
#   end
#   return return_array
# end


# for num in 1..100
#   if (num % 3 == 0) && (num % 5 == 0)
#     puts "FizzBuzz"
#   elsif num % 3 == 0
#     puts "Fizz"
#   elsif num % 5 == 0
#     puts "Buzz"
#   else
#     puts num
#   end
# end
#
# for i in 1..100
#    str = ''
#    str += 'Fizz' if i%3==0
#    str += 'Buzz' if i%5==0
#    puts (str == '' ? i : str)
# end


# def last_digit(int)
#   str = int.to_s
#   # str[2..3]
#   "adrian"[-1]
# end
#
# puts last_digit(10056)

# require 'open-uri'
#
# def just_fetch_page(url)
#   return open(url).read
# end
#
# def just_count_tags(page, tag)
#    pattern = /<#{tag}\b/
#    tags = page.scan(pattern)
#    return tags.length
# end
#
# sites = [ "https://www.shopify.com", "https://www.wsj.com", "https://www.nytimes.com", "https://www.ft.com" ]
# tags = ["div","h1","h2","h3","img","p"]
#
# sites.each do |url|
#    puts "#{url} has:"
#    tags.each do |tag|
#       page = just_fetch_page(url)
#       tag_count = just_count_tags(page, tag)
#       puts "\t - #{tag_count} <#{tag}> tags"
#    end
# end


# require "open-uri"
# def count_any_tags(url, tag)
#    pattern = /<#{tag}\b/
#    page = open(url).read
#    tags = page.scan(pattern)
#    puts "The site #{url} has #{tags.length} #{tag} tags"
# end
#
#
# url = "https://www.shopify.com"
# tags = ["a", "div", "img"]
# tags.each do |tag|
#    count_any_tags(url, tag)
# end
#


# def triple_adder(one, two, three)
#   result = "#{one.to_s + two.to_s + three.to_s}".upcase + "!"
#   result
# end
#
# puts triple_adder(8, 9, 10)
