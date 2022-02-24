class SendMessageJob < ApplicationJob
  queue_as :default

  def initialize message, **_args
    @message = message
    super()
  end

  def perform
    # binding.pry
    # is this not working because of ruby changes to splat operator?
    html = "<p>#{message.sender.name}: #{message.text}</p>"
    chat_id = [message.sender_id, message.receiver_id].sort.join("")
    ActionCable.server.broadcast("message_channel_#{chat_id}", {html: html})
  end

  private

  attr_accessor :message
end
