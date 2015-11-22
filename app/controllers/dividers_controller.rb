class DividersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @dividera = Divider.active
  end

  def new
    @divider = Divider.new
  end

  def create
    @divider = Divider.new(divider_params)
    if @divider.save
      flash[:success] = 'Notebook created'
      redirect_to :show
    else
      flash[:success] = 'Creation failed'
      redirect_to :show
    end
  end

  def show
    @divider = Divider.find(params[:id])
  end

  def update
    @divider = Divider.find(params[:id])

    if @divider.update_attributes(divider_params)
      flash[:success] = 'Notebook updated'
    else
      flash[:error] = 'Update Failed'
    end

    redirect_to :show
  end



  def divider_params
    params.require(:divider).permit(:name, :description, :active, :notebook_id, :parent_id)
  end
end
