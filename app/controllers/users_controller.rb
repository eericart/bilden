class UsersController < ApplicationController

<<<<<<< HEAD
=======

>>>>>>> de3bb0aedb6dd15913d554a4ac47e8bd70a2d4eb
  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = Student.new(user_params)

    if @user.save
      flash[:success] = 'Welcome to Bilden App!'
      sign_in @user
      redirect_to root_path

     else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path

      end

  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation,:career_code, :extra_credits)

    end
end
