class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
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
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(
      :name,
      :house_phone,
      :email,
      :avatar,
      :mobile_phone,
      :date_of_birth
    )
  end


end
