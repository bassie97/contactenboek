class UsersController < ApplicationController
  before_action :authenticate_user!


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      error = @user.errors.full_messages.to_sentence
      flash.now[:error] = error
      render :new
    end
  end

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :house_phone,
        :email,
        :avatar,
        :mobile_phone,
        :date_of_birth,
        addresses_attributes: [:id, :country, :city, :street, :house_number, :address_kind, :zip_code, :_destroy])
  end
end
