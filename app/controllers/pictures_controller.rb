class PicturesController < ApplicationController
  def destroy
    @picture = Picture.find(params[:id])
    Picture.destroy(@picture[:id])
    respond_to do |format|
        format.js
      end
  end
end
