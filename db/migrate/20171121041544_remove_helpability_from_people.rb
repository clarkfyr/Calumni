class RemoveHelpabilityFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :helpability, :string
  end
end
