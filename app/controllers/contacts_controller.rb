class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def destroy
    contact = Contact.find(params[:id])
    @contact_id = contact.id
    contact.destroy
    respond_to do |format|
      # for testing purposes
      format.html { render :nothing => true }
      format.js{}
    end
  end
end
