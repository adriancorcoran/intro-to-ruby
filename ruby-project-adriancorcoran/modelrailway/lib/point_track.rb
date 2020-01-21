require_relative 'track'

# inherits
class PointTrack < Track
  def initialize(catalogue, cost, quantity, length, num_points = 2)
    super(catalogue, cost, quantity, length)
    @num_points = num_points
  end

  attr_accessor :num_points

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}, Number of Points: #{@num_points}"
    puts display_text
  end
end
