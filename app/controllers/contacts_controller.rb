class ContactsController < ApplicationController

  def destroy
    @contact_id = params[:id]
    contact = Contact.find(params[:id])
    user = User.find(contact.user_id)
    contact.destroy
    respond_to do |format|
      format.js {}
    end
  end
end
