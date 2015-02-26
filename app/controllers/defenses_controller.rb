class DefensesController < ApplicationController
	before_action :set_defense, only: [:show, :update, :destroy]

	def index
  	@defenses = Defense.all

  	render json: @defenses
 	end

	def show
  	render json: @defenses
	end

  def create
  	@defense = Defense.new(defense_params)

  	if @defense.save
  		render json: @defense, status: :created, location: @defense
  	else
  		render json: @defense.errors, status: :unprocessable_entity
  	end
  end

  def update
  	@defense = Defense.find(params[:id])

  	if @defense.update(defense_params)
  		head :no_content
  	else
  		render json: @defense.errors, status: :unprocessable_entity
  	end
  end

  private

  def set_defense
  	@defense = Defense.find(params[:id])
  end

  def defense_params
  	params.require(:defense).permit(:user_id, :body, :isChecked)
  end
end
