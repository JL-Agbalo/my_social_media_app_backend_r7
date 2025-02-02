class Rack::Attack
  # Throttle login attempts by IP address
  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      Rails.logger.info "Throttling login attempt by IP: #{req.ip}"
      req.ip
    end
  end

  # Throttle login attempts by email address
  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/login' && req.post?
      Rails.logger.info "Throttling login attempt by email: #{req.params['authentication']['email']}"
      req.params['authentication']['email'].presence
    end
  end

  # Throttle signup attempts by IP address
  throttle('signups/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/signup' && req.post?
      Rails.logger.info "Throttling signup attempt by IP: #{req.ip}"
      req.ip
    end
  end

  # Throttle signup attempts by email address
  throttle('signups/email', limit: 5, period: 20.seconds) do |req|
    if req.path == '/signup' && req.post?
      Rails.logger.info "Throttling signup attempt by email: #{req.params['user']['email']}"
      req.params['user']['email'].presence
    end
  end

  # Block requests from a specific IP address
  blocklist('block 1.2.3.4') do |req|
    '1.2.3.4' == req.ip
  end

  # Allow all local traffic
  safelist('allow from localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Custom response for throttled requests
  self.throttled_responder = lambda do |env|
    [ 429,  # status
      { 'Content-Type' => 'application/json' },  # headers
      [{ error: 'Throttle limit reached. Retry later.' }.to_json]  # body
    ]
  end
end

Rails.application.config.middleware.use Rack::Attack