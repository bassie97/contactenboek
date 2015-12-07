class AddAddressKind < ActiveRecord::Migration
  def up
    add_column :addresses, :address_kind, :string
  end

  def down
  remove_column :addresses, :address_kind
  end
end
