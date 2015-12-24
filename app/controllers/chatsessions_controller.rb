# class ChatsessionsController < ApplicationController
#   def create
#     cookies.signed[:username] = params[:chatsession][:username]
#     raise(params[:chatsession].inspect)
#     redirect_to messages_path
#   end
# end