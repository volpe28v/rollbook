class RollBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def self.has_user?( user )
    return false if user == nil
    return where(:user_id => user.id).size != 0 ? true : false
  end

  def self.entry_emails
    self.entry.inject([]){|all_email,rb| all_email << rb.user.email}.join(", ")
  end

  scope :entry, where("status != ?","cancel").order("updated_at ASC")
  scope :cancel, where("status = ?","cancel").order("updated_at ASC")

  def <=> other
    other.event.start <=> self.event.start
  end
end
