class UsersController < ApplicationController
  skip_before_action :authenticate_request
  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user, message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: { users: User.all.map(&:as_json) }
  end

  private

  def user_params
    params.permit(:username, :email, :password, :bio, :profile_picture, :first_name, :last_name)
  end
end
