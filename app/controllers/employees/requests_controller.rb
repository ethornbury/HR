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
    title = @request.request_desc
    
    if @request.save
      flash[:success] = "Your request for #{title} was saved successfully."
      respond_with(@employee)
    else
      flash[:error] = "There was an error creating your Request."
      render :show
    end
  end

  def update
    #@request.update(request_params)
    #respond_with(@request)
     
    @request = Request.find(params[:id])
    if @request.update_attributes(request_params)
      flash[:success] = "Request updated"
      respond_with(@request)
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:employee_id])
    @request = Request.find(params[:id])
    
    if @request.destroy
      flash[:notice] = "Your request was deleted successfully."
    
    # @request.destroy
      respond_with(@employee)
    else 
      flash[:error] = "There was an error deleting your Request."
      render :show
      
    end
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:description, :startDate, :endDate, :status, :employee_id)
    end
end
