class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def destroy
    @contact_id = params[:id]
    contact = Contact.find(params[:id])
    user = User.find(contact.user_id)
    contact.destroy
    respond_to do |format|
      # for testing purposes
      format.html { render :nothing => true }
      format.js{}
    end
  end
end
