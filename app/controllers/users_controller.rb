class UsersController < ApplicationController

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

  private
  def user_parmas
    params.require(:user).permit(:username, :email, :password)
  end

end
