class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_admin

  def index
    @careers = Career.all
  end


  def show
  end

  def new
    @career = Career.new
  end

  def edit
  end


  def create
    @career = Career.new(career_params)

    respond_to do |format|
      if @career.save
        format.html { redirect_to @career, notice: 'Career was successfully created.' }
        format.json { render :show, status: :created, location: @career }
      else
        format.html { render :new }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @career.update(career_params)
        format.html { redirect_to @career, notice: 'Career was successfully updated.' }
        format.json { render :show, status: :ok, location: @career }
      else
        format.html { render :edit }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
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
      @career = Career.find(params[:id])
    end

    def career_params
      params[:career]
    end

    def signed_in_admin
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
      render_404 unless signed_admin?
    end
end
