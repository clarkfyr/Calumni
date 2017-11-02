class RemoveResumeFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :resume, :string
  end
end