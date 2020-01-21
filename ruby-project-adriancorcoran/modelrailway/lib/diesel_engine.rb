require_relative 'engine'

# inherits
class DieselEngine < Engine
  def initialize(catalogue, cost, quantity, length, wheelbase, has_diesel = false)
    super(catalogue, cost, quantity, length, wheelbase)
    @has_diesel = has_diesel
  end

  attr_reader :has_diesel

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}, Wheelbase: #{@wheelbase}, Has Diesel: #{@has_diesel}"
    puts display_text
  end

  def refuel
    @has_diesel = true
  end

  def defuel
    @has_diesel = false
  end
end
