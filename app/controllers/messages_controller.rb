class MessagesController < UsersController
  def create
    ActionCable.server.broadcast 'messages',
      message: params[:message][:body],
      username: current_user.name

    head :ok
  end
end