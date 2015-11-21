class NotebookController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @notebooks = Notebook.active
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      flash[:success] = 'Notebook created'
      redirect_to :show
    else
      flash[:success] = 'Creation failed'
      redirect_to :show
    end
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:id])

    if @notebook.update_attributes(notebook_params)
      flash[:success] = 'Notebook updated'
    else
      flash[:error] = 'Update Failed'
    end

    redirect_to :show
  end



  def notebook_params
    params.require(:notebook).permit(:name, :description, :active, :color_hex)
  end
end
