class Career < ActiveRecord::Base
  has_many :students

  self.primary_key = "code"
end
