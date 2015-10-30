require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  context "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "POST #create" do

    it "creates user" do
      params = { name: "Tyler", contact_file: fixture_file_upload('files/data.tsv') }
      expect { post :create, :user => params }.to change(User, :count).by(1)
    end

    it "creates contacts" do
      params = { name: "Tyler", contact_file: fixture_file_upload('files/data.tsv') }
      expect { post :create, :user => params }.to change(Contact, :count)
    end

  end

end
