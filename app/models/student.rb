class Student < User
	belongs_to :career, foreign_key:"career_code"

end