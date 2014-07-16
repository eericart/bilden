class Career < ActiveRecord::Base
<<<<<<< HEAD
  has_many :subjects
  has_attached_file :pdf_file, , :default_url => "/careers/pdf/missing.pdf"
  validates_attachment_content_type :uploaded_file, :content_type =>['application/pdf']

end
=======
  has_many :students

  self.primary_key = "code"
end
>>>>>>> de3bb0aedb6dd15913d554a4ac47e8bd70a2d4eb
