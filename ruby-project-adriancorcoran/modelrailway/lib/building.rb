require_relative 'item'

# inherits
class Building < Item
  def initialize(catalogue, cost, quantity)
    super(catalogue, cost, quantity)
  end
end
