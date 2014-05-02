require 'test_helper'

class FlaggedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flaggeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flagged" do
    assert_difference('Flagged.count') do
      post :create, :flagged => { }
    end

    assert_redirected_to flagged_path(assigns(:flagged))
  end

  test "should show flagged" do
    get :show, :id => flaggeds(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => flaggeds(:one).id
    assert_response :success
  end

  test "should update flagged" do
    put :update, :id => flaggeds(:one).id, :flagged => { }
    assert_redirected_to flagged_path(assigns(:flagged))
  end

  test "should destroy flagged" do
    assert_difference('Flagged.count', -1) do
      delete :destroy, :id => flaggeds(:one).id
    end

    assert_redirected_to flaggeds_path
  end
end
