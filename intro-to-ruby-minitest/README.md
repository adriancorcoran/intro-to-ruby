# Tutorial 4 - Intro to Ruby - Minitest

## Demo Goals

* Minitest Setup
* Assertions
* No stubs / mocks - See references for an article!

## Demo - Item
1. Item is initialized with `name`, `quantity`, and `unit_price`.
1. Item returns name with `item.name`.
1. Item returns quantity with `item.quantity`.
1. Item returns unit price with `item.unit_price`.
1. Item calculates the total price from the items `item.price`.

## Demo - Order
1. Order is initialized with `items`.
1. Order returns items with `order.items`.
1. Order calculates the total price from the items `order.total`.
1. Edge case, Order responds to `#valid?` and returns invalid if items are empty.

## References
* [List of assertions for MiniTest](http://docs.seattlerb.org/minitest/Minitest/Assertions.html)
* [Stub and Mocks for MiniTest](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)
* [Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development)

## Breakout Session Part 1

### New requirement: Order should support a discount percentage.

Think of how to implement discount at the Order level.

Goals:

* Open `lib/order.rb` and add the discount feature.
* Make all tests pass.

* Hint: `#initialize` takes `discount_rate` as an argument (which defaults to `0`).
* Hint: `Order` should allow setting the discount rate via `#discount_rate=`.
* Hint: `#discount_rate=` should raise an ArgumentError if the discount is _not_ between `0` and `1`.
* Hint: `Order` should allow getting the total discounted amount via `#discount`.
* Hint: `#total` should take into account the discount rate (if set).

## Breakout Session Part 2

### New requirement: Calculate order shipping charges.

- When shipping <= 3 items, $10
- When shipping > 3 items, $20

Question: Would we implement this feature inside of `Order` or add a new class?
Answer: Adding a new class is preferable because order concerns are different from shipping concerns.

Goals:

* Open `test/shipping_charge_test.rb` and add a test case for `ShippingCharge`.
* Add the following test methods: `test_calculate_for_three_items`, `test_calculate_for_four_items`.
* In each test method, create a `ShippingCharge` and assert the output of `#calculate`.
* Make sure your tests pass.

* Hint: Remember to `require "test_helper"` in your test case file.
* Hint: Remember to postfix the test case class name with `Test`.
* Hint: Test case test methods always begin with the prefix `test_`.
