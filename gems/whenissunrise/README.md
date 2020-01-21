# When is Sunrise
This gem takes a latitude and longitude and gives back the sunrise and sunset in that location.<br />
The api service is provided by https://sunrise-sunset.org/api

## To install the gem from RubyGems.org
Run `gem install whenissunrise`

## To build and install the gem locally
1. Clone the repo
2. `cd` to the root folder and run the following commands
 * `gem build whenissunrise.gemspec`
 * `gem install whenissunrise-0.0.3.gem`

## To use the gem
You can then use the gem in IRB by running:

 - `require 'whenissunrise'`
 - `Whenissunrise.sunrise`

Alternatively, you can run the gem directly by running `ruby index.rb` from the root folder
