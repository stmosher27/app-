class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    @contacts = Contact.find_by(id: params[:id])

    if @contacts
      render json: @contacts
    else
      redirect_to contact_url
    end
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contact_url(@contact)
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    if @contact.update_attributes(user_params)
      redirect_to contact_url(@contact)
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])

    if @contact
      @contact.delete
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :username, :user_id)
  end
end
