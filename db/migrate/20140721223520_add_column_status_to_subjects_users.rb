class AddColumnStatusToSubjectsUsers < ActiveRecord::Migration
  def change
    add_column :subjects_users, :status, :boolean
  end
end
