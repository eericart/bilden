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
  	  flash[:status] = TRUE
  	  flash[:alter] = 'YEI'
  	 else
  	  flash[:status] = FALSE
  	  flash[:alter] = @user.errors.full_messages
  	  end
  	  
  	  redirect_to register_path
  end

  def user_params
      params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
    end
end
