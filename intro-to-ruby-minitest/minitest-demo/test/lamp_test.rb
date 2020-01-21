require "test_helper"

class LampTest < Minitest::Test
  def setup
    @light_bulb = LightBulb.new
    @lamp = Lamp.new(@light_bulb)
  end

  def teardown
    Outlet.unplug_all
  end

  def test_plug_in_plugs_lamp_into_socket
    @lamp.plug_in
    assert_equal [@lamp], Outlet.sockets
  end

  def test_turn_on_turns_on_light_bulb
    @lamp.plug_in
    @lamp.turn_on
    assert_predicate @lamp.light_bulb, :on?
  end

  def test_turn_on_does_not_turn_on_the_light_bulb_when_unplugged
    @lamp.turn_on
    assert_predicate @lamp.light_bulb, :off?
  end

  def test_turn_off_turns_off_light_bulb
    @lamp.plug_in
    @lamp.turn_on
    @lamp.turn_off
    assert_predicate @lamp.light_bulb, :off?
  end
end
