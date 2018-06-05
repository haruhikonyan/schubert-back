require 'test_helper'

class Api::SolistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solist = solists(:one)
  end

  test "should get index" do
    get solists_url, as: :json
    assert_response :success
  end

  test "should create solist" do
    assert_difference('Solist.count') do
      post solists_url, params: { solist: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show solist" do
    get solist_url(@solist), as: :json
    assert_response :success
  end

  test "should update solist" do
    patch solist_url(@solist), params: { solist: {  } }, as: :json
    assert_response 200
  end

  test "should destroy solist" do
    assert_difference('Solist.count', -1) do
      delete solist_url(@solist), as: :json
    end

    assert_response 204
  end
end
