require_relative 'item'

# inherits
class Engine < Item
  def initialize(catalogue, cost, quantity, length, wheelbase)
    super(catalogue, cost, quantity)
    @length = length
    @wheelbase = wheelbase
  end

  attr_reader :length, :wheelbase
end
