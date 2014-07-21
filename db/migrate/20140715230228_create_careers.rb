class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|
      t.string :name
      t.integer :max_credits
      t.string :code, :limit => 3, :null => false, unique: true

      t.timestamps
    end
  end
end

