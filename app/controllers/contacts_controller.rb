class ContactsController < ApplicationController

  def destroy
    contact = Contact.find(params[:id])
    user = User.find(contact.user_id)
    contact.destroy
    redirect_to user_path(user)
  end
end
