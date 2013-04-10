class CommentsController < ApplicationController
  before_filter :signed_in_user

  def create
    @comment = current_user.comments.create(params[:comment])
    if @comment.save
      redirect_to photos_path(params[:id]), notice: "Comment created!"
    else
      redirect_to photos_path(params[:id]), notice: "Comment failed."
    end
  end

  def destroy
  end

end
