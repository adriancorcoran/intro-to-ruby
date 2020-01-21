class Order
  attr_accessor :order

  def initialize
    @order = {}
    @cart
    @shipping_rates
    @customer
  end

  def CreateOrder(cart, shipping_rates)
    puts "Creating order..."
    @cart = cart
    @shipping_rates = shipping_rates
    @order = {
      'id' => rand(10...100),
      'status' => "Pending",
      'line_items' => @cart.GetCart,
      'shipping_details' => Hash.new,
      'cost_details' => Hash.new,
      'fulfillment_details' => []
    }
    SetSubtotal()
    puts "Created Order ##{@order['id']} with status [#{@order['status']}]"
  end

  def AddCustomer(customer)
    puts "Adding Customer to Order..."
    @customer = customer
    @customer.each do |key, value|
      new_key = 'customer_' + key.to_s
      @order[new_key] = value
    end
    puts "Customer added to order"
  end

  def CalculateShipping
    puts "Calculating shipping for customer in #{@customer['address']}..."
    rates = @shipping_rates.GetRates(@customer['address'])
    @order['line_items'].each do |item|
      # ship from first location
      puts "#{item['title_full']}"
      puts "...need to ship #{item['quantity']} of '#{item['title_full']}' to #{@customer['address']}"
      puts "...do we have #{item['quantity']} in #{@customer['address']}?"

      # need to calculate how many to ship from 1st hub and then the balance to ship from the 2nd hub
      if item['inventory'][@customer['address']] >= item['quantity']
        puts "Yes we have #{item['quantity']}, we can ship all items from the first location"
        num_to_ship = item['quantity']
        balance_to_ship = 0
      else
        num_to_ship = item['inventory'][@customer['address']]
        balance_to_ship = item['quantity'] - item['inventory'][@customer['address']]
        puts "No we only have #{num_to_ship}, we will need to ship #{balance_to_ship} items from the second location"
      end

      # do we have 5 items in inventory in this hub
      if num_to_ship > 0
        # yes
        # shipping_cost is e.g. "from Ireland to Ireland" => rate
        puts "...add rate from #{rates['ship_from']} to #{@customer['address']}"
        shipping_details_key = "from #{rates['ship_from']} to #{@customer['address']}"
        @order['shipping_details'][shipping_details_key] = rates['rates'][@customer['address']]
        # fulfilment desc is e.g. "ship 5 items from Ireland to Ireland"
        puts "...add fulfillment details: Ship #{num_to_ship} x '#{item['title_full']}' from #{rates['ship_from']} to #{@customer['address']}"
        @order['fulfillment_details'].push("Ship #{num_to_ship} x '#{item['title_full']}' from #{rates['ship_from']} to #{@customer['address']}")
      end

      puts "...do we have any items left over to ship from another location?"
      # yes - 2 items
      if balance_to_ship > 0
        puts "...yes, we have #{balance_to_ship} left over"
        # yes - 2 items
        # check fall back and get rates
        puts "...check our fallback location, which is #{rates['fallback_to']}"
        # do we have balance items in fallback?
        puts "...do we have #{balance_to_ship} in #{rates['fallback_to']}?"
        # if we have items to ship from the 2nd location
        if balance_to_ship <= item['inventory'][rates['fallback_to']]
          puts "...yes, we have #{item['inventory'][rates['fallback_to']]}"
          puts "...get the new shipping rates from the 2nd location"
          # get the rates from the 2nd location
          newRates = @shipping_rates.GetRates(rates['fallback_to'])
          puts "...add rate from #{newRates['ship_from']} to #{@customer['address']}"
          shipping_details_key = "from #{newRates['ship_from']} to #{@customer['address']}"
          # shipping_cost is e.g. "from Canada to Ireland" => rate
          @order['shipping_details'][shipping_details_key] = newRates['rates'][@customer['address']]
          # fulfilment desc is "ship 2 items from Canada to Ireland"
          puts "...add fulfillment details: Ship #{balance_to_ship} x '#{item['title_full']}' from #{newRates['ship_from']} to #{@customer['address']}"
          @order['fulfillment_details'].push("Ship #{balance_to_ship} x '#{item['title_full']}' from #{newRates['ship_from']} to #{@customer['address']}")
        end
      end
    end

    # set the shipping total
    SetShippingCost()
  end

  def SetSubtotal
    subtotal = 0
    @order['line_items'].each do |item|
      subtotal += item['quantity'] * item['price']
    end
    @order['cost_details']["Subtotal"] = subtotal
  end

  def SetShippingCost
    subtotal = 0
    @order['shipping_details'].each do |key, value|
      subtotal += value
    end
    @order['cost_details']["Shipping Cost"] = subtotal
  end

  def SetTotal
    subtotal = 0
    @order['cost_details'].each do |key, value|
      subtotal += value
    end
    @order['cost_details']["Total Cost"] = subtotal
  end

  def SendOrderEmail
    puts "Sending order email..."
    puts "Email sent to customer!"
  end

  def DoCheckout
    puts "Processing credit card..."
    puts "Payment successful!"
    puts "Updating order status..."
    @order['status'] = "Confirmed"
    puts "Order status updated"
    SendOrderEmail()
    puts "Returning to Order Thank You page and displaying order details..."
  end

  def DisplayOrder
    puts 'Current Order:'
    puts "Id: #{@order['id']}"
    puts "Status: #{@order['status']}"
    puts "Customer:"
    puts "-Id: #{@order['customer_id']}"
    puts "-Name: #{@order['customer_name']}"
    puts "-Email: #{@order['customer_email']}"
    puts "-Address: #{@order['customer_address']}"
    puts "Line Items:"
    @order['line_items'].each { |item| puts "-#{item['quantity']} x #{item['title_full']} @ €#{item['price']} each" }
    puts "Shipping Costs:"
    @order['shipping_details'].each { |key, value| puts "-#{key}: €#{value}" }
    puts "Fulfilment Details:"
    @order['fulfillment_details'].each { |item| puts "-#{item}" }
    puts "Costs:"
    @order['cost_details'].each { |key, value| puts "-#{key}: €#{value}" }
  end

end
