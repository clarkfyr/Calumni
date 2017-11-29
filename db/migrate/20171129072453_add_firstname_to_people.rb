class AddFirstnameToPeople < ActiveRecord::Migration
  def change
    add_column :people, :firstname, :string
  end
end
