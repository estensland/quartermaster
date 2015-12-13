class Api::V1::NotesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @notes = Note.active
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note, serializer: NoteSerializer
    else
      render json: {error: 'Creation failed'}
    end
  end

  def show
    @note = Note.find(params[:id])
    render json: @note, serializer: NoteSerializer
  end

  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(note_params)
      render json: @note, serializer: NoteSerializer
    else
      render json: {error: 'Creation failed'}
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      render json: {ok: 'ok'}
    else
      render json: {error: 'Deletion failed'}
    end

  end


  private

  def note_params
    params.require(:note).permit(:order, :body, :active, :divider_id, hstore: [:x, :y, :width])
  end
end
