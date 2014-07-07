class UsersController < ApplicationController

  before_filter :check_login, :only => [:index]

  def index
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = Student.new(user_params)

  	if @user.save
  	   flash[:success] = "Welcome to Bilden App!"
       redirect_to root_path
  	else
  	  redirect_to 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
    end
end
