class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  #before_filter :admin_user,     only: :destroy
  
  respond_to :html

  def index
    if params[:search]
      @employees = Employee.search(params[:search]).order("lastname ASC")
    else
      @employees = Employee.all.order("lastname ASC")
    end
    
    respond_to do |format|
      format.html
      format.csv { render text: @employees.to_csv }
    end
    
    #respond_with(@employees)
    #@employees = Employee.paginate(page: params[:page])
  end

  def show
    @employee = Employee.find(params[:id])
    @requests = @employee.requests    #call all related requests
    respond_with(@employee)
  end

  def new
    @employee = Employee.new
    respond_with(@employee)
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    respond_with(@employee)
  end

  def update
    flash.clear
    if @employee.update(employee_params)
      flash[:notice] = "Profile has been updated successfully."
      respond_with(@employee)
    else
      flash[:error] = "There was a problem with that request"
      render :edit
    end
  end

  def destroy
    flash.clear
    if @employee.destroy
      flash[:notice] = "Deleted successfully."
      respond_with(@employee)
    else
      flash[:error] = "There was a problem with that request"
      render :show
    end
  end
  
  def import
    flash.clear
    begin 
      Employee.import(params[:file])
      redirect_to employees_path, flash[:notice] = "Employees added successully"
    rescue
      redirect_to employees_path, flash[:danger] = "Invalid import, check your CSV file."
    end  
  end
  
   
  
  private
    def admin_user  #Confirms an admin user.
      redirect_to(root_url) unless current_user.admin?
    end
    
    def admin?
      admin
    end 
    
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:firstname, :lastname, :leaveAllowance, :jobType, :admin, :email)
    end
end
