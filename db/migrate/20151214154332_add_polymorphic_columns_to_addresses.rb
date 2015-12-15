class AddPolymorphicColumnsToAddresses < ActiveRecord::Migration
  def up
    add_column :addresses, :addressable_id, :integer
    add_column :addresses, :addressable_type, :string
    remove_column :addresses, :contact_id
    add_index :addresses, :addressable_id
  end

  def down
    remove_column :addresses, :addressable_id
    remove_column :addresses, :addressable_type
    add_column :addresses, :contact_id, :integer
    remove_index :addresses, :addressable_id
  end
end
