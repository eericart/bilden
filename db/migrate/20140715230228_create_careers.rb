class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers,{:id => false, primary_key: :code} do |t|
      t.string :name
      t.integer :max_credits
      t.string :code, :limit => 3, :null => false

      t.timestamps
    end
  end
end

