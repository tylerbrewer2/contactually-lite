require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  context "GET #index" do
    it "renders the index template" do
      get :index, {:user_id => 1, :contacts_id => 1}
      expect(response).to render_template(:index)
    end
  end

  context "DELETE #destroy" do
    contact = Contact.new
    contact.first_name = "Tyler"
    contact.last_name = "Brewer"
    contact.email_address = "tylerbrewer02@gmail.com"
    contact.phone_number = contact.normalized_phone_number("614-448-6634")
    contact.company_name = "Contactually"
    contact.user_id = 1
    contact.save

    it "deletes a contact" do
      expect { delete :destroy, id: contact.id }.to change(Contact, :count).by(-1)
    end
  end

end
