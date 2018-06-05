require 'test_helper'

class Api::TunesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tune = tunes(:one)
  end

  test "should get index" do
    get tunes_url, as: :json
    assert_response :success
  end

  test "should create tune" do
    assert_difference('Tune.count') do
      post tunes_url, params: { tune: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show tune" do
    get tune_url(@tune), as: :json
    assert_response :success
  end

  test "should update tune" do
    patch tune_url(@tune), params: { tune: {  } }, as: :json
    assert_response 200
  end

  test "should destroy tune" do
    assert_difference('Tune.count', -1) do
      delete tune_url(@tune), as: :json
    end

    assert_response 204
  end
end
