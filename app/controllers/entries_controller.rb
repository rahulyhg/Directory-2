class EntriesController < ApplicationController

  def create
    @entry = Entry.new(user_params)

    if @entry.save
      redirect_to @entry
    else
      render new_entry_path
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def index
    @entries = Entry.all
  end

  private
    def user_params
      params.require(:entry).permit(:name, :batch_number, :phone_number)
    end
end