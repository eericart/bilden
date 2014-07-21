class CareerSubject < ActiveRecord::Base
  belongs_to :subject
  has_and_belongs_to_many :subject_prerequisite,  class_name: "Subject"
  belongs_to :career
end
