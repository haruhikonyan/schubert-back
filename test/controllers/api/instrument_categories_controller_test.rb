require 'test_helper'

class Api::InstrumentCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instrument_category = instrument_categories(:one)
  end

  test "should get index" do
    get instrument_categories_url, as: :json
    assert_response :success
  end

  test "should create instrument_category" do
    assert_difference('InstrumentCategory.count') do
      post instrument_categories_url, params: { instrument_category: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show instrument_category" do
    get instrument_category_url(@instrument_category), as: :json
    assert_response :success
  end

  test "should update instrument_category" do
    patch instrument_category_url(@instrument_category), params: { instrument_category: {  } }, as: :json
    assert_response 200
  end

  test "should destroy instrument_category" do
    assert_difference('InstrumentCategory.count', -1) do
      delete instrument_category_url(@instrument_category), as: :json
    end

    assert_response 204
  end
end
