require 'test_helper'

class DrawsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:draws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create draw" do
    assert_difference('Draw.count') do
      post :create, :draw => { }
    end

    assert_redirected_to draw_path(assigns(:draw))
  end

  test "should show draw" do
    get :show, :id => draws(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => draws(:one).to_param
    assert_response :success
  end

  test "should update draw" do
    put :update, :id => draws(:one).to_param, :draw => { }
    assert_redirected_to draw_path(assigns(:draw))
  end

  test "should destroy draw" do
    assert_difference('Draw.count', -1) do
      delete :destroy, :id => draws(:one).to_param
    end

    assert_redirected_to draws_path
  end
end
