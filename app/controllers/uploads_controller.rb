class UploadsController < ApplicationController
  before_action :signed_in_user
  before_action :signed_in_admin

  def create
   @uploads = []
    if params[:upload]
      params[:upload][:files].each {|file| @uploads.push(Upload.new(attachment: file))}
    else
      flash[:danger]= 'Not file chosen.'
      redirect_to new_upload_path and return
    end
     respond_to do |format|
      if @uploads.all? { |u| u.valid?}
        @uploads.each { |u| u.save}
        flash[:success]= 'Upload was successfully created.'
        format.html { redirect_to admin_careers_path, notice: 'Upload was successfully created.' }
      else
        flash[:danger]= 'Upload fail.'
        format.html { redirect_to new_upload_path }
      end
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
