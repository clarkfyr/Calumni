class AddAttachmentAvatarToPeople < ActiveRecord::Migration
  def up
    # change_table :people do |t|
    #   t.attachment :avatar
    # end
    add_attachment :people, :avatar
  end

  def down
    remove_attachment :people, :avatar
  end
end
