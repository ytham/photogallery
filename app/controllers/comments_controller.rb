class CommentsController < ApplicationController
  before_filter :signed_in_user

  def create
    @photo = Photo.find(params[:id])
    @comment = current_user.comments.create(params[:comment])
    if @comment.save
      respond_to do |format|
        format.js
      end
      #redirect_to photos_path(params[:id]), notice: "Comment created!"
    else
      redirect_to photos_path(params[:id]), notice: "Comment failed."
    end
  end

  def destroy
  end

end
