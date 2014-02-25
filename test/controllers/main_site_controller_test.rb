require 'test_helper'

class MainSiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get dept" do
    get :dept
    assert_response :success
  end

  test "should get overview" do
    get :overview
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
