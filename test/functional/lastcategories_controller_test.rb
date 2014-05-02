require 'test_helper'

class LastcategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lastcategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lastcategory" do
    assert_difference('Lastcategory.count') do
      post :create, :lastcategory => { }
    end

    assert_redirected_to lastcategory_path(assigns(:lastcategory))
  end

  test "should show lastcategory" do
    get :show, :id => lastcategories(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lastcategories(:one).id
    assert_response :success
  end

  test "should update lastcategory" do
    put :update, :id => lastcategories(:one).id, :lastcategory => { }
    assert_redirected_to lastcategory_path(assigns(:lastcategory))
  end

  test "should destroy lastcategory" do
    assert_difference('Lastcategory.count', -1) do
      delete :destroy, :id => lastcategories(:one).id
    end

    assert_redirected_to lastcategories_path
  end
end
