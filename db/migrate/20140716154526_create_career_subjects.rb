class CreateCareerSubjects < ActiveRecord::Migration
  def change
    create_table :career_subjects do |t|
      t.references :career, index: true
      t.references :subject, index: true
      t.integer :credits_prerequisite, :default => 0

      t.timestamps
    end
  end
end
