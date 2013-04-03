class UsersController < ApplicationController

  def index
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "New user created successfully."
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @photo_list = Photo.find_all_by_user_id(@user.id)
    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end

  def upload_avatar
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: "User data updated successfully."
    else
      render @user, notice: "Avatar upload failed."
    end
  end
  
  def destroy
    # Need to implement
  end

end
