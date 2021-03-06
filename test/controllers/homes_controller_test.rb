require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get homes_homepage_url
    assert_response :success
  end

  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end
end
