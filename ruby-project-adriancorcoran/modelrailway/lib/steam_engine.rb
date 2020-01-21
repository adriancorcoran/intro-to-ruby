require_relative 'engine'

# inherits
class SteamEngine < Engine
  def initialize(catalogue, cost, quantity, length, wheelbase, has_tender = false, has_water = false, has_coal = false)
    super(catalogue, cost, quantity, length, wheelbase)
    @has_tender = has_tender
    @has_water = has_water
    @has_coal = has_coal
  end

  attr_reader :has_tender, :has_water, :has_coal

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Length: #{@length}, Wheelbase: #{@wheelbase}, Has Tender: #{@has_tender}, Has Water: #{@has_water}, Has Coal: #{@has_coal}"
    puts display_text
  end

  def refuel
    @has_water = true
    @has_coal = true
  end

  def defuel
    @has_water = false
    @has_coal = false
  end
end
