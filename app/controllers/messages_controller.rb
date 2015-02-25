class MessagesController < ApplicationController
  def create
  	# get friends, and send each a message
  	body = "Sample message"
  	contacts = current_user.contacts
  	contacts.each do |contact|
  		message = GVapi.sms(contact.phone, body)
  	end
  	render json: message
  end

  def index
  end
end
