require 'test_helper'

class CatalogueTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_catalogue = Catalogue.new
    # DieselEngine.new(my_catalogue, 125, 10, 12, "co-co", true)
    assert_equal Hash, my_catalogue.catalogue.class
  end

  def test_add_item
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 125, 10, 12, 'co-co', true)
    assert_equal 1, my_catalogue.catalogue.keys.count

    my_catalogue.add_item(DieselEngine, my_engine)
    assert_equal 2, my_catalogue.catalogue[DieselEngine].count
  end

  def test_remove_item_type
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 125, 10, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 45, 5, 9, '2-3-2', true)
    assert_equal 2, my_catalogue.catalogue.keys.count
    my_catalogue.remove_item_type(SteamEngine)
    assert_equal 1, my_catalogue.catalogue.keys.count
  end

  def test_get_total_cost
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 125, 10, 12, 'co-co', true)
    assert_equal 1250, my_catalogue.calculate_total_cost
  end

  def test_grab_items_as_array
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 100, 1, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 40, 2, 9, '2-3-2', true)
    SteamEngine.new(my_catalogue, 90, 1, 10, '4-3-2', true)
    items = my_catalogue.grab_items_as_array
    assert_equal 3, items.count
  end

  def test_get_type_quantity
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 125, 10, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 45, 5, 9, '2-3-2', true)
    SteamEngine.new(my_catalogue, 90, 6, 10, '4-3-2', true)
    my_results = my_catalogue.grab_type_quantity(SteamEngine)
    assert_equal 11, my_results
  end

  def test_get_type_costs
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 100, 1, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 40, 2, 9, '2-3-2', true)
    SteamEngine.new(my_catalogue, 90, 1, 10, '4-3-2', true)
    costs = my_catalogue.grab_type_costs(SteamEngine)
    assert_equal 40, costs[0]
    assert_equal 90, costs[1]
  end

  def test_find_by_type
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 125, 10, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 45, 5, 9, '2-3-2', true)
    SteamEngine.new(my_catalogue, 90, 6, 10, '4-3-2', true)
    my_results = my_catalogue.find_type(SteamEngine)
    assert_equal 2, my_results.count
  end

  def test_get_expensive_items
    my_catalogue = Catalogue.new
    DieselEngine.new(my_catalogue, 100, 1, 12, 'co-co', true)
    SteamEngine.new(my_catalogue, 40, 2, 9, '2-3-2', true)
    SteamEngine.new(my_catalogue, 90, 1, 10, '4-3-2', true)
    my_expensive_items = my_catalogue.grab_expensive_items(50)
    assert_equal 2, my_expensive_items[0].count
    assert_equal 1, my_expensive_items[1].count
  end
end
