require_relative 'building'

# inherits
class SignalBox < Building
  def initialize(catalogue, cost, quantity)
    super(catalogue, cost, quantity)
  end

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. No other details"
    puts display_text
  end
end
