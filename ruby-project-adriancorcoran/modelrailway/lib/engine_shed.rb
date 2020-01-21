require_relative 'building'

# inherits
class EngineShed < Building
  def initialize(catalogue, cost, quantity, engine_type, capacity, filled_slots = 0)
    super(catalogue, cost, quantity)
    @engine_type = engine_type
    @capacity = capacity
    @filled_slots = filled_slots
  end

  attr_reader :engine_type, :capacity, :filled_slots

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Engine Type: #{@engine_type}, Capacity: #{@capacity}, Filled Slots: #{@filled_slots}"
    puts display_text
  end

  def full?
    @filled_slots >= @capacity
  end

  def train_arrives
    @filled_slots += 1
  end

  def train_leaves
    @filled_slots -= 1
  end
end
