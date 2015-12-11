class AddColumnsToUserAddresses < ActiveRecord::Migration
  def up
    add_column :user_addresses, :user_id, :integer
    add_column :user_addresses, :country, :text
    add_column :user_addresses, :city, :text
    add_column :user_addresses, :street, :text
    add_column :user_addresses, :house_number, :integer
    add_column :user_addresses, :address_kind, :text
    add_column :user_addresses, :zip_code, :text
  end

  def down
    remove_column :user_addresses, :user_id
    remove_column :user_addresses, :country
    remove_column :user_addresses, :city
    remove_column :user_addresses, :street
    remove_column :user_addresses, :house_number
    remove_column :user_addresses, :address_kind
    remove_column :user_addresses, :zip_code
  end
end
