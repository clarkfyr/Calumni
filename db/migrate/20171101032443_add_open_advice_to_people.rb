class AddOpenAdviceToPeople < ActiveRecord::Migration
  def change
    add_column :people, :open_advice, :string
  end
end
