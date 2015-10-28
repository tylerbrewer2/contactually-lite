class RemoveContactFileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :contact_file, :string
  end
end
