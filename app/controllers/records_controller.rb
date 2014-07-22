class RecordsController < ApplicationController
 before_action :set_career, only: [:show, :edit, :update]
  def show
  end

  def index
  	@career= Career.find @user_career 
  	  
  end

  def update
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career= Career.find(@current_user.career.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params.require(:career).permit(:name)
    end


end
