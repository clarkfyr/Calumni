class Message < ActiveRecord::Base

	belongs_to :conversation
 	belongs_to :people, class_name: "People"

 	validates_presence_of :body, :conversation_id, :people_id

 	def message_time
  		# created_at.strftime("%m/%d/%y at %l:%M %p")
		created_at.getlocal
 	end

end
