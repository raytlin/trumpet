require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

end
