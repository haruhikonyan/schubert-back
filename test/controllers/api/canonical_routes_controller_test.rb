require 'test_helper'

class Api::CanonicalRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canonical_route = canonical_routes(:one)
  end

  test "should get index" do
    get canonical_routes_url, as: :json
    assert_response :success
  end

  test "should create canonical_route" do
    assert_difference('CanonicalRoute.count') do
      post canonical_routes_url, params: { canonical_route: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show canonical_route" do
    get canonical_route_url(@canonical_route), as: :json
    assert_response :success
  end

  test "should update canonical_route" do
    patch canonical_route_url(@canonical_route), params: { canonical_route: {  } }, as: :json
    assert_response 200
  end

  test "should destroy canonical_route" do
    assert_difference('CanonicalRoute.count', -1) do
      delete canonical_route_url(@canonical_route), as: :json
    end

    assert_response 204
  end
end
