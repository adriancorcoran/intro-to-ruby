# this file was used for testing before creating the gem

require './lib/whenissunrise'
Whenissunrise.sunrise

# ---------------------------------------------
# require 'httparty'
# require 'json'
#
# puts "-----"
# puts "Time to find out your sunrise!"
# puts "-----"
# puts "You will need a latitude and longitude, which you can get by going to https://maps.google.com and selecting 'What's here?' after right-clicking on the map. If you're really lazy you can use 45.249814 and -75.7700702 for Ottawa :)"
# puts "-----"
# puts "Enter your latitude"
# lat = gets.chomp
# puts "Enter your longitude"
# long = gets.chomp
#
# # 53.918407
# # -9.2398847
# puts "getting data..."
#
# # service provided by https://sunrise-sunset.org/api
# url = "https://api.sunrise-sunset.org"
# date = "today"
# data = HTTParty.get("#{url}/json?lat=#{lat}&lng=#{long}&date=#{date}")
#
# dataHash = JSON[data.body]['results']
# sunrise = dataHash['sunrise']
# sunset = dataHash['sunset']
# puts "Sunrise is at #{sunrise}"
# puts "Sunset is at #{sunset}"
#
# puts "-----"
# puts "Thank you to https://sunrise-sunset.org for providing the data :)"

# example results
# {
#   "results": {
#     "sunrise": "5:10:54 AM",
#     "sunset": "8:12:56 PM",
#     "solar_noon": "12:41:55 PM",
#     "day_length": "15:02:02",
#     "civil_twilight_begin": "4:29:59 AM",
#     "civil_twilight_end": "8:53:51 PM",
#     "nautical_twilight_begin": "3:35:44 AM",
#     "nautical_twilight_end": "9:48:05 PM",
#     "astronomical_twilight_begin": "2:23:29 AM",
#     "astronomical_twilight_end": "11:00:21 PM"
#   },
#   "status": "OK"
# }

# ---------------------------------------------
