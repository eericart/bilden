class Student < User
	belongs_to :career, foreign_key:"career_code"

   def career_name
       return career.name unless career.nil?
   end
end