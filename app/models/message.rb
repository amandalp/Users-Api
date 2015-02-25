class Message < ActiveRecord::Base
	belongs_to :user

	def send_alert(phone, message)
		GVapi.sms(phone, message)
	end
end
