class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.string :company

      t.timestamps null: false
    end
  end
end
