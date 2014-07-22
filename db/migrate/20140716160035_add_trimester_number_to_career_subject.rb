class AddTrimesterNumberToCareerSubject < ActiveRecord::Migration
  def change
    add_column :career_subjects, :trimester_number, :integer
  end
end
