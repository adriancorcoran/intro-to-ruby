require 'test_helper'

class ElectricEngineTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    ElectricEngine.new(Catalogue.new, 125, 10, 12, 'co-co', true)
    assert_equal 125, my_engine.cost
    assert_equal 10, my_engine.quantity
    assert_equal 12, my_engine.length
    assert_equal 'co-co', my_engine.wheelbase
  end

  def test_defaults
    ElectricEngine.new(Catalogue.new, 150, 5, 11, 'bo-bo')
    assert_equal false, my_engine.is_charged
  end

  def test_recharge
    ElectricEngine.new(Catalogue.new, 125, 10, 12, 'co-co')
    my_engine.recharge
    assert_equal true, my_engine.is_charged
  end

  def test_decharge
    ElectricEngine.new(Catalogue.new, 100, 2, 11, 'co-co')
    my_engine.recharge
    my_engine.decharge
    assert_equal false, my_engine.is_charged
  end

  def test_cost
    ElectricEngine.new(Catalogue.new, 100, 10, 12, 'co-co', true)
    assert_equal 1000, my_engine.calculate_total_cost
  end

  def test_add_item
    ElectricEngine.new(Catalogue.new, 100, 10, 12, 'co-co', true)
    my_engine.add_item
    assert_equal 11, my_engine.quantity
  end

  def test_delete_item
    ElectricEngine.new(Catalogue.new, 100, 10, 12, 'co-co', true)
    my_engine.delete_item
    assert_equal 9, my_engine.quantity
  end
end
