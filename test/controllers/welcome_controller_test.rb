require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get welcome_hello_url
    assert_response :success
  end

  test "should get dashboard" do
    get welcome_dashboard_url
    assert_response :success
  end

  test "should get status" do
    get welcome_status_url
    assert_response :success
  end

  test "should get configuration" do
    get welcome_configuration_url
    assert_response :success
  end

  test "should get home" do
    get welcome_home_url
    assert_response :success
  end
end
