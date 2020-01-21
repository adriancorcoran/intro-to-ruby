class Item
  def initialize(name, quantity, unit_price)
    @name = name
    @quantity = quantity
    @unit_price = unit_price
  end

  attr_reader :name, :quantity, :unit_price

  def price
    @unit_price * @quantity
  end
end
