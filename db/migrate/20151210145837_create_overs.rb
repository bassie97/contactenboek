class CreateOvers < ActiveRecord::Migration
  def change
    create_table :overs do |t|

      t.timestamps null: false
    end
  end
end
