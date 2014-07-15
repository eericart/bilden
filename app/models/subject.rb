class Subject < ActiveRecord::Base
  has_and_belongs_to_many :subject_prerequisites,  class_name: "Subject", foreign_key: "subject_id"
  belongs_to :career,:dependent => :destroy
end
