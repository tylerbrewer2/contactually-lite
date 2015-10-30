require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "created with all its attributes" do
    user = User.create(name: "Josh")

    contact = Contact.new
    contact.first_name = "Tyler"
    contact.last_name = "Brewer"
    contact.email_address = "tylerbrewer02@gmail.com"
    contact.phone_number = contact.normalized_phone_number("614-448-6634")
    contact.company_name = "Contactually"
    contact.user_id = user.id
    contact.save

    it "has a first name" do
      expect(contact.first_name).to eq("Tyler")
    end
    it "has a last name" do
      expect(contact.last_name).to eq("Brewer")
    end
    it "has an email address" do
      expect(contact.email_address).to eq("tylerbrewer02@gmail.com")
    end
    it "has a phone number" do
      expect(contact.phone_number).to eq("614-448-6634")
    end
    it "has a company name" do
      expect(contact.company_name).to eq("Contactually")
    end
    it "has a user" do
      expect(contact.user_id).to eq(user.id)
    end
  end

  context "created without attributes" do

    it "is not valid without a first name" do
      no_first_name = Contact.new(
        last_name: "Brewer",
        email_address: "tylerbrewer02@gmail.com",
        phone_number: "614-448-6634",
        company_name: "Contactually",
        user_id: 1
      )

      expect(no_first_name.valid?).to eq(false)
    end

    it "is not valid without a last name" do
      no_last_name = Contact.new(
        first_name: "Tyler",
        email_address: "tylerbrewer02@gmail.com",
        phone_number: "614-448-6634",
        company_name: "Contactually",
        user_id: 1
      )

      expect(no_last_name.valid?).to eq(false)
    end

    it "is not valid without an email address" do

      no_email_address = Contact.new(
        first_name: "Tyler",
        last_name: "Brewer",
        phone_number: "614-448-6634",
        company_name: "Contactually",
        user_id: 1
      )

      expect(no_email_address.valid?).to eq(false)
    end

    it "is not valid without a phone number" do
      no_phone_number = Contact.new(
        first_name: "Tyler",
        last_name: "Brewer",
        email_address: "tylerbrewer02@gmail.com",
        company_name: "Contactually",
        user_id: 1
      )
      expect(no_phone_number.valid?).to eq(false)
    end

    it "is not valid without a company name" do
      no_company_name = Contact.new(
        first_name: "Tyler",
        last_name: "Brewer",
        email_address: "tylerbrewer02@gmail.com",
        phone_number: "614-448-6634",
        user_id: 1
      )
      expect(no_company_name.valid?).to eq(false)
    end

    it "is not valid without a user" do
      no_user_id = Contact.new(
        first_name: "Tyler",
        last_name: "Brewer",
        email_address: "tylerbrewer02@gmail.com",
        phone_number: "614-448-6634",
        company_name: "Contactually",
      )
      expect(no_user_id.valid?).to eq(false)
    end

  end

  context "given various non-normalized phone numbers" do
    contact = Contact.new
    it "can normalize a number with parenthesis" do
        expect(contact.normalized_phone_number("(614)448-6634")).to eq("614-448-6634")
    end
    it "can normalize a number with parenthesis and extensions" do
        expect(contact.normalized_phone_number("(614)448-6634 x1234")).to eq("614-448-6634 x1234")
    end

    it "can normalize a number with a country code" do
        expect(contact.normalized_phone_number("1-614-448-6634")).to eq("614-448-6634")
    end
    it "can normalize a number with a country code and extensions" do
        expect(contact.normalized_phone_number("(614)448-6634 x1234")).to eq("614-448-6634 x1234")
    end

    it "can normalize a number with periods" do
        expect(contact.normalized_phone_number("614.448.6634")).to eq("614-448-6634")
    end

    it "can normalize a number with periods and extensions" do
        expect(contact.normalized_phone_number("(614)448-6634 x1234")).to eq("614-448-6634 x1234")
    end

  end

end
