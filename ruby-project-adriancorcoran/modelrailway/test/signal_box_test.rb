require 'test_helper'

class SignalBoxTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_building = SignalBox.new(Catalogue.new, 25, 3)
    assert_equal 25, my_building.cost
    assert_equal 3, my_building.quantity
  end

  def test_cost
    my_building = SignalBox.new(Catalogue.new, 25, 3)
    assert_equal 75, my_building.calculate_total_cost
  end

  def test_add_item
    my_building = SignalBox.new(Catalogue.new, 25, 3)
    my_building.add_item
    assert_equal 4, my_building.quantity
  end

  def test_delete_item
    my_building = SignalBox.new(Catalogue.new, 25, 3)
    my_building.delete_item
    assert_equal 2, my_building.quantity
  end
end
