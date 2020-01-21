require_relative 'engine'

# inherits
class ElectricEngine < Engine
  def initialize(catalogue, cost, quantity, length, wheelbase, is_charged = false)
    super(catalogue, cost, quantity, length, wheelbase)
    @is_charged = is_charged
  end

  attr_reader :is_charged

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}, Wheelbase: #{@wheelbase}, Is Charged: #{@is_charged}"
    puts display_text
  end

  def recharge
    @is_charged = true
  end

  def decharge
    @is_charged = false
  end
end
