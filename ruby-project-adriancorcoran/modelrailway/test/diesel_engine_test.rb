require 'test_helper'

class DieselEngineTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    DieselEngine.new(Catalogue.new, 125, 10, 12, 'co-co', true)
    assert_equal 125, my_engine.cost
    assert_equal 10, my_engine.quantity
    assert_equal 12, my_engine.length
    assert_equal 'co-co', my_engine.wheelbase
  end

  def test_defaults
    DieselEngine.new(Catalogue.new, 150, 5, 11, 'bo-bo')
    assert_equal false, my_engine.has_diesel
  end

  def test_refuel
    DieselEngine.new(Catalogue.new, 125, 10, 12, 'co-co')
    my_engine.refuel
    assert_equal true, my_engine.has_diesel
  end

  def test_defuel
    DieselEngine.new(Catalogue.new, 100, 2, 11, 'co-co')
    my_engine.refuel
    my_engine.defuel
    assert_equal false, my_engine.has_diesel
  end

  def test_cost
    DieselEngine.new(Catalogue.new, 125, 10, 12, 'co-co', true)
    assert_equal 1250, my_engine.calculate_total_cost
  end

  def test_add_item
    DieselEngine.new(Catalogue.new, 125, 10, 12, 'co-co', true)
    my_engine.add_item
    assert_equal 11, my_engine.quantity
  end

  def test_delete_item
    DieselEngine.new(Catalogue.new, 125, 10, 12, 'co-co', true)
    my_engine.delete_item
    assert_equal 9, my_engine.quantity
  end
end
