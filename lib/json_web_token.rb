require 'jwt'

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  # Converts the application's secret key base to a string
  # Rails.application.secrets.secret_key_base.to_s
  
  # Encode a payload into a JWT token
  def self.encode(payload, exp = 30.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # Decode a JWT token into a payload
  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature, JWT::DecodeError => e
    raise e
  end
end