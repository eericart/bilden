class RecordsController < ApplicationController
 before_action :signed_in_user
  before_action :correct_user
  before_action :admin_sign_in


  def show
  end

  def index
    @subject = Career.new @student.career_id
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @student = User.find(params[:id])
      redirect_to(root_url) unless current_user? @student
    end
    def admin_sign_in
      redirect_to root_path if current_user.admin?
    end

end