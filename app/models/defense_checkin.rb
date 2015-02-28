class DefenseCheckin < ActiveRecord::Base
	belongs_to :user
	belongs_to :defense
end
