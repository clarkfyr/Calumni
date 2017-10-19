class AddResumeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :resume, :string
  end
end
