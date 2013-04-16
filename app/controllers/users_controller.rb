class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :admin_user, only: [:index, :destroy]

  def index
    redirect_to root_url unless current_user.admin?
    @users = User.all
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
    @photo_list = Photo.where(user_id: @user.id)
    @liked_photos = @user.likes.all #liked_photos(@user.id)
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: "User data updated successfully."
    else
      render @user, notice: "User data update failed."
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def liked_photos(user_id)
      likes_list = Like.find_all_by_user_id(user_id)
      likes_array = []
      if !likes_list.blank?
        likes_list.each do |l|
          likes_array.push(l.photo)
        end
      end
      return likes_array
    end

end
