class AddRequesterToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :requester, :integer
  end
end
