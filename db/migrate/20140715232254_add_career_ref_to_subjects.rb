class AddCareerRefToSubjects < ActiveRecord::Migration
  def change
    add_reference :subjects, :career, index: true
  end
end
