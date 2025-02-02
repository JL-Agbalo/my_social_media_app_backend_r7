class ApplicationController < ActionController::API
  before_action :authenticate_request

  rescue_from ActiveRecord::RecordNotFound, with: :handle_unauthorized
  rescue_from JWT::DecodeError, with: :handle_unauthorized
  rescue_from JWT::ExpiredSignature, with: :handle_expired_token

  private

  def authenticate_request
    header = request.headers['Authorization']
    return handle_unauthorized if header.blank?

    token = header.split(' ').last
    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id]) if decoded
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    handle_unauthorized
  end

  def handle_unauthorized
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end

  def handle_expired_token
    render json: { errors: 'Token has expired' }, status: :unauthorized
  end
end