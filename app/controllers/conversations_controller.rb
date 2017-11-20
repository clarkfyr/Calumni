class ConversationsController < ApplicationController

	# before_action :authenticate_user
	before_action :signed_in

def index
	@people= People.select{|p| p.email==cookies[:email]}
	@peoples = People.all
	@conversations = Conversation.all
end

def create
  @people= People.select{|p| p.email==cookies[:email]}
	p "sender_id"
	p params[:sender_id]
	p "recipient_id"
	p params[:recipient_id]
	p "calling create"
	if Conversation.between(params[:sender_id],params[:recipient_id]).present?
		@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
	else
		@conversation = Conversation.create!(conversation_params)
		@conversation.update_attribute(:help_status, "")
		@conversation.update_attribute(:help_type, "")
	end

	redirect_to conversation_messages_path(@conversation)
end

def update_help_type
    @conversation= Conversation.find(params[:conversation_id])
    @conversation.first.update_attributes(conversation_params)
    redirect_to conversation_messages_path(@conversation)
end

private
def conversation_params
    @people= People.select{|p| p.email==cookies[:email]}
	params.permit(:sender_id, :recipient_id)
end
end
