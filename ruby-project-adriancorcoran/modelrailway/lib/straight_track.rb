require_relative 'track'

# inherits
class StraightTrack < Track
  def initialize(catalogue, cost, quantity, length)
    super(catalogue, cost, quantity, length)
  end

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}"
    puts display_text
  end
end
