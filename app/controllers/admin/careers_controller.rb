class Admin::CareersController < ApplicationController
  before_action :signed_in_user
  before_action :signed_in_admin


  def index
    @careers = Career.all
  end
  def show
    @career = Career.find(params[:id])
  end

  def destroy
    @career = Career.find(params[:id])
    @career.destroy
    respond_to do |format|
      format.html { redirect_to careers_url, success: 'Was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in."unless signed_in?
    end
    def signed_in_admin
      redirect_to root_path, status: 401 unless signed_admin?
    end
end
