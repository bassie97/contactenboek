class MessageRelayJob < ApplicationJob
  def perform(message)
    puts(message.inspect)
    ActionCable.server.broadcast "friendships:#{message.friendship_id}:messages",
      message: MessagesController.new.render_to_string(partial: 'messages/message', locals: { message: message, user: '' })
  end
end