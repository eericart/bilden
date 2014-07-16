class CreateStudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects do |t|
      t.references :user, index: true
      t.references :subjects, index: true
    end
  end
end
