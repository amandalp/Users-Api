class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :alert_all_contacts]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  def alert_all_contacts
    @user.contacts.each do |contact|
      # Send a text message:
      # GVapi.sms(phone, message)
      puts "Sending text message to:"
      puts contact.to_json
      GVapi.sms(contact.phone, "Hi")
    end
    puts "User has #{@user.contacts.length} contacts"
    render json: { success: true }
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user,{}).permit(:username, :password, :password_confirmation)
    end
    # def user_params
    #   params.require(:user).permit(:username, :password_digest)
    # end
end