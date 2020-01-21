class ShippingCharge
  def initialize(order)
    @order = order
  end

  def calculate
    if less_than_four_items?
      10.00
    else
      20.00
    end
  end

  private

  def less_than_four_items?
    @order.items.count < 4
  end
end
