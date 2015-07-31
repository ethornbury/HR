require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    sign_in users(:one)
    @employee = employees(:one)
  end
  
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { admin: @employee.admin, firstname: @employee.firstname, jobType: @employee.jobType, lastname: @employee.lastname, leaveAllowance: @employee.leaveAllowance }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { admin: @employee.admin, firstname: @employee.firstname, jobType: @employee.jobType, lastname: @employee.lastname, leaveAllowance: @employee.leaveAllowance }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
