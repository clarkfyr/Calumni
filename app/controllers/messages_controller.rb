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
end

def create
    @message = @conversation.messages.new(message_params)
    @selected_help = params[:helps] || {}
    if respond_to_help != false

    elsif flash_msg != false
        p 1
    elsif @selected_help != {}
        update_help
    
    elsif !@message.save
         return
    end
    redirect_to conversation_messages_path(@conversation)
end

private

def message_params
    @people= People.select{|p| p.email==cookies[:email]}
    params.require(:message).permit(:body, :people_id)
end



def update_help
    @selected_help = params[:helps] || {}
    @conversation.update_attribute(:help_type, @selected_help.keys[0])
    @conversation.update_attribute(:help_status, "Pending")
    @conversation.update_attribute(:requester, current_user.id)
end

# def respond_to_help
#     @people= People.select{|p| p.email==cookies[:email]}
#     @help_responds = params[:responds] || {}
#     if @help_responds != {} and @help_responds.keys[0] == "Done"
#         @conversation.update_attribute(:help_status, @help_responds.keys[0])
#         @people.first.update_attribute(:helped_count, @people.first.helped_count+1)
#         return true
#     elsif @help_responds != {}
#         @conversation.update_attribute(:help_status, @help_responds.keys[0])
#         return true
#     end
#     return false
# end


def respond_to_help
    @people= People.select{|p| p.email==cookies[:email]}
    @help_respond = params[:commit]
    if @help_respond == "Send"
        return false
    end
    if @help_respond == "Mark as Done"
        @conversation.update_attribute(:help_status, "Done")
        @people.first.helped_count ||= 0
        @people.first.update_attribute(:helped_count, @people.first.helped_count + 1)
        return true
    else
        @conversation.update_attribute(:help_status, @help_respond)
        return true
    end
end


def flash_msg
    @selected_help = params[:helps] || {}
    if message_params[:body].blank?
        flash[:notice] = "Please do not send empty message."
        return true
    elsif @selected_help&.keys.size > 1
        flash[:notice] = "Please do not choose more than one help type."
        return true
    end
    return false
end
end
