class AddDocumentColumnsToCareers < ActiveRecord::Migration
  def change
    add_attachment :careers, :documents
  end
end
