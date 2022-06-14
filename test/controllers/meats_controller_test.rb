require 'test_helper'

class MeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meat = create(:meat)
  end

  test 'should get index' do
    get meats_url
    assert_response :success
  end

  test 'should get new' do
    get new_meat_url
    assert_response :success
  end

  test 'should create meat' do
    assert_difference('Meat.count') do
      post meats_url, params: {
        meat: {
          name: 'New meat',
          description: 'Delicious new meat',
          price: 1.23,
          calories: 100,
        },
      }
    end

    assert_redirected_to meats_url
  end

  test 'should show meat' do
    get meat_url(@meat)
    assert_response :success
  end

  test 'should get edit' do
    get edit_meat_url(@meat)
    assert_response :success
  end

  test 'should update meat' do
    patch meat_url(@meat), params: {
      meat: {
        name: 'Updated name',
        price: 2.22,
      },
    }

    assert_redirected_to meats_url

    @meat.reload
    assert_equal('Updated name', @meat.name)
    assert_equal(2.22, @meat.price)
  end

  test 'should destroy meat' do
    assert_difference('Meat.count', -1) do
      delete meat_url(@meat)
    end

    assert_redirected_to meats_url
  end
end
