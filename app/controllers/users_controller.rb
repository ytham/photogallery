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
      redirect_to root_url, notice: "New user created successfully."
    else
      render "new"
    end
  end

end
