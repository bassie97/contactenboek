class MessagesController < ApplicationController
  before_action :set_message

  def create
    @message = Message.create! content: params[:message][:content], friendship: @friendship, user: current_user
  end

  private
  def set_message
    #todo: fiend friendship, as imaginary chatroom. need to know both user- and friend-id
    @friendship = Friendship.find(params[:friendship_id])
  end
end