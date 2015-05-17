class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @employees = Employee.all
    
    respond_to do |format|
      format.html
      format.csv { render text: @employees.to_csv }
    end
    #respond_with(@employees)
    
    #@employees = Employee.paginate(page: params[:page])
  end

  def show
   
    @employee = Employee.find(params[:id])
    @requests = @employee.requests    #call all relates requests
    
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
    @employee.update(employee_params)
    respond_with(@employee)
  end

  def destroy
    @employee.destroy
    respond_with(@employee)
  end
  
  def import
    begin 
      Employee.import(params[:file])
      redirect_to employees_path, flash[:notice] = "Employees added successully"
     rescue
      redirect_to employees_path, flash[:notice] = "Invalid import, check your CSV file."
    end  
  end
  
  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:firstname, :lastname, :leaveAllowance, :jobType, :admin)
    end
end
