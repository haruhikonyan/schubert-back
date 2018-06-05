require 'test_helper'

class Api::RepertoiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repertoire = repertoires(:one)
  end

  test "should get index" do
    get repertoires_url, as: :json
    assert_response :success
  end

  test "should create repertoire" do
    assert_difference('Repertoire.count') do
      post repertoires_url, params: { repertoire: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show repertoire" do
    get repertoire_url(@repertoire), as: :json
    assert_response :success
  end

  test "should update repertoire" do
    patch repertoire_url(@repertoire), params: { repertoire: {  } }, as: :json
    assert_response 200
  end

  test "should destroy repertoire" do
    assert_difference('Repertoire.count', -1) do
      delete repertoire_url(@repertoire), as: :json
    end

    assert_response 204
  end
end
