require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'creation' do
    order = create(:order)
    assert order.valid?

    order = create(:order_with_ingredients)
    assert order.valid?

    order = create(:order_with_meat)
    assert order.valid?

    order = create(:order_with_delivery)
    assert order.valid?
  end

  test 'validate tortilla' do
    order = build(:order, tortilla: 'Bogus')
    assert !order.valid?
    order.tortilla = 'Corn'
    assert order.valid?
  end

  test 'validate delivery' do
    order = build(:order, delivery: true)
    assert !order.valid?

    order.address_street1 = '123 Main St'
    order.address_city = 'Seattle'
    order.address_state = 'WA'
    assert !order.valid?

    order.address_zip = '98101'
    assert order.valid?
  end

  test 'toppings' do
    order = build(:order)

    # Getter
    assert_equal([], order.toppings)
    order.cheese = true
    order.sour_cream = true
    assert_equal([ 'Cheese', 'Sour Cream' ], order.toppings)

    # Setter
    order.toppings = %w[Salsa Lettuce]
    assert(order.salsa)
    assert(order.lettuce)
    assert(!order.cheese)
    assert(!order.sour_cream)
    assert(!order.guacamole)
  end
end
