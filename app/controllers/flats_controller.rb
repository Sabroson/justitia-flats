class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @created_pictures = params["flat"]["pictures"]
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :pictures)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
