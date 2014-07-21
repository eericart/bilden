class Career < ActiveRecord::Base
  before_save { self.code = code.downcase }
  validates :code, presence: true,length: { minimum: 3, maximum: 3 } , uniqueness: { case_sensitive: false }

  has_many :career_subjects
  has_many :students
end
