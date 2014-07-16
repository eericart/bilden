class StudentsController < ApplicationController
  before_action :signed_in_user
  before_action :set_student

  def index
  end
  def show
  end

  private
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def set_student
      @student = current_user
    end
end
