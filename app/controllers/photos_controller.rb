class PhotosController < ApplicationController

  def new
    @photo = Photo.new
    respond_to do |format|
      format.html
      format.json { render json: @photo }
    end
  end
  
  def create
    @user = current_user
    @photo = @user.photos.create(params[:photo])
    if @photo.save
      redirect_to @photo, notice: "New photo uploaded successfully."
    else
      render "new"
#    respond_to do |format|
#      format.html
#      format.json { render json: @photo }
#      format.js
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @photos = Photo.all
    respond_to do |format|
      format.html
      format.json { render json: @photo }
      format.js
    end
  end

  def index
    @photos = Photo.all
    respond_to do |format|
      format.html
      format.json { render json: @photos }
      format.js
    end
  end

  def all
    @photos = Photo.all
    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
      format.js   { render nothing: true }
    end
  end
end

