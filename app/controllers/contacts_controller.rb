class ContactsController < ApplicationController

  def destroy
    @contact_id = params[:id]
    contact = Contact.find(params[:id])
    user = User.find(contact.user_id)
    contact.destroy
  end
end
