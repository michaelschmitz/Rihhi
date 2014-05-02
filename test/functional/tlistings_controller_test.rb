require 'test_helper'

class TlistingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tlistings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tlisting" do
    assert_difference('Tlisting.count') do
      post :create, :tlisting => { }
    end

    assert_redirected_to tlisting_path(assigns(:tlisting))
  end

  test "should show tlisting" do
    get :show, :id => tlistings(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tlistings(:one).id
    assert_response :success
  end

  test "should update tlisting" do
    put :update, :id => tlistings(:one).id, :tlisting => { }
    assert_redirected_to tlisting_path(assigns(:tlisting))
  end

  test "should destroy tlisting" do
    assert_difference('Tlisting.count', -1) do
      delete :destroy, :id => tlistings(:one).id
    end

    assert_redirected_to tlistings_path
  end
end
