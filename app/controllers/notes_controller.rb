class NoteController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @notes = Note.active
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = 'Note created'
      redirect_to :show
    else
      flash[:success] = 'Creation failed'
      redirect_to :show
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(note_params)
      flash[:success] = 'Note updated'
    else
      flash[:error] = 'Update Failed'
    end

    redirect_to :show
  end


  private

  def note_params
    params.require(:note).permit(:name, :description, :active, :color_hex)
  end
end
