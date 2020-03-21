class GlocsController < ApplicationController
  def create
    @gloc = Gloc.new(params.require(:gloc).permit(uploads: []).merge(user: current_user))

    respond_to do |format|
      if @gloc.save
        # format.html { redirect_to @log_entry, notice: 'Log entry was successfully created.' }
        format.html { redirect_to root_path, notice: 'Log entry was successfully created.' }
        format.json { render :show, status: :created, location: @log_entry }
      else
        format.html { render :new }
        format.json { render json: @log_entry.errors, status: :unprocessable_entity }
      end
    end
  end
end
