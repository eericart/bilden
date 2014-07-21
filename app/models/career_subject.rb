class CareerSubject < ActiveRecord::Base
  belongs_to :subject
  belongs_to :subject_prerequisite,  class_name: "Subject"
  belongs_to :career
end
