class AddHelpabilityToPeople < ActiveRecord::Migration
  def change
    add_column :people, :helpability, :string
  end
end
