require_relative 'building'

# inherits
class Station < Building
  def initialize(catalogue, cost, quantity, is_terminus = false, num_platforms = 2, num_platforms_occupied = 0)
    super(catalogue, cost, quantity)
    @is_terminus = is_terminus
    @num_platforms = num_platforms
    @num_platforms_occupied = num_platforms_occupied
  end

  attr_reader :is_terminus, :num_platforms, :num_platforms_occupied

  def display_me
    display_text = "  #{self.class}: #{@quantity} @ €#{@cost} each. Details: "
    display_text += "Is Terminus: #{@is_terminus}, Number of Platforms: #{@num_platforms}, Number of Platforms Occupied: #{@num_platforms_occupied}"
    puts display_text
  end

  def full?
    @num_platforms_occupied >= @num_platforms
  end

  def train_arrives
    @num_platforms_occupied += 1
  end

  def train_leaves
    @num_platforms_occupied -= 1
  end
end
