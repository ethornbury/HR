class Employees::RequestsController < ApplicationController
  #before_action :set_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @requests = Request.all
    respond_with(@requests)
  end

  def show
    respond_with(@request)
  end

  def new
    @employee = Employee.find(params[:employee_id])
    @request = Request.new
    respond_with(@request)
  end

  def edit
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @request = Request.new(request_params)
    @request.employee = @employee
    
    @request.save
    respond_with(@employee)
  end

  def update
    @request.update(request_params)
    respond_with(@request)
  end

  def destroy
    @request.destroy
    respond_with(@request)
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:description, :startDate, :endDate, :status, :employee_id)
    end
end
