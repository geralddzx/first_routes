class ContactsController < ApplicationController
  
  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  def index
    contacts =[]
    Contact.contacts_for_user_id(params[:user_id]).each do |result|
      contacts << "#{result[:name]} email is #{result[:email]}"
    end
    render json: contacts
  end

  def new
    create
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      show
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def contact_params
    params[:contact][:user_id] = params[:user_id]
    params[:contact].permit(:name, :email, :user_id)
  end
end