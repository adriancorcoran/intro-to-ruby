require "test_helper"

class LightBulbTest < Minitest::Test
  def setup
    @light_bulb = LightBulb.new
  end

  def test_initialize_state_off
    assert_equal @light_bulb.state, :off
  end

  def test_initialize_state_overridable
    light_bulb = LightBulb.new(:on)
    assert_equal light_bulb.state, :on
  end

  def test_on_turns_light_bulb_on
    @light_bulb.on
    assert_equal @light_bulb.state, :on
  end

  def test_on_turns_light_bulb_off
    @light_bulb.on
    assert_equal @light_bulb.state, :on
  end

  def test_on_checks_light_bulb_state
    @light_bulb.on
    assert_predicate @light_bulb, :on?
    refute_predicate @light_bulb, :off?
  end

  def test_off_checks_light_bulb_state
    @light_bulb.off
    assert_predicate @light_bulb, :off?
    refute_predicate @light_bulb, :on?
  end
end
