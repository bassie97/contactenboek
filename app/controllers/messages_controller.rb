class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    @message = Message.create! content: params[:message][:content], friendship: @friendship, user: current_user
    render nothing: true
  end

  private
  def set_chatroom
    @friendship = current_user.friendships.find_by(id: params[:friendship_id])
    @friendship = current_user.inverse_friendships.find_by(id: params[:friendship_id]) unless  @friendship
  end
end