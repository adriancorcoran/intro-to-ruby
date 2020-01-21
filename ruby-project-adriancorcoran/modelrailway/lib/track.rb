require_relative 'item'

# inherits
class Track < Item
  def initialize(catalogue, cost, quantity, length)
    super(catalogue, cost, quantity)
    @length = quantity * length
  end

  attr_reader :length, :is_flexible

  def grab_total_length
    @length
  end

  def add_track(cost, quantity, length)
    @cost += cost
    @quantity += quantity
    @length += (length * quantity)
  end
end
