class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request, only: [:login]
  
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        expires_at = 24.hours.from_now
        token = JsonWebToken.encode(user_id: user.id, expires_at: expires_at)
        render json: { user: user, token: token, expires_at: expires_at.strftime("%m-%d-%Y %H:%M"), message: "Login successful" }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  end