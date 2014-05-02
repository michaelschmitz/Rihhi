require 'test_helper'

class TicketordersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticketorders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticketorder" do
    assert_difference('Ticketorder.count') do
      post :create, :ticketorder => { }
    end

    assert_redirected_to ticketorder_path(assigns(:ticketorder))
  end

  test "should show ticketorder" do
    get :show, :id => ticketorders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ticketorders(:one).to_param
    assert_response :success
  end

  test "should update ticketorder" do
    put :update, :id => ticketorders(:one).to_param, :ticketorder => { }
    assert_redirected_to ticketorder_path(assigns(:ticketorder))
  end

  test "should destroy ticketorder" do
    assert_difference('Ticketorder.count', -1) do
      delete :destroy, :id => ticketorders(:one).to_param
    end

    assert_redirected_to ticketorders_path
  end
end
