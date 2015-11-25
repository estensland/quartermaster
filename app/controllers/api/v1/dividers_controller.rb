class Api::V1::DividersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    notebook = Notebook.find(params[:notebook_id])
    @dividers = Divider.active.where(parent: notebook)
    render json: Divider.active, each_serializer: DividerSerializer
  end

  def new
    render json: Divider.new, serializer: DividerSerializer
  end

  def create
    @divider = Divider.new(divider_params)
    if @divider.save
      render json: @divider, location: api_v1_dividers_path
    else
      render json: {error: 'Creation Failed'}
    end
  end

  def show
    render json: Divider.find(params[:id]), serializer: DividerSerializer
  end

  def update
    @divider = Divider.find(params[:id])

    if @divider.update_attributes(divider_params)
      render json: @divider, location: api_v1_dividers_path
    else
      render json: {error: 'Creation Failed'}
    end

    redirect_to :show
  end



  def divider_params
    params.require(:divider).permit(:name, :description, :active, :parent_id)
  end
end
