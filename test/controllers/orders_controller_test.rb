require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = create(:order_with_filling)
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
          name_first: 'Jane',
          name_last: 'Doe',
          email: 'test@test.com',
          phone: '+12065551212',
          favorite_color: 'Red',
        },
      }
    end

    assert_redirected_to root_url
  end

  test 'should create order with ingredients' do
    assert_difference('Order.count') do
      post orders_url, params: {
        order: {
          name_first: 'Jane',
          name_last: 'Doe',
          email: 'test@test.com',
          phone: '+12065551212',
          tortilla: 'Corn',
          rice: 'Brown',
          beans: 'Black',
        },
      }
    end

    assert_redirected_to root_url
  end

  test 'should create order with filling' do
    assert_difference('Order.count') do
      post orders_url, params: {
        order: {
          name_first: 'Jane',
          name_last: 'Doe',
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

  test 'should create order with delivery' do
    assert_difference('Order.count') do
      post orders_url, params: {
        order: {
          name_first: 'Jane',
          name_last: 'Doe',
          email: 'test@test.com',
          phone: '+12065551212',
          tortilla: 'Corn',
          rice: 'Brown',
          beans: 'Black',
          filling_id: Filling.first.id,
          delivery: 'true',
          delivery_street1: '111 Main Street',
          delivery_city: 'Seattle',
          delivery_state: 'WA',
          delivery_zip: '98101',
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
        name_first: 'Updated',
        toppings: %w[Salsa Lettuce],
      },
    }
    assert_redirected_to orders_url
    @order.reload
    assert_equal('Updated', @order.name_first)
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
