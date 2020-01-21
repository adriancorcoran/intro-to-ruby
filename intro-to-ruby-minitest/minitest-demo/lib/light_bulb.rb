class LightBulb
  def initialize(state = :off)
    @state = state
  end

  attr_reader :state

  def on
    @state = :on
  end

  def off
    @state = :off
  end

  def on?
    @state == :on
  end

  def off?
    @state == :off
  end
end
