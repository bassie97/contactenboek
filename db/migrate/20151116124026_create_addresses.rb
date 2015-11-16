class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :contact_id
      t.string :address
      t.string :country
      t.string :city
      t.string :street
      t.integer :house_number

      t.timestamps null: false
    end
  end
end
