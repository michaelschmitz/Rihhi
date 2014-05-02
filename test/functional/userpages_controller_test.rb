require 'test_helper'

class UserpagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userpage" do
    assert_difference('Userpage.count') do
      post :create, :userpage => { }
    end

    assert_redirected_to userpage_path(assigns(:userpage))
  end

  test "should show userpage" do
    get :show, :id => userpages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => userpages(:one).to_param
    assert_response :success
  end

  test "should update userpage" do
    put :update, :id => userpages(:one).to_param, :userpage => { }
    assert_redirected_to userpage_path(assigns(:userpage))
  end

  test "should destroy userpage" do
    assert_difference('Userpage.count', -1) do
      delete :destroy, :id => userpages(:one).to_param
    end

    assert_redirected_to userpages_path
  end
end
