class AddHelpabilityFromPeople < ActiveRecord::Migration
  def change
    add_column :people, :helpability, :string, array:true, default: []
  end
end
