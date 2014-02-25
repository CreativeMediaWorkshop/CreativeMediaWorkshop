require 'test_helper'

class MoSiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get special" do
    get :special
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

end
