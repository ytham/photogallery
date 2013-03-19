class PhotosController < ApplicationController

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  def index
    @photos = Photos.all
  end

end
