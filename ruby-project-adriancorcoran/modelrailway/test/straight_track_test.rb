require 'test_helper'

class StraightTrackTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  def test_attrs
    my_track = StraightTrack.new(Catalogue.new, 5, 10, 15)
    assert_equal 5, my_track.cost
    assert_equal 10, my_track.quantity
    assert_equal 150, my_track.length
  end

  def test_add_track
    # cost = 5, quantity = 10, length = 10x15 = 150
    my_track = StraightTrack.new(Catalogue.new, 5, 10, 15)
    # cost = 3, quantity = 9, length = 9x10 = 90
    my_track.addTrack(3, 9, 10)
    # cost = 4, quantity = 10, length = 10x25 = 250
    my_track.addTrack(4, 10, 25)
    # cost = 1, quantity = 4, length = 4x20 = 80
    my_track.addTrack(1, 4, 20)
    assert_equal 13, my_track.cost
    assert_equal 33, my_track.quantity
    assert_equal 570, my_track.length
  end

  def test_cost
    my_track = StraightTrack.new(Catalogue.new, 5, 10, 15)
    assert_equal 50, my_track.calculate_total_cost
  end

  def test_add_item
    my_track = StraightTrack.new(Catalogue.new, 5, 10, 15)
    my_track.add_item
    assert_equal 11, my_track.quantity
  end

  def test_delete_item
    my_track = StraightTrack.new(Catalogue.new, 5, 10, 15)
    my_track.delete_item
    assert_equal 9, my_track.quantity
  end
end
