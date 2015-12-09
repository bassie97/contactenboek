class ContactsController < ApplicationController
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
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contct.save
        # Tell the UserMailer to send a welcome email after save
        emailer.first_mail(@contact).deliver_later

        format.html { redirect_to(contacts_path, notice: 'User was successfully created.') }
        format.json { render json: @contact, status: :created, location: contacts_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }

      end
    end
  end

  def update
    @contact = Contact.find(params[:id])

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
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

  def new
    @contact = Contact.new
    #2.times { @contact.addresses.build}
  end

  def edit
    @contact = Contact.find(params[:id])
    #2.times { @contact.addresses.build}
  end

  private
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
