require 'test_helper'

class RequestAllsControllerTest < ActionController::TestCase
  setup do
    @request_all = request_alls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_alls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_all" do
    assert_difference('RequestAll.count') do
      post :create, request_all: { endDate: @request_all.endDate, startDate: @request_all.startDate, status: @request_all.status, type: @request_all.type }
    end

    assert_redirected_to request_all_path(assigns(:request_all))
  end

  test "should show request_all" do
    get :show, id: @request_all
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_all
    assert_response :success
  end

  test "should update request_all" do
    patch :update, id: @request_all, request_all: { endDate: @request_all.endDate, startDate: @request_all.startDate, status: @request_all.status, type: @request_all.type }
    assert_redirected_to request_all_path(assigns(:request_all))
  end

  test "should destroy request_all" do
    assert_difference('RequestAll.count', -1) do
      delete :destroy, id: @request_all
    end

    assert_redirected_to request_alls_path
  end
end
