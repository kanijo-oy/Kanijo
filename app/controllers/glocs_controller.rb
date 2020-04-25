class GlocsController < ApplicationController
  def create
    @gloc = Gloc.new(params.require(:gloc).permit(uploads: []).merge(user: current_user))

    respond_to do |format|
      if @gloc.save
        notice = t(:import_ok)
        notice = @gloc.errors.to_a.join("\n") unless @gloc.errors.empty?
        format.html { redirect_to root_path, notice: notice }
        format.json { render :show, status: :created, location: @log_entry }
      else
        format.html { render :new }
        format.json { render json: @log_entry.errors, status: :unprocessable_entity }
      end
    end
  end
end
