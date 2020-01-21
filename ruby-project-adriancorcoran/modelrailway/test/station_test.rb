require 'test_helper'

class StationTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    # def initialize(cost, quantity, is_terminus = false,
    # num_platforms = 2, num_platforms_occupied = 0)

    my_building = Station.new(Catalogue.new, 100, 3, false, 3)
    assert_equal 100, my_building.cost
    assert_equal 3, my_building.quantity
  end

  def test_defaults
    my_building = Station.new(Catalogue.new, 100, 3)
    assert_equal false, my_building.is_terminus
    assert_equal 2, my_building.num_platforms
    assert_equal 0, my_building.num_platforms_occupied
  end

  def test_full?
    my_building = Station.new(Catalogue.new, 100, 3, false, 3, 3)
    assert_equal true, my_building.full?
  end

  def test_is_not_full
    my_building = Station.new(Catalogue.new, 100, 3, false, 10, 2)
    assert_equal false, my_building.full?
  end

  def test_train_arrives
    my_building = Station.new(Catalogue.new, 100, 3, false, 3, 0)
    my_building.trainArrives
    my_building.trainArrives
    assert_equal 2, my_building.num_platforms_occupied
  end

  def test_train_leaves
    my_building = Station.new(Catalogue.new, 100, 3, false, 20, 10)
    my_building.trainLeaves
    my_building.trainLeaves
    assert_equal 8, my_building.num_platforms_occupied
  end

  def test_cost
    my_building = Station.new(Catalogue.new, 100, 3, false, 3, 0)
    assert_equal 300, my_building.calculate_total_cost
  end

  def test_add_item
    my_building = Station.new(Catalogue.new, 100, 3, false, 3, 0)
    my_building.add_item
    assert_equal 4, my_building.quantity
  end

  def test_delete_item
    my_building = Station.new(Catalogue.new, 100, 3, false, 3, 0)
    my_building.delete_item
    assert_equal 2, my_building.quantity
  end
end
