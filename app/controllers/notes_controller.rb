class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(notes_params)
    @note.user = current_user
    if @note.save!
      redirect_to note_path(@note), notice: "Note sucessfully created."
    else
      render :new
    end
  end
  
  def index
    if(params[:query])
      @notes = Note.search_by_title_and_content_and_location(params[:query]).paginate(page: params[:page], per_page: 3).where(user: current_user)
    else
      @notes = Note.where(user: current_user).order("created_at DESC").paginate(page: params[:page], per_page: 3)
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @note.update(notes_params)
      redirect_to authenticated_root_path, notice: "Note sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to authenticated_root_path, notice: "Note sucessfully deleted."
  end


  private

  def find_note
    @note = Note.find(params[:id])
  end

  def notes_params
    params.require(:note).permit(:title, :content, :location, :photo)
  end
end
