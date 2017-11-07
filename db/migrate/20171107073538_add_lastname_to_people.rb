class AddLastnameToPeople < ActiveRecord::Migration
  def change
    add_column :people, :lastname, :string
  end
end
