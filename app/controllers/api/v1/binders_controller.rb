class Api::V1::BindersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    ActiveModelSerializers.config.adapter = :json
    @binders = Binder.active.order(:id)
    render json: @binders, each_serializer: BinderSerializer
  end

  def create
    @binder = Binder.new(binder_params)
    if @binder.save
      render json: @binder, serializer: BinderSerializer
    else
      render json: {error: 'Creation failed'}
    end
  end

  def show
    @binder = Binder.find(params[:id])
    render json: @binder, serializer: BinderSerializer
  end

  def update
    @binder = Binder.find(params[:id])

    if @binder.update_attributes(binder_params)
      render json: @binder, location: api_v1_binder_path
    else
      render json: {error: 'Creation failed'}
    end
  end



  def binder_params
    params.require(:binder).permit(:name, :description, :active, :color_hex, :shelf_id)
  end
end
