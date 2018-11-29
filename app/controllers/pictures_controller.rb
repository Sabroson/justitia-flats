class PicturesController < ApplicationController
  before_action :set_picture, only: [:make_primary, :destroy]

  def make_primary
    @flat = @picture.flat

    @flat_pictures = @flat.pictures

    @flat_pictures.each do |picture|
      picture.is_primary = false
      picture.save
    end

    @picture.is_primary = true
    @picture.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    Picture.destroy(@picture[:id])
    respond_to do |format|
      format.js
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
