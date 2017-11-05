class AddAttachmentResumeToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :people, :resume
  end
end

