class AddDateOfBirthToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :date_of_birth, :date
  end

  def down
    remove_column :contacts, :date_of_birth
  end
end
