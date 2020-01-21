require "test_helper"

class OrderTest < Minitest::Test
  def setup
    @items = [
      Item.new('Invisible Ink', 4, 10.00),
      Item.new('Laser Gun', 1, 260.50),
      Item.new('Disco Ball', 3, 19.00),
    ]
    @order = Order.new(@items)
  end

  attr_reader :items, :order

  def test_items
    assert_equal items, order.items
  end

  def test_initialize_discount_rate_defaults_to_zero
    assert_equal 0, order.instance_variable_get(:@discount_rate)
  end

  def test_initialize_discount_rate_overridable
    order = Order.new(@items, 0.70)
    assert_equal 0.70, order.instance_variable_get(:@discount_rate)
  end

  def test_initialize_discount_rate_raises_when_invalid
    error = assert_raises(ArgumentError) do
      Order.new(@items, 50)
    end
    assert_equal 'Discount rate must be between 0 and 1', error.message
  end

  def test_discount_rate_assignment
    order.discount_rate = 0.80
    assert_equal 0.80, order.instance_variable_get(:@discount_rate)
  end

  def test_discount_rate_assignment_raises_when_less_than_zero
    error = assert_raises(ArgumentError) do
      order.discount_rate = -1
    end
    assert_equal 'Discount rate must be between 0 and 1', error.message
  end

  def test_discount_rate_assignment_raises_when_greater_than_one
    error = assert_raises(ArgumentError) do
      order.discount_rate = 1.56
    end
    assert_equal 'Discount rate must be between 0 and 1', error.message
  end

  def test_total_sums_item_prices
    assert_equal 357.50, order.total
  end

  def test_total_applies_discount
    order.discount_rate = 0.50
    assert_equal 178.75, order.total
  end

  def test_valid_when_items_present
    assert_predicate order, :valid?
  end

  def test_invalid_when_items_empty
    order = Order.new([])
    refute_predicate order, :valid?
  end

  def test_discount_calculates_discount_amount
    order.discount_rate = 0.90
    assert_equal 321.75, order.discount
  end
end
