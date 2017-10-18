class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :description

      t.timestamps null: false
    end
  end
end
