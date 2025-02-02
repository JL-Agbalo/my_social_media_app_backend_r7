class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    login_params = params.require(:authentication).permit(:email, :password)
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
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
    JsonWebToken.encode({ user_id: user.id }, 30.minutes.from_now)
  end
end