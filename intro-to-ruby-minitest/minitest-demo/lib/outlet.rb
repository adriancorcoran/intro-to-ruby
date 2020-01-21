class Outlet
  @sockets = []

  class << self
    attr_accessor :sockets
  end

  def self.plug_in(thing)
    raise 'Too many things plugged into socket!' if sockets.count >= 2
    sockets << thing
  end

  def self.unplug_all
    self.sockets = []
  end
end
