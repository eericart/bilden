class Career < ActiveRecord::Base
  has_many :subjects
  has_attached_file :pdf_file, , :default_url => "/careers/pdf/missing.pdf"
  validates_attachment_content_type :uploaded_file, :content_type =>['application/pdf']

end