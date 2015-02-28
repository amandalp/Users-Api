class User < ActiveRecord::Base
	has_secure_password

  validates :username,
    uniqueness: true,
    presence: true

  has_many :contacts
  has_many :defenses
  has_many :triggers
  has_many :defense_checkins

  def self.authenticate username, password
    User.find_by_username(username).try(:authenticate,password)
  end
end
