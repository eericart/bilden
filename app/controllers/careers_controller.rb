class CareersController < ApplicationController
  before_action :set_career, only: [:show,:destroy]
  before_action :signed_in_admin

  def index
    @careers = Career.all
    @upload = Upload.new
    @uploads = Upload.all
  end

  def show
  end

  def destroy
    @career.destroy
    respond_to do |format|
      format.html { redirect_to careers_url, notice: 'Career was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_career
      @career = Career.find_by(params[:code])
    end
end
