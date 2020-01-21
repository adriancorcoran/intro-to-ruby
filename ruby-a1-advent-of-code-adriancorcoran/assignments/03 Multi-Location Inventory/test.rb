# require
require './classes/Config.rb'
# classes
require './classes/Cart.rb'
require './classes/Customer.rb'
require './classes/Order.rb'
require './classes/ShippingRates.rb'
require './classes/Product.rb'
require './classes/Discount.rb'

# create dummy data objects
config = Config.new
customer_data = config.customers['irish']
distribution_locations_data = config.distribution_locations
product_data = config.products

# create objects
cart = Cart.new()
order = Order.new()
customer = Customer.new()
shipping_rates = ShippingRates.new(distribution_locations_data)
product = Product.new(product_data)
discount = Discount.new()
all_products = product.products

# vars
divider = '------------------------------------------------------------'

# start output
puts divider
puts divider
puts divider
puts 'Running Scenario 1:'
puts '- customer is located in Ireland and places an order'
puts '- the product is stocked in Ireland, but the quantity of items ordered means the order will be fulfilled from both Canada and Ireland'

## Logic
# 1. Customer adds products to cart
puts divider
puts "1. Customer adds products to cart..."
cart.AddVariant(all_products[0], 67)
cart.AddVariant(all_products[0], 90)
cart.AddVariant(all_products[0], 90)
cart.AddVariant(all_products[0], 67)
cart.AddVariant(all_products[0], 67)
cart.AddVariant(all_products[0], 67)
puts divider
cart.DisplayCart  # this is to show the reviewer what's in the cart at the moment

# 2. Customer proceeds to checkout step 1 (personal info)
puts divider
puts "2. Customer proceeds to checkout step 1 (personal info)"
order.CreateOrder(cart, shipping_rates)
puts divider
order.DisplayOrder # this is to show the reviewer what's in the order at the moment

# 3. Customer enters personal info and delivery address and proceeds to shipping
puts divider
puts "3. Customer enters personal info and delivery address and proceeds to shipping"
customer.CreateCustomer(customer_data)
order.AddCustomer(customer.GetCustomer)
puts divider
order.DisplayOrder  # this is to show the reviewer what's in the order at the moment

# 4. Customer proceeds to checkout step 2 (shipping info)
puts divider
puts "4. Customer is presented with subtotal and total, as well as shipping rates dictated by their address and also the inventory levels at the distribution hubs"
# first, get the distribution hub to be used for this order closest to the customer
order.CalculateShipping()
order.SetTotal()
puts divider
order.DisplayOrder  # this is to show the reviewer what's in the order at the moment

# 5. Customer enters credit card data and checks out
puts divider
puts "5. Customer enters card details and pays for order, checkout is processed"
# first, get the distribution hub to be used for this order closest to the customer
order.DoCheckout()
puts divider
puts "Thank you for your order! Please see the details below :)"
puts ""
order.DisplayOrder  # this is to show the reviewer what's in the order at the moment
puts divider
puts "Have a nice day!"
puts divider
puts divider
puts divider
