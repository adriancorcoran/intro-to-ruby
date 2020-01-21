require "test_helper"

class ItemTest < Minitest::Test
  def test_name
    name = 'Chunky Bacon'
    quantity = 20
    unit_price = 10.99
    item = Item.new(name, quantity, unit_price)
    assert_equal name, item.name
  end

  def test_quantity
    name = 'Rocket Shoes'
    quantity = 10
    unit_price = 30.99
    item = Item.new(name, quantity, unit_price)
    assert_equal quantity, item.quantity
  end

  def test_unit_price
    name = 'Giant Robot'
    quantity = 2
    unit_price = 90.99
    item = Item.new(name, quantity, unit_price)
    assert_equal unit_price, item.unit_price
  end

  def test_price
    name = 'Hot Sauce'
    quantity = 10
    unit_price = 7.99
    price = 79.90
    item = Item.new(name, quantity, unit_price)
    assert_equal price, item.price
  end
end
