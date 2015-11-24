class NotebooksController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render json: Notebook.active, each_serializer: NotebookSerializer
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      flash[:success] = 'Notebook created'
      redirect_to :show
    else
      flash[:success] = 'Creation failed'
      render json: @notebook, location: api_v1_notebooks_path
    end
  end

  def show
    @notebook = Notebook.find(params[:id])
    render json: @notebook, serializer: NotebookSerializer
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
