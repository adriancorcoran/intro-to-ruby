require_relative 'track'

# inherits
class CurvedTrack < Track
  def initialize(catalogue, cost, quantity, length, radius = 15)
    super(catalogue, cost, quantity, length)
    @radius = radius
  end

  attr_reader :radius

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}, Radius: #{@radius}"
    puts display_text
  end
end
