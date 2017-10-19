class AddUniversityToPeople < ActiveRecord::Migration
  def change
    add_column :people, :university, :string
  end
end
