require "test_helper"

class RevenuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revenues_index_url
    assert_response :success
  end

  test "should get create" do
    get revenues_create_url
    assert_response :success
  end

  test "should get edit" do
    get revenues_edit_url
    assert_response :success
  end

  test "should get update" do
    get revenues_update_url
    assert_response :success
  end

  test "should get destroy" do
    get revenues_destroy_url
    assert_response :success
  end
end
