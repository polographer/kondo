require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get hello" do
    get welcome_hello_url
    assert_response :success
  end

  test "should get dashboard" do
    sign_in users(:one)
    get welcome_dashboard_url
    assert_response :success
  end

  test "should get status" do
    sign_in users(:one)
    get welcome_status_url
    assert_response :success
  end

  test "should get configuration" do
    sign_in users(:one)
    get welcome_configuration_url
    assert_response :success
  end

  test "should get home" do
    sign_in users(:one)
    get welcome_home_url
    assert_response :success
  end
end
