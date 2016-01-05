class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User created!!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid user entry"
      redirect_to signup_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
