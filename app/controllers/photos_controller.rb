class PhotosController < ApplicationController
  before_filter :admin_user_or_current_user, only: :destroy

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
      redirect_to @photo
    else
      render "new"
#    respond_to do |format|
#      format.html
#      format.json { render json: @photo }
#      format.js
    end
  end

  def show
    @photos = Photo.all
    @photo = Photo.find(params[:id])
    #@user_likes = user_likes(@photo.id)
    if @photo.present?
      @user_likes = Like.where(photo_id: @photo.id)
    end
    respond_to do |format|
      format.html
      format.json { render json: @photo }
      format.js
    end
  end

  def index
    @photos = Photo.all
    @photo = Photo.last
    #@user_likes = user_likes(@photo.id)
    if @photo.present?
      @user_likes = Like.where(photo_id: @photo.id)
    end
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
    #@photo = current_user.photos.find(params[:id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
      format.js   
    end
  end

  private

    def user_likes(photo_id)
      likes = Like.find_all_by_photo_id(photo_id)
      user_array = []
      if !likes.blank?
        likes.each do |l|
          user_array.push(l.user)
        end
      end
      return user_array
    end

end
