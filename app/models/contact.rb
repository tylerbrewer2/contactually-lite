class Contact < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name, :last_name, :email, :phone, :company, :user_id

  def self.create_new_contacts(tempfile, user)
    contact_file = tempfile.read.split("\n")
    contact_file.drop(1).each do |line|
      contact_info = line.split("\t")
      contact = Contact.new
      contact.first_name = contact_info[0]
      contact.last_name = contact_info[1]
      contact.email = contact_info[2]
      contact.phone = contact.normalized_phone_number(contact_info[3])
      contact.company = contact_info[4]
      contact.user_id = user.id
      contact.save
    end
  end

  def normalized_phone_number(number)
    number.gsub!(")", "-")
    number.gsub!("(", "")
    number.gsub!(".", "-")
    if number[0] + number[1] == "1-"
        number[0] = ""
        number[0] = ""
    end
    number
  end
end
