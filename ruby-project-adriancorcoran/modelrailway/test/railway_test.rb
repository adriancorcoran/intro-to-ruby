require 'test_helper'
require 'railway'

class RailwayTest < Minitest::Test
  # tried to load yaml data but couldn't - kept getting a load error

  include Railway

  def test_module
    assert_equal 2000, Railway::TOTAL_BUDGET
    assert_equal 200, Railway::TOTAL_DISTANCE
  end
end
