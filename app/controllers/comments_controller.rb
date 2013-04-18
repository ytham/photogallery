class CommentsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user_or_current_user, only: :destroy

  def create
    @photo = Photo.find(params[:id])
    @comment = current_user.comments.create(params[:comment])
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to photos_path(params[:id]), notice: "Comment failed."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end

end
