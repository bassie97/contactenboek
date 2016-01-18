class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
  end

  def show
    @friendship = Friendship.for(current_user).find(params[:id])
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], user_id: params[current_user.id])
    errors = nil
    success = nil
    if @friendship.save
      success = "Vriend toegevoegd"
      path = user_path(@friendship.friend)
    else
      errors =  @friendship.errors.full_messages.to_sentence
      path = user_path(@friendship.friend)
    end

    respond_to do |format|
      format.html do
        flash[:success] = success if success
        flash[:notice] = errors if errors
        redirect_to path
      end
      format.json do
        if errors
          flash.now[:notice] = errors
          render json: render_to_string(partial: 'flash'), status: 500, formats: [:json]
        else
          render json: {html: render_to_string(@friendship, layout: false)}
        end
      end
    end
  end

  def destroy

    if Friendship.find_by(id: params[:id]).present?
      @friendship = Friendship.find(params[:id])
      if @friendship.user == current_user || @friendship.friend == current_user
        @friendship.destroy
      else
        flash[:notice] = "Vriendschap bestaat niet!"
      end
    else
      flash[:notice] = "Vriendschap bestaat niet!"
    end
    redirect_to friendships_path
  end
end
