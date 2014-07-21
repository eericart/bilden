class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper

  protect_from_forgery

    def signed_in_admin
      redirect_to signin_url, info: "Please sign in." unless signed_in?
      redirect_to root_path, status: 401 unless signed_admin?
    end
end
