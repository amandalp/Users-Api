class DefenseCheckinsController < ApplicationController
  before_action :set_defense_checkin, only: [:show]

  def index
  	@defense_checkins = DefenseCheckin.all

  	render json: @defense_checkins
  end

  def show
  	render json: @defense_checkin
  end

  def create
  	@defense_checkin = DefenseCheckin.new(defense_checkin_params)

  	if @defense_checkin.save
  		render json: @defense_checkin, status: :created, location: @defense_checkin
  	else
  		render json: @defense_checkin.errors, status: :unprocessable_entity
  	end
  end

  private

  def set_defense_checkin
  	@defense_checkin = DefenseCheckin.find(params[:id])
  end

  def defense_checkin_params
  	params.require(:defense_checkin).permit(:user_id, :defense_id)
  end
end
