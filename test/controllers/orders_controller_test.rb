require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = create(:order)
  end

  test 'should get index' do
    get orders_url
    assert_response :success
  end

  test 'should get new' do
    get new_order_url
    assert_response :success
  end

  test 'should create order' do
    assert_difference('Order.count') do
      post orders_url, params: {
        order: {
          first_name: 'Jane',
          last_name: 'Doe',
          email: 'test@test.com',
          phone: '+12065551212',
          tortilla: 'Corn',
          rice: 'Brown',
          beans: 'Black',
          filling_id: Filling.first.id,
        },
      }
    end

    assert_redirected_to root_url
  end

  test 'should show order' do
    get order_url(@order)
    assert_response :success
  end

  test 'should get edit' do
    get edit_order_url(@order)
    assert_response :success
  end

  test 'should update order' do
    patch order_url(@order), params: {
      order: {
        first_name: 'Updated',
        toppings: %w[Salsa Lettuce],
      },
    }
    assert_redirected_to orders_url
    @order.reload
    assert_equal('Updated', @order.first_name)
    assert(@order.salsa)
    assert(@order.lettuce)
  end

  test 'should destroy order' do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
