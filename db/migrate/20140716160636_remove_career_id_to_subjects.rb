class RemoveCareerIdToSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :career_id, :integer
  end
end
