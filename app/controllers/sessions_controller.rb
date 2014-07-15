class SessionsController < ApplicationController


  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)., .try(:authenticate, params[:session][:password])
    if user
      sign_in user
      if user[:type] == 'Admin'
        flash[:success] = "Welcome to Bilden App! Admin #{user.first_name}"
    $user_last_name = @user.last_name
      elsif user[:type] == 'Student'
        flash[:success] = "Welcome to Bilden App #{user.first_name}!"
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
