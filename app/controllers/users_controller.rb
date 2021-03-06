class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_parmas)
    if @user.save
      flash[:success] = "Welcome to Alpha-Blog #{@user.username}"
      redirect_to articles_path
    else
    render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_parmas)
      flash[:success] = "Your account has updated successfully!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_parmas
    params.require(:user).permit(:username, :email, :password)
  end

end
