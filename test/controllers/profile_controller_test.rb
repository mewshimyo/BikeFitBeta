require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get blank" do
    get :blank
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
