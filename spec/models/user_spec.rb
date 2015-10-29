require 'rails_helper'

RSpec.describe User, type: :model do
  context "created with a name" do
    user = User.create(name: "Tyler")

    it "has a name" do
        expect(user.name).to eq("Tyler")
    end
  end

  context "created without a name" do
    no_name = User.new

    it "is not valid" do
      expect(no_name.valid?).to eq(false)
    end
  end

end
