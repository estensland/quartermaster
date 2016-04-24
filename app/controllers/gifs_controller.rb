class GifsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @gifs = Gif.active
  end

  def new
    @gif = Gif.new
  end

  def create
    Gif.create(gif_params)
    redirect_to action :index
  end

  private

  def gif_params
    params.require(:gif).permit(:name, :url)
  end
end
