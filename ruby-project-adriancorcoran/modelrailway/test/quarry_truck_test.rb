require 'test_helper'

class QuarryTruckTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'granite')
    assert_equal 5, my_truck.cost
    assert_equal 50, my_truck.quantity
    assert_equal 'granite', my_truck.stone_type
  end

  def test_defaults
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'quartz')
    assert_equal false, my_truck.full?
    assert_equal true, my_truck.is_covered
  end

  def test_fill_up
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'granite')
    my_truck.fillUp
    assert_equal true, my_truck.full?
  end

  def test_dump
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, true, true, 'quartz')
    my_truck.dump
    assert_equal false, my_truck.full?
  end

  def test_cost
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'quartz')
    assert_equal 250, my_truck.calculate_total_cost
  end

  def test_add_item
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'quartz')
    my_truck.add_item
    assert_equal 51, my_truck.quantity
  end

  def test_delete_item
    my_truck = QuarryTruck.new(Catalogue.new, 5, 50, false, true, 'quartz')
    my_truck.delete_item
    assert_equal 49, my_truck.quantity
  end
end
