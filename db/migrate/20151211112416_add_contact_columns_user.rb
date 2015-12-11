class AddContactColumnsUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :house_phone, :text
    add_column :users, :mobile_phone, :text
    add_column :users, :avatar, :text
    add_column :users, :date_of_birth, :date
  end

  def down
    remove_column :users, :name, :string
    remove_column :users, :house_phone, :text
    remove_column :users, :mobile_phone, :text
    remove_column :users, :avatar, :text
    remove_column :users, :date_of_birth, :date
  end
end
