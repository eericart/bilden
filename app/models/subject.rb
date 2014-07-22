class Subject < ActiveRecord::Base
  has_many :career_subjects
  belongs_to :career,:dependent => :destroy
  has_and_belongs_to_many :users
  has_and_belongs_to_many :career_subjects

  def prerequisite (career)

  end
end
