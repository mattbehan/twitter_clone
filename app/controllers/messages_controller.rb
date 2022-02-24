class MessagesController < ApplicationController
    def create 
        @message = Message.create(sender_id: current_user.id, receiver_id: params[:receiver_id], text: params[:message])
        SendMessageJob.new(@message).perform
        # ActionCable.server.broadcast("hypothetical_channel", message: message)
    end
end
