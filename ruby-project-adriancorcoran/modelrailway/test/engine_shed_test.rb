require 'test_helper'

class EngineShedTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10)
    assert_equal 40, my_building.cost
    assert_equal 2, my_building.quantity
    assert_equal 'diesel', my_building.engine_type
    assert_equal 10, my_building.capacity
  end

  def test_defaults
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10)
    assert_equal 0, my_building.filled_slots
  end

  def test_full?
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 5, 5)
    assert_equal true, my_building.full?
  end

  def test_is_not_full
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 5, 2)
    assert_equal false, my_building.full?
  end

  def test_train_arrives
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10, 0)
    my_building.trainArrives
    my_building.trainArrives
    assert_equal 2, my_building.filled_slots
  end

  def test_train_leaves
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10, 10)
    my_building.trainLeaves
    my_building.trainLeaves
    assert_equal 8, my_building.filled_slots
  end

  def test_cost
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10, 0)
    assert_equal 80, my_building.calculate_total_cost
  end

  def test_add_item
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10, 0)
    my_building.add_item
    assert_equal 3, my_building.quantity
  end

  def test_delete_item
    my_building = EngineShed.new(Catalogue.new, 40, 2, 'diesel', 10, 0)
    my_building.delete_item
    assert_equal 1, my_building.quantity
  end
end
