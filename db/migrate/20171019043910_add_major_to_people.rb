class AddMajorToPeople < ActiveRecord::Migration
  def change
    add_column :people, :major, :string
  end
end
