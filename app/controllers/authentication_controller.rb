class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      access_token = generate_access_token(user)
      decoded_token = JsonWebToken.decode(access_token)
      exp = decoded_token[:exp]
      render json: {
        user: user,
        token: access_token,
        expires_at: Time.at(exp).strftime("%m-%d-%Y %I:%M %p"),
        message: "Login successful"
      }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def generate_access_token(user)
    JsonWebToken.encode({ user_id: user.id }, 24.hours.from_now)
  end
end