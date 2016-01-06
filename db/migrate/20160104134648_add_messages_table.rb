class AddMessagesTable < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.integer :friendship_id
      t.string :user_id
      t.text :content

      t.timestamps null: false
    end
  end

  def down
    drop_table :messages
  end
end
