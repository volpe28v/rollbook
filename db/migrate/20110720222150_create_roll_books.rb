class CreateRollBooks < ActiveRecord::Migration
  def self.up
    create_table :roll_books do |t|
      t.integer :user_id
      t.integer :event_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :roll_books
  end
end
