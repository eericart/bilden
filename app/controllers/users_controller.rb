class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = Student.new(user_params)

    if @user.save
      sign_in @user
      redirect_to root_path,success: 'Welcome to Bilden App!'
    else
      redirect_to 'new', errors
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation,:career_code, :extra_credits)
    end
end
