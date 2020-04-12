class UsersController < ApplicationController

   before_action :require_user, only: [:edit, :update]
   before_action :require_admin, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulation you have successfully sign up.!"
      redirect_to log_in_path
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
