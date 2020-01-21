class Customer

  def initialize()
    @customer = {}
  end

  def CreateCustomer(customer_data)
    puts "Creating customer..."
    @customer = customer_data
    puts "Created Customer:"
    DisplayCustomer()
  end

  def GetCustomer
    @customer
  end

  def GetCustomerAddress
    @customer['address']
  end

  def DisplayCustomer
    puts "Customer Information:"
    puts "Id: #{@customer['id']}"
    puts "Name: #{@customer['name']}"
    puts "Email: #{@customer['email']}"
    puts "Address: #{@customer['address']}"
  end

end
