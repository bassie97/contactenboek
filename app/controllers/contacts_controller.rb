class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def new
    @contact = Contact.new
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :house_phone, :email, :avatar, :mobile_phone )
  end


end
