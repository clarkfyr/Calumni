class AddHelpTypeToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :help_type, :string
  end
end
