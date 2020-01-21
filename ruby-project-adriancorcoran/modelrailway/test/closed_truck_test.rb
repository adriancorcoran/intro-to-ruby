require 'test_helper'

class ClosedTruckTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true)
    assert_equal 5, my_truck.cost
    assert_equal 50, my_truck.quantity
  end

  def test_defaults
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true, true)
    assert_equal false, my_truck.full?
    assert_equal true, my_truck.is_covered
    assert_equal true, my_truck.delicate_cargo
  end

  def test_load
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true)
    my_truck.load
    assert_equal true, my_truck.full?
  end

  def test_unload
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, true, true)
    my_truck.unload
    assert_equal false, my_truck.full?
  end

  def test_cost
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true)
    assert_equal 250, my_truck.calculate_total_cost
  end

  def test_add_item
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true)
    my_truck.add_item
    assert_equal 51, my_truck.quantity
  end

  def test_delete_item
    my_truck = ClosedTruck.new(Catalogue.new, 5, 50, false, true)
    my_truck.delete_item
    assert_equal 49, my_truck.quantity
  end
end
