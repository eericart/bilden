class StudentController < ApplicationController
  before_action :signed_in_user
  def index
  end

  private
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
