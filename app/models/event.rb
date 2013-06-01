class Event < ActiveRecord::Base
  has_many :roll_books
  has_many :users, :through => :roll_books
  has_one :admin_event
  has_many :comments

  # バリデーション
  validates :title,:content,:start,:capacity,:place,
    :presence => true
  validates :capacity,
    :numericality => { :only_integer => true, :greater_than => 0 }

  scope :future , where("start >= ?", DateTime.now).order("start ASC")
  scope :past , where("start < ?", DateTime.now).order("start DESC")
  scope :entry, includes(:roll_books).where("roll_books.status != ?",'cancel')

  scope :keyword, lambda {|keyword|
    where("content LIKE ? or title LIKE ? or place LIKE ?","%#{keyword}%","%#{keyword}%","%#{keyword}%")
  }

  def valid_entry_count
    self.roll_books.entry.count - self.sub_count 
  end

  def sub_count
    count = self.roll_books.entry.count - self.capacity
    return count > 0 ? count : 0
  end

  def is_done?
    self.start < DateTime.now ? true : false
  end
end
