class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :start
      t.datetime :end
      t.integer :capacity
      t.string :place

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
