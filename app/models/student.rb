class Student < User
	belongs_to :career, foreign_key:"career_code"
  has_and_belongs_to_many :records, :through => :subjects

   def career_name
       career.name
   end
end