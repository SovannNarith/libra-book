class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulation you have successfully sign up.!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Error information please try again!"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:info] = "User not found!"
    redirect_to new_user_path
  end

  def index
    @users = User.all
  end

  def edit

  end

  def update

  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :lastname, :email, :phone_number, :password)
    end


end
