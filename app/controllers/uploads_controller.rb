class UploadsController < ApplicationController

  def new
    @upload = Upload.new
  end

  def create
   @uploads = []
    if params[:attachments]
      params[:attachments].each {|file| @uploads.push(Upload.new(attachment: file))}
    else
      render :upload and return
    end
     respond_to do |format|
      if @uploads.all? { |u| u.save}
        format.html { redirect_to careers_path, notice: 'Upload was successfully created.' }
      else
        format.html { redirect_to careers_path , danger: 'Upload was successfully created.'}
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
