class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def destroy
    @contact_id = params[:id]
    contact = Contact.find(params[:id])
    user = User.find(contact.user_id)
    contact.destroy
  end
end
