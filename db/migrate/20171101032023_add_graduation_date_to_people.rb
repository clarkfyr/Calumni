class AddGraduationDateToPeople < ActiveRecord::Migration
  def change
    add_column :people, :graduationDate, :string
  end
end
