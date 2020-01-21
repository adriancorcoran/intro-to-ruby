require_relative 'catalogue'

# new class
class Item
  def initialize(catalogue, cost, quantity)
    @cost = cost
    @quantity = quantity
    catalogue.add_item(self.class, self)
  end

  # def value=(value)
  #   @value = value
  # end

  attr_accessor :cost, :quantity

  def add_item(quantity = 1)
    @quantity += quantity
  end

  def delete_item(quantity = 1)
    @quantity -= quantity
  end

  # not working yet :) trying to update instance variable
  def update_item(key, value)
    # x = eval('@' + key)
    # x = value
  end

  def calculate_total_cost
    @cost * @quantity
  end

  def display_me
    puts 'This method should be overwritten'
  end
end
