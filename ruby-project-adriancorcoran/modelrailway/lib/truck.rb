require_relative 'item'

# inherits
class Truck < Item
  def initialize(catalogue, cost, quantity, full, is_covered)
    super(catalogue, cost, quantity)
    @full = full
    @is_covered = is_covered
  end

  attr_reader :full, :is_covered
end
