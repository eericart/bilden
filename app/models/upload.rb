class Upload < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  def to_jq_upload
  {
    "name" => read_attribute(file),
    "url" => attachment.url,
    "size" => attachment.size,
    "delete_url" => upload_path(:id => id),
    "delete_type" => "DELETE"
  }
  end
end
