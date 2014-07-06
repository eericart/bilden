class SessionsController < ApplicationController


  def new
  	
  end

  def create
  	user =User.validate_login(
       params[:session][:email],
       params[:session][:password]
  	)

    if user
      session[:user_id] = user.id
       puts user[:type]

      if user[:type] == 'Admin' 
      redirect_to 'sessions/new'
      elsif user[:type] == 'Student' 
      redirect_to :controller => 'users'
      end


     else
     	flash[:status] = FALSE
     	flash[:alert] = 'Invalid'
     	redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path

  end
end
