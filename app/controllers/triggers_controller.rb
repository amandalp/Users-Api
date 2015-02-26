class TriggersController < ApplicationController
	before_action :set_trigger, only: [:show, :update, :destroy]

  def index
  	@triggers = Trigger.all

  	render json: @triggers
  end

	def show
  	render json: @triggers
  end
  
  def create
  	@trigger = Trigger.new(trigger_params)

  	if @trigger.save
  		render json: @trigger, status: :created, location: @trigger
  	else
  		render json: @trigger.errors, status: :unprocessable_entity
  	end
  end

  def update
  	@trigger = Trigger.find(params[:id])

  	if @trigger.update(trigger_params)
  		head :no_content
  	else
  		render json: @trigger.errors, status: :unprocessable_entity
  	end
  end

  private

  def set_trigger
  	@trigger = Trigger.find(params[:id])
  end

  def trigger_params
  	params.require(:trigger).permit(:user_id, :body, :isChecked)
  end
  
end
