class CreateSubjectsSubjects < ActiveRecord::Migration
  def change
    create_table :subjects_subjects do |t|
      t.references :subject
      t.references :subject
    end
  end
end
