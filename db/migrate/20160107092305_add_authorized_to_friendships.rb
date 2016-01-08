class AddAuthorizedToFriendships < ActiveRecord::Migration
  def up
    add_column :friendships, :authorized, :boolean, default: false
  end

  def down
    remove_column :friendships, :authorized
  end
end
