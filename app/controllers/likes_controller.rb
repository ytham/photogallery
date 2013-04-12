class LikesController < ApplicationController
  before_filter :signed_in_user

  def create
    @photo = Photo.find(params[:id])
    @user_likes = Like.where(photo_id: @photo.id)
    @like = current_user.likes.create(user_id: current_user.id, photo_id: params[:id])
    if @like.save
      respond_to do |format|
        format.js
      end
      #redirect_to photo_path(params[:id]), notice: "Photo Liked Successfully!"
    else
      redirect_to photo_path(params[:id]), notice: "Like Failed!"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @user_likes = Like.where(photo_id: @photo.id)
    @like = current_user.likes.find_by_user_id_and_photo_id(current_user.id, params[:id])
    if @like.destroy
      respond_to do |format|
        format.js
      end
      #redirect_to photo_path(params[:id]), notice: "Photo Unliked Successfully!"
    else
      redirect_to photo_path(params[:id]), notice: "Unlike Failed!"
    end
  end

end
