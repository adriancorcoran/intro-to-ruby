require_relative 'truck'

# inherits
class ClosedTruck < Truck
  def initialize(catalogue, cost, quantity, full, is_covered, delicate_cargo = false)
    super(catalogue, cost, quantity, full, is_covered)
    @delicate_cargo = delicate_cargo
  end

  attr_reader :delicate_cargo

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Is Full: #{@full}, Is Covered: #{@is_covered}, Delicate Cargo: #{@delicate_cargo}"
    puts display_text
  end

  def load
    @full = true
  end

  def unload
    @full = false
  end
end
