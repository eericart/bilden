class CreateCareerSubjectsSubjectPrerequisite < ActiveRecord::Migration
  def change
    create_table :career_subjects_subjects do |t|
      t.references :subject, index: true
      t.references :career_subject
    end
  end
end
