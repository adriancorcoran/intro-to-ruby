require './lib/catalogue'
# init
catalogue = Catalogue.new
# create catalogue
catalogue.create_catalog
# display the full catalogue
catalogue.display_catalog
# display the total cost of the catalogue
catalogue.display_total_cost

# puts eval("SteamEngine")
# puts "Number of Steam Engines: #{catalogue.grab_type_quantity(SteamEngine)}"
# puts "-----"
