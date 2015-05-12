class RequestTypesController < ApplicationController
  before_action :set_request_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @request_types = RequestType.all
    respond_with(@request_types)
  end

  def show
    respond_with(@request_type)
  end

  def new
    @request_type = RequestType.new
    respond_with(@request_type)
  end

  def edit
  end

  def create
    @request_type = RequestType.new(request_type_params)
    @request_type.save
    respond_with(@request_type)
  end

  def update
    @request_type.update(request_type_params)
    respond_with(@request_type)
  end

  def destroy
    @request_type.destroy
    respond_with(@request_type)
  end

  private
    def set_request_type
      @request_type = RequestType.find(params[:id])
    end

    def request_type_params
      params.require(:request_type).permit(:description)
    end
end
