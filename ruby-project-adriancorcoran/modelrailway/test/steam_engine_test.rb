require 'test_helper'

class SteamEngineTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    SteamEngine.new(Catalogue.new, 55, 10, 14, '4-3-2', true)
    assert_equal 55, my_engine.cost
    assert_equal 10, my_engine.quantity
    assert_equal 14, my_engine.length
    assert_equal '4-3-2', my_engine.wheelbase
  end

  def test_defaults
    SteamEngine.new(Catalogue.new, 45, 5, 9, '2-3-2', true)
    assert_equal true, my_engine.has_tender
    assert_equal false, my_engine.has_water
    assert_equal false, my_engine.has_coal
  end

  def test_refuel
    SteamEngine.new(Catalogue.new, 33, 12, 10, '2-4-2')
    my_engine.refuel
    assert_equal true, my_engine.has_water
    assert_equal true, my_engine.has_coal
  end

  def test_defuel
    SteamEngine.new(Catalogue.new, 33, 12, 10, '2-4-2')
    my_engine.refuel
    my_engine.defuel
    assert_equal false, my_engine.has_water
    assert_equal false, my_engine.has_coal
  end

  def test_cost
    SteamEngine.new(Catalogue.new, 50, 10, 16, '4-4-2')
    assert_equal 500, my_engine.calculate_total_cost
  end

  def test_add_item
    SteamEngine.new(Catalogue.new, 50, 10, 16, '4-4-2')
    my_engine.add_item
    assert_equal 11, my_engine.quantity
  end

  def test_delete_item
    SteamEngine.new(Catalogue.new, 50, 10, 16, '4-4-2')
    my_engine.delete_item
    assert_equal 9, my_engine.quantity
  end
end
