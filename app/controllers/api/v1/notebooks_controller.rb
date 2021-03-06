class Api::V1::NotebooksController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @notebooks = Notebook.active.order(:id)
    render json: @notebooks, each_serializer: NotebookSerializer
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      @notebook.children << Divider.create(name: 'New Divider')
      render json: @notebook, location: api_v1_notebooks_path
    else
      render json: {error: 'Creation failed'}
    end
  end

  def show
    @notebook = Notebook.preload(children: [:notes, {children: [{children: [:children, :notes]}, :notes ] }]).find(params[:id])
    render json: @notebook, serializer: NotebookSerializer
  end

  def update
    @notebook = Notebook.find(params[:id])

    if @notebook.update_attributes(notebook_params)
      render json: @notebook, location: api_v1_notebooks_path
    else
      render json: {error: 'Creation failed'}
    end
  end



  def notebook_params
    params.require(:notebook).permit(:name, :description, :active, :color_hex, :binder_id)
  end
end
