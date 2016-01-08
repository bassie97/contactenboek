class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    @message = Message.create! content: params[:message][:content], friendship: @friendship, user: current_user
    render nothing: true
  end

  private
  def set_chatroom
    @friendship = Friendship.find(params[:friendship_id])
  end
end