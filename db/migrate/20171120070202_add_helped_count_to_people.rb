class AddHelpedCountToPeople < ActiveRecord::Migration
  def change
    add_column :people, :helped_count, :integer
  end
end
