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
  #  @child = Child.find(params[:id])
  #  @child = @parent.children.find(params[:id])
    @request = Request.find(params[:id])
    @request = @employee.request.find(params[:id])
  
  end

  def create
    flash.clear
    @employee = Employee.find(params[:employee_id])
    @request = Request.new(request_params)
    @request.employee = @employee
    
    if @request.save
      flash.now[:notice] = "Request has been updated successfully." 
      respond_with(@employee)
    else
     flash.now[:error] = "There was a problem with that request"
     render :edit
    end
  end

  def update
    # @child = Child.find(params[:id])
    # @child = @parent.children.find(params[:id])
    # @child.update_attributes(params[:child])
     
    #@request = Request.find(params[:id])
    #@request = @employee.request.find(params[:id])
    #@request.update_attributes(params[:request])
    @request.update(request_params)
    respond_with(@request)
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @request = Request.find(params[:id])
    title = @request.request_desc
    
    if @request.destroy
      flash[:notice] = "#{title} has been deleted successfully."
      respond_with(@employee)
    else
      flash[:error] = "There was a problem with deleting that request"
      render :show
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:startDate, :endDate, :status, :employee_id, :request_desc, :request_type_id)
    end
end
