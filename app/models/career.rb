class Career < ActiveRecord::Base
  self.primary_key = "code"
  has_many :career_subjects
  has_many :students

  has_attached_file :documents_file, :default_url => "/careers/pdf/missing.pdf"
  validates_attachment_content_type :documents_file, :content_type =>['application/pdf']
end
