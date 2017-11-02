class AddGraduationDataToPeople < ActiveRecord::Migration
  def change
    add_column :people, :graduation_date, :string
  end
end
