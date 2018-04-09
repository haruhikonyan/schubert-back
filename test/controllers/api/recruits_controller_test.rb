require 'test_helper'

class Api::RecruitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruit = recruits(:one)
  end

  test "should get index" do
    get recruits_url, as: :json
    assert_response :success
  end

  test "should create recruit" do
    assert_difference('Recruit.count') do
      post recruits_url, params: { recruit: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show recruit" do
    get recruit_url(@recruit), as: :json
    assert_response :success
  end

  test "should update recruit" do
    patch recruit_url(@recruit), params: { recruit: {  } }, as: :json
    assert_response 200
  end

  test "should destroy recruit" do
    assert_difference('Recruit.count', -1) do
      delete recruit_url(@recruit), as: :json
    end

    assert_response 204
  end
end
