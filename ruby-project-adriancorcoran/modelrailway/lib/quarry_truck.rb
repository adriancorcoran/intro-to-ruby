require_relative 'truck'

# inherits
class QuarryTruck < Truck
  def initialize(catalogue, cost, quantity, full, is_covered, stone_type)
    super(catalogue, cost, quantity, full, is_covered)
    @stone_type = stone_type
  end

  attr_reader :stone_type

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Is Full: #{@full}, Is Covered: #{@is_covered}, Stone Type: #{@stone_type}"
    puts display_text
  end

  def fill_up
    @full = true
  end

  def dump
    @full = false
  end
end
