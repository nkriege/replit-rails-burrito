require 'test_helper'

class FillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filling = create(:filling)
  end

  test 'should get index' do
    get fillings_url
    assert_response :success
  end

  test 'should get new' do
    get new_filling_url
    assert_response :success
  end

  test 'should create filling' do
    assert_difference('Filling.count') do
      post fillings_url, params: {
        filling: {
          name: 'New filling',
          description: 'Delicious new filling',
          price: 1.23,
          calories: 100,
        },
      }
    end

    assert_redirected_to fillings_url
  end

  test 'should show filling' do
    get filling_url(@filling)
    assert_response :success
  end

  test 'should get edit' do
    get edit_filling_url(@filling)
    assert_response :success
  end

  test 'should update filling' do
    patch filling_url(@filling), params: {
      filling: {
        name: 'Updated name',
        price: 2.22,
      },
    }

    assert_redirected_to fillings_url

    @filling.reload
    assert_equal('Updated name', @filling.name)
    assert_equal(2.22, @filling.price)
  end

  test 'should destroy filling' do
    assert_difference('Filling.count', -1) do
      delete filling_url(@filling)
    end

    assert_redirected_to fillings_url
  end
end
