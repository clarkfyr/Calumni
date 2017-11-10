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
	if Conversation.between(params[:sender_id],params[:recipient_id]).present?
		@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
	else
		@conversation = Conversation.create!(conversation_params)
	end

	redirect_to conversation_messages_path(@conversation)

end

private

def conversation_params
    @people= People.select{|p| p.email==cookies[:email]}
	params.permit(:sender_id, :recipient_id)
end

end
