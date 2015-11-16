class ModifyPhoneAddFieldMobilePhone < ActiveRecord::Migration
  def up
    add_column :contacts, :mobile_phone, :string
    rename_column :contacts, :phone, :house_phone
  end
  def down
    rename_column :contacts, :house_phone, :phone
    remove_column :contacts, :mobile_phone
  end
end
