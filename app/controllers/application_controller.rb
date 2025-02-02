class ApplicationController < ActionController::API
    before_action :authenticate_request
  
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_token
    rescue_from JWT::DecodeError, with: :decode_error
  
    private
  
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id]) if decoded
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  
    def invalid_token
      render json: { error: "Invalid token" }, status: :unauthorized
    end
  
    def decode_error
      render json: { error: "Decode error" }, status: :unauthorized
    end
  end