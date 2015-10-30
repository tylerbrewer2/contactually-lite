class FixContactsColumnNames < ActiveRecord::Migration
  def change
    rename_column :contacts, :email, :email_address
    rename_column :contacts, :phone, :phone_number
    rename_column :contacts, :company, :company_name
  end
end
