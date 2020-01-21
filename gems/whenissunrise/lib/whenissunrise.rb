# created by Adrian Corcoran - 12/08/2018
# retrieves the sunrise and sunset times using latitude and longitude
# service provided by https://sunrise-sunset.org/api

require 'httparty'
require 'json'

class Whenissunrise

  def self.sunrise
    puts "-----"
    puts "Time to find out your sunrise!"
    puts "-----"
    puts "You will need a latitude and longitude, which you can get by going to https://maps.google.com and selecting 'What's here?' after right-clicking on the map. If you're really lazy you can use 45.249814 and -75.7700702 for Ottawa or 53.2839064 and -9.0837658 for Galway :)"
    puts "-----"

    # get data from user
    puts "Enter your latitude"
    lat = gets.chomp
    puts "Enter your longitude"
    long = gets.chomp

    puts "getting data..."

    url = "https://api.sunrise-sunset.org"
    date = "today"

    # do the api call
    data = HTTParty.get("#{url}/json?lat=#{lat}&lng=#{long}&date=#{date}")

    # format the data
    dataHash = JSON[data.body]['results']
    sunrise = dataHash['sunrise']
    sunset = dataHash['sunset']

    # display the data
    puts "Sunrise is at #{sunrise}"
    puts "Sunset is at #{sunset}"

    puts "-----"
    puts "Thank you to https://sunrise-sunset.org for providing the data :)"
  end

end
