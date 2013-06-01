class User < ActiveRecord::Base
  has_many :roll_books
  has_many :events, :through => :roll_books
  has_many :admin_events
  has_many :comments

  validates :name,
    :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :encrypted_password, :password, :password_confirmation, :remember_me

end
