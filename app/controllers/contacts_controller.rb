class ContactsController < UserController
  before_action :contact, except: [:index, :new, :create]
  before_action :email_params, only: :email

  include ContactsHelper

  def index
    respond_to do |format|
      format.html do
        @contacts = Contact.all
      end
      format.json do
        render json: Contact.query(params[:q]).as_json(:only => [:id, :name, :email, :avatar])
      end
    end
  end

  def show

  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      error = @contact.errors.full_messages.to_sentence
      flash.now[:error] = error
      render :new
    end
  end

  def update
    respond_to do |format|
      format.html do
        if @contact.update(contact_params)
          redirect_to @contact
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

  def destroy
    @contact.destroy

    redirect_to contacts_path
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def email
    email = params[:mail][:email]
    # controleer of emailadres geldig is
    if email.match(/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/)
      Emailer.first_mail(params[:mail]).deliver
      flash[:success] = Contact.human_attribute_name(:email_send)
    else
      flash[:error] = Contact.human_attribute_name(:email_invalid)
    end
    redirect_to @contact
  end

  private
  def contact
    @contact = Contact.find(params[:id])
  end

  def email_params
    params.require(:mail).permit(:email, :subject, :message)
  end

  def contact_params
    params.require(:contact).permit(
      :name,
      :house_phone,
      :email,
      :avatar,
      :mobile_phone,
      :date_of_birth,
      addresses_attributes: [:id, :country, :city, :street, :house_number, :address_kind, :zip_code, :_destroy])
  end
end
