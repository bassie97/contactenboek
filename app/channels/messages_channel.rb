class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "friendships:#{data['message_id'].to_i}:messages"
    puts(data['message_id'].inspect)
  end

  def unfollow
    stop_all_streams
  end
end