class SessionsController < ApplicationController


  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if user[:type] == 'Admin'
        flash[:success] = "Welcome to Bilden App! Admin"
      elsif user[:type] == 'Student'
        flash[:success] = "Welcome to Bilden App!"
      end
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

 def destroy
    sign_out
    redirect_to root_url
  end
end
