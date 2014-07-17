class UploadsController < ApplicationController
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
        format.html { redirect_to careers_path, notice: 'Upload was successfully created.' }
      else
        flash[:danger]= 'Upload fail.'
        format.html { redirect_to new_upload_path }
      end
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to careers_url, success: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
