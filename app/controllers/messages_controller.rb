class MessagesController < ApplicationController

before_action do
    @conversation = Conversation.find(params[:conversation_id])
end

def index
    @people= People.select{|p| p.email==cookies[:email]}
    @messages = @conversation.messages

    if @messages.length > 10
        @over_ten = true
        @messages = @messages[-10..-1]
    end

    if params[:m]
        @over_ten = false
        @messages = @conversation.messages
    end

    if @messages.last
        if @messages.last.people_id != current_user
            @messages.last.read = true;
        end
    end

    @message = @conversation.messages.new
end


def new
    @people= People.select{|p| p.email==cookies[:email]}
    @message = @conversation.messages.new
end

def create
    @people= People.select{|p| p.email==cookies[:email]}
    @message = @conversation.messages.new(message_params)


    if message_params[:body].blank?
        flash[:notice] = "Please do not send empty message"
        redirect_to conversation_messages_path(@conversation) and return
    end

    @selected_help = params[:helps] || {}

    if @selected_help != {}
        if @selected_help.keys.size > 1
            flash[:notice] = "Please do not choose more than one help type."
            redirect_to conversation_messages_path(@conversation) and return
        else
            @conversation.update_attribute(:help_type, @selected_help.keys[0])
            @conversation.update_attribute(:help_status, "Pending")
        end
    end
    p @conversation


    if @message.save
        redirect_to conversation_messages_path(@conversation)
    end
end

private

def message_params
    @people= People.select{|p| p.email==cookies[:email]}
    params.require(:message).permit(:body, :people_id)
end


end
