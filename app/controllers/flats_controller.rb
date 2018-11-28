class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
    @marker = {
        lng: @flat.longitude,
        lat: @flat.latitude
      }
  end

  def create
    @created_pictures = params["flat"]["pictures"]
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      if @created_pictures["picture"] || @created_pictures["picture0"]
        @created_pictures.each do |key, value|
          unless key.include? "cache"
            create_picture(key, value)
          end
        end
        set_primary_picture
      end

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def create_picture(key, value)
    picture = Picture.new(url: value)
    picture.flat = @flat
    picture.save
  end

  def set_primary_picture
    first_picture = @flat.pictures.first
    first_picture.is_primary = true
    first_picture.save
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :pictures)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
