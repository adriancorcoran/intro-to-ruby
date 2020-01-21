require "test_helper"

class OutletTest < Minitest::Test
  def teardown
    Outlet.unplug_all
  end

  def test_unplug_all_unplugs_all_sockets
    2.times { Outlet.plug_in(new_lamp) }
    Outlet.unplug_all
    assert_equal [], Outlet.sockets
  end

  def test_plug_in_plugs_thing_into_socket
    lamp = new_lamp
    Outlet.plug_in(lamp)
    assert_equal [lamp], Outlet.sockets
  end

  def test_raises_an_error_when_too_many_things_plugged_in
    error = assert_raises(RuntimeError) do
      3.times { Outlet.plug_in(new_lamp) }
    end
    assert_equal 'Too many things plugged into socket!', error.message
  end

  private

  def new_lamp
    light_bulb = LightBulb.new
    Lamp.new(light_bulb)
  end
end
