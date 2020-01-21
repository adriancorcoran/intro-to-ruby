require_relative 'truck'

# inherits
class OilTruck < Truck
  def initialize(catalogue, cost, quantity, full, is_covered, oil_type)
    super(catalogue, cost, quantity, full, is_covered)
    @oil_type = oil_type
  end

  attr_reader :oil_type

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Is Full: #{@full}, Is Covered: #{@is_covered}, Oil Type: #{@oil_type}"
    puts display_text
  end

  def fill_up
    @full = true
  end

  def drain
    @full = false
  end
end
