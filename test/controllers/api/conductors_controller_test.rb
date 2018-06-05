require 'test_helper'

class Api::ConductorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conductor = conductors(:one)
  end

  test "should get index" do
    get conductors_url, as: :json
    assert_response :success
  end

  test "should create conductor" do
    assert_difference('Conductor.count') do
      post conductors_url, params: { conductor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show conductor" do
    get conductor_url(@conductor), as: :json
    assert_response :success
  end

  test "should update conductor" do
    patch conductor_url(@conductor), params: { conductor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy conductor" do
    assert_difference('Conductor.count', -1) do
      delete conductor_url(@conductor), as: :json
    end

    assert_response 204
  end
end
