class AddStartDateToPeople < ActiveRecord::Migration
  def change
    add_column :people, :start_date, :string
  end
end
