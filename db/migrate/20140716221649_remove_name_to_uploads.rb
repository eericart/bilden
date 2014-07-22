class RemoveNameToUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :name, :string
  end
end
