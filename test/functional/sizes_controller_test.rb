require 'test_helper'

class SizesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sizes" do
    assert_difference('Sizes.count') do
      post :create, :sizes => { }
    end

    assert_redirected_to sizes_path(assigns(:sizes))
  end

  test "should show sizes" do
    get :show, :id => sizes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sizes(:one).id
    assert_response :success
  end

  test "should update sizes" do
    put :update, :id => sizes(:one).id, :sizes => { }
    assert_redirected_to sizes_path(assigns(:sizes))
  end

  test "should destroy sizes" do
    assert_difference('Sizes.count', -1) do
      delete :destroy, :id => sizes(:one).id
    end

    assert_redirected_to sizes_path
  end
end
