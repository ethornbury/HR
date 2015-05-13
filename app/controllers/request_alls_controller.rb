class RequestAllsController < ApplicationController
  before_action :set_request_all, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @request_alls = RequestAll.all
    respond_with(@request_alls)
  end

  def show
    respond_with(@request_all)
  end

  def new
    @request_all = RequestAll.new
    respond_with(@request_all)
  end

  def edit
  end

  def create
    @request_all = RequestAll.new(request_all_params)
    @request_all.save
    respond_with(@request_all)
  end

  def update
    @request_all.update(request_all_params)
    respond_with(@request_all)
  end

  def destroy
    @request_all.destroy
    respond_with(@request_all)
  end

  private
    def set_request_all
      @request_all = RequestAll.find(params[:id])
    end

    def request_all_params
      params.require(:request_all).permit(:type, :startDate, :endDate, :status)
    end
end
