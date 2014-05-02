require 'test_helper'

class HeartedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hearteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hearted" do
    assert_difference('Hearted.count') do
      post :create, :hearted => { }
    end

    assert_redirected_to hearted_path(assigns(:hearted))
  end

  test "should show hearted" do
    get :show, :id => hearteds(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hearteds(:one).id
    assert_response :success
  end

  test "should update hearted" do
    put :update, :id => hearteds(:one).id, :hearted => { }
    assert_redirected_to hearted_path(assigns(:hearted))
  end

  test "should destroy hearted" do
    assert_difference('Hearted.count', -1) do
      delete :destroy, :id => hearteds(:one).id
    end

    assert_redirected_to hearteds_path
  end
end
