class Upload < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  after_save     :process_data

  def to_jq_upload
  {
    "name" => read_attribute(file),
    "url" => attachment.url,
    "size" => attachment.size,
    "delete_url" => upload_path(:id => id),
    "delete_type" => "DELETE"
  }
  end

  private
    def process_data
      process=PdfProcess::Process.new (self)
      process.process_data
    end
end
