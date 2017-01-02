class Api::V1::ShelvesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    ActiveModelSerializers.config.adapter = :json
    @shelves = Shelf.active.order(:name)
    render json: @shelves, each_serializer: ShelfSerializer
  end

  def create
    @shelf = Shelf.new(shelf_params)
    if @shelf.save
      render json: @shelf, serializer: ShelfSerializer
    else
      render json: {error: 'Creation failed'}
    end
  end

  def show
    @shelf = Shelf.find(params[:id])
    render json: @shelf, serializer: ShelfSerializer
  end

  def update
    @shelf = Shelf.find(params[:id])

    if @shelf.update_attributes(shelf_params)
      render json: @shelf, location: api_v1_shelf_path
    else
      render json: {error: 'Creation failed'}
    end
  end



  def shelf_params
    params.require(:shelf).permit(:name, :description, :active)
  end
end
