class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.for_user(current_user).all
    @place = Place.new
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params.merge(user: current_user))

    respond_to do |format|
      if @place.save
        format.html { redirect_to places_path, notice: t(:place_created) }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to places_path, notice: t(:place_updated) }
        format.json { render :show, status: :ok, location: @place }
        format.js { render :update }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_path, notice: t(:place_deleted) }
      format.json { head :no_content }
      format.js { render :destroy }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.for_user(current_user).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:name, :icon, :address1, :postalcode, :city, :num_people, :user_id, :persons)
    end
end
