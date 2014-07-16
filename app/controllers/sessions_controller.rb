class SessionsController < ApplicationController


  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase).try(:authenticate, params[:session][:password])
    if user
      sign_in user
      if user.admin?
        flash[:success] = "Welcome to Bilden App! Admin #{user.first_name}"
<<<<<<< HEAD
      else
        flash[:success] = "Welcome to Bilden App #{user.first_name}!"
=======
    $user_last_name = @user.last_name
    redirect_to root_path
      elsif user[:type] == 'Student'
        flash[:success] = "Welcome to Bilden App Student #{user.first_name}!"
       redirect_to dash_student_path
>>>>>>> de3bb0aedb6dd15913d554a4ac47e8bd70a2d4eb
      end

      
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
