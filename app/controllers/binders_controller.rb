class BindersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @binders = Binder.active
  end

  def new
    @binder = Binder.new
  end

  def create
    @binder = Binder.new(binder_params)
    if @binder.save
      flash[:success] = 'Binder created'
      redirect_to :show
    else
      flash[:success] = 'Creation failed'
      redirect_to :show
    end
  end

  def show
    @binder = Binder.find(params[:id])
  end

  def update
    @binder = Binder.find(params[:id])

    if @binder.update_attributes(binder_params)
      flash[:success] = 'Binder updated'
    else
      flash[:error] = 'Update Failed'
    end

    redirect_to :show
  end



  def binder_params
    params.require(:binder).permit(:name, :description, :active, :color_hex)
  end
end
