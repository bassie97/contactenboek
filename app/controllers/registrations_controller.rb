class RegistrationsController < Devise::RegistrationsController

  def update
    @user = current_user
    respond_to do |format|
      format.html do
        if @user.update_with_password(account_update_params)
          redirect_to @user
        else
          render 'edit'
        end
      end
      format.json do
        @contact.avatar = params[:file]
        @contact.save
        render json: @contact.avatar
      end
    end
  end

  def edit

  end

  def sign_up_params
    params.require(:user).permit(
        :name,
        :house_phone,
        :email,
        :avatar,
        :mobile_phone,
        :date_of_birth,
        :password,
        :password_confirmation,
        user_addresses_attributes: [:id, :country, :city, :street, :house_number, :address_kind, :zip_code, :_destroy])
  end

  def account_update_params
    params.require(:user).permit(
        :name,
        :house_phone,
        :email,
        :avatar,
        :mobile_phone,
        :date_of_birth,
        :password,
        :password_confirmation,
        :current_password,
        user_addresses_attributes: [:id, :country, :city, :street, :house_number, :address_kind, :zip_code, :_destroy])
  end
end