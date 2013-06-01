class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  scope :latest, order("updated_at DESC").limit(10)

end
