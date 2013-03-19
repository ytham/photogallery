class PhotosController < ApplicationController

  def new
    @photo = Photo.new
    respond_to do |format|
      format.html
      format.json { render json: @photo }
    end
  end

  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @photo }
    end
  end

  def index
    @photos = Photo.all
    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

