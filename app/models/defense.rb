class Defense < ActiveRecord::Base
	belongs_to :user
	has_many :defense_checkins
end
