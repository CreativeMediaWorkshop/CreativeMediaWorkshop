require 'test_helper'

class MoItemsControllerTest < ActionController::TestCase
  setup do
    @mo_item = mo_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mo_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mo_item" do
    assert_difference('MoItem.count') do
      post :create, mo_item: { author: @mo_item.author, click_times: @mo_item.click_times, description: @mo_item.description, file: @mo_item.file, price: @mo_item.price, subtitle: @mo_item.subtitle, title: @mo_item.title, type: @mo_item.type }
    end

    assert_redirected_to mo_item_path(assigns(:mo_item))
  end

  test "should show mo_item" do
    get :show, id: @mo_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mo_item
    assert_response :success
  end

  test "should update mo_item" do
    patch :update, id: @mo_item, mo_item: { author: @mo_item.author, click_times: @mo_item.click_times, description: @mo_item.description, file: @mo_item.file, price: @mo_item.price, subtitle: @mo_item.subtitle, title: @mo_item.title, type: @mo_item.type }
    assert_redirected_to mo_item_path(assigns(:mo_item))
  end

  test "should destroy mo_item" do
    assert_difference('MoItem.count', -1) do
      delete :destroy, id: @mo_item
    end

    assert_redirected_to mo_items_path
  end
end
