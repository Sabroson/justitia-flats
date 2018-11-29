class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    @flats_markers = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats_markers.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
    @markers = [{
            lng: @flat.longitude,
            lat: @flat.latitude
          }]
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
      user_as_host!(@flat.user)
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @created_pictures = params["flat"]["pictures"]
    if @flat.update(flat_params)
      @created_pictures.each do |key, value|
        unless key.include? "cache"
          create_picture(key, value)
        end
      end
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    Flat.destroy(@flat[:id])
  end

  private

  def user_as_host!(user)
    user.is_host = true
    user.save
  end

  def create_picture(_key, value)
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
    params.require(:flat).permit(:name, :address, :latitude, :longitude, :description, :price_per_night, :number_of_guests, :pictures)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
