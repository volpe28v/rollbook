class AddStatusToRollBook < ActiveRecord::Migration
  def self.up
    add_column :roll_books, :status, :string , :default => "entry"
  end

  def self.down
    remove_column :roll_books, :status
  end
end
