class CreateUsersSubjects < ActiveRecord::Migration
  def change
    create_table :subjects_users, :id => false do |t|
      t.references :subject
      t.references :user
    end
  end
end
