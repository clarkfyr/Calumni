class People < ActiveRecord::Base
  serialize :helpability, Array

  searchkick autocomplete: ['username',"company",'position']
  def search_data
    {
      username: username,
      company: company,
      position: position,
      url:url,
      avatar:avatar,
      description:description,
      role:role,
    }
  end
  has_attached_file :avatar,styles: { medium: "300x300>", thumb: "100x100>" },

  :default_url => ActionController::Base.helpers.asset_path('missing.png')


  do_not_validate_attachment_file_type :avatar

  has_attached_file :resume
  do_not_validate_attachment_file_type :resume
  has_many :conversations, :foreign_key => :sender_id

  def self.search_type
    ['username','company','position']
  end
  def self.all_helps
    ["resume", "interview", "submit_referral", "company tour", "general advice"]
  end
  def self.mentor_response
    ["Accept", "Reject", "Done"]
  end
  def display_helpability
    if self.helpability.length>0
      # for collection checkbox, the first element is ""
      if self.helpability[0]==""
        start=1
      else
        start=0
      end
      self.helpability[start,self.helpability.length].join(" ,")
    end
  end


  def self.cust_search(search,type)
	where("LOWER(#{type}) LIKE ?", "%#{search}%") 
	# where("company LIKE ?", "%#{search}%")
  end

end
