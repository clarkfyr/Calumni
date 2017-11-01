class People < ActiveRecord::Base
   has_attached_file :avatar,styles: { medium: "300x300>", thumb: "100x100>" }
   do_not_validate_attachment_file_type :avatar
	
	has_attached_file :resume
	do_not_validate_attachment_file_type :resume
   has_many :conversations, :foreign_key => :sender_id

end
