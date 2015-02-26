class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
  	@contacts = Contact.all

  	render json: @contacts
  end

  def show
  	render json: @contact
  end

  def create
  	@contact = Contact.new(contact_params)

  	if @contact.save
  		render json: @contact, status: :created, location: @contact
  	else
  		render json: @contact.errors, status: :unprocessable_entity
  	end
  end

  def update
  	@contact = Contact.find(params[:id])

  	if @contact.update(contact_params)
  		head :no_content
  	else
  		render json: @contact.errors, status: :unprocessable_entity
  	end
  end

  private

  def set_contact
  	@contact = Contact.find(params[:id])
  end

  def contact_params
  	params.require(:contact).permit(:user_id, :name, :phone)
  end
end
