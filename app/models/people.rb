class People < ActiveRecord::Base
  serialize :helpability, Array

  searchkick autocomplete: ['username',"company",'position']
  has_attached_file :avatar,styles: { medium: "300x300>", thumb: "100x100>" },

  :default_url => ActionController::Base.helpers.asset_path('missing.png')


  do_not_validate_attachment_file_type :avatar

  has_attached_file :resume
  do_not_validate_attachment_file_type :resume
  has_many :conversations, :foreign_key => :sender_id


  def self.all_helps
    ["resume", "interview", "submit referral", "company tour", "other"]
  end
  def self.mentor_response
    ["Accept", "Reject", "Done"]
  end
  def display_helpability
    self.helpability.join(", ")
  end


  def self.cust_search(search,type)
	where("LOWER(#{type}) LIKE ?", "%#{search}%") 
	# where("company LIKE ?", "%#{search}%")
  end

end
