class UsersController < ApplicationController
  def new
    @user = User.new  
  end

  def create
    @user = User.new(safe_params)
    if @user.save
      flash[:success] = "You have successfuly signup! Welcome to the site."
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  
  def safe_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
