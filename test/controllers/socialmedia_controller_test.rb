require "test_helper"

class SocialmediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @socialmedia = socialmedia(:one)
  end

  test "should get index" do
    get socialmedia_index_url
    assert_response :success
  end

  test "should get new" do
    get new_socialmedia_url
    assert_response :success
  end

  test "should create socialmedia" do
    assert_difference("Socialmedia.count") do
      post socialmedia_index_url, params: { socialmedia: { name: @socialmedia.name } }
    end

    assert_redirected_to socialmedia_url(Socialmedia.last)
  end

  test "should show socialmedia" do
    get socialmedia_url(@socialmedia)
    assert_response :success
  end

  test "should get edit" do
    get edit_socialmedia_url(@socialmedia)
    assert_response :success
  end

  test "should update socialmedia" do
    patch socialmedia_url(@socialmedia), params: { socialmedia: { name: @socialmedia.name } }
    assert_redirected_to socialmedia_url(@socialmedia)
  end

  test "should destroy socialmedia" do
    assert_difference("Socialmedia.count", -1) do
      delete socialmedia_url(@socialmedia)
    end

    assert_redirected_to socialmedia_index_url
  end
end
