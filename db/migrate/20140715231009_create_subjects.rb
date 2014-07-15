class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :credits
      t.string :code
      t.references :subject_prerequisite, index: true

      t.timestamps
    end
  end
end
