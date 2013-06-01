class CreateAdminEvents < ActiveRecord::Migration
  def self.up
    create_table :admin_events do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_events
  end
end
