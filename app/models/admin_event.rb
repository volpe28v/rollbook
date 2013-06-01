class AdminEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def <=> other
    other.event.start <=> self.event.start
  end
end
