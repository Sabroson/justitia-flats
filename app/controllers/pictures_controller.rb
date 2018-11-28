class PicturesController < ApplicationController
  def destroy
    @picture = Picture.find(params[:id])
    Picture.destroy(@picture[:id])
  end
end
