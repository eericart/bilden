class Student < User
	belongs_to :career


   def career_name
       return career.name unless career.nil?
   end
end