class AddZipCode < ActiveRecord::Migration
  def up
    add_column :addresses, :zip_code, :string
  end
  def down
    remove_column :addresses, :zip_code
  end
end
