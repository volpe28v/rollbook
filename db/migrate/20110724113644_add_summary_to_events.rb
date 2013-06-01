class AddSummaryToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :summary, :string
  end

  def self.down
    remove_column :events, :summary
  end
end
