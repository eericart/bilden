class RemoveSubjectPrerequisiteToSubjects < ActiveRecord::Migration
  def change
    remove_reference :subjects, :subject_prerequisite, index: true
  end
end
