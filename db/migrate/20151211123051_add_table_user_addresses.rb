class AddTableUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :country
      t.string :city
      t.string :street
      t.integer :house_number

      t.timestamps null: false
    end
  end
end
