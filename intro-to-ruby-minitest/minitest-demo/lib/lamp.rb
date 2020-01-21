class Lamp
  def initialize(light_bulb)
    @light_bulb = light_bulb
  end

  attr_reader :light_bulb

  def turn_on
    light_bulb.on if plugged_in?
  end

  def turn_off
    light_bulb.off
  end

  def plug_in
    Outlet.plug_in(self)
  end

  private

  def plugged_in?
    Outlet.sockets.include?(self)
  end
end
