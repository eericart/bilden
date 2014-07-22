class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase).try(:authenticate, params[:session][:password])
    if user
      sign_in user
      if user.admin?
        redirect_back_or root_url
      else
       redirect_back_or user
      end
    else
      render 'new', danger: 'Invalid email/password combination'
    end
  end

 def destroy
    sign_out
    redirect_to root_url
  end
end
