class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # To display notes by users who are unauthenticated
  # Anyone whether signed in or not will be able to see all Notes and 
  # be able to read each Note of any User
  # skip_before_action :authenticate_user!, only: [:index, :show]


  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(notes_params)
    @note.user = current_user
    if @note.save!
      redirect_to authenticated_root_path, notice: "Note sucessfully created."
    else
      render :new
    end
  end
  
  def index
    @notes = Note.where(user: current_user).paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
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
    params.require(:note).permit(:title, :content, :photo)
  end
end
