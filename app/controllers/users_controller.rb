class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = Student.new(user_params)

    if @user.save
      sign_in @user
      redirect_to signup_step2_path, success: 'Welcome to Bilden App!'
    else
      redirect_to users_new_path, errors: @user.errors
    end

  end

  def record
     @user= current_user
     @user.subject_ids= params[:subject_ids]
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation,:career_id, :extra_credits)

    end
end
