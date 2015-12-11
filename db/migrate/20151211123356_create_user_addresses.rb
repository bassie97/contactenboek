class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|

      t.timestamps null: false
    end
  end
end
