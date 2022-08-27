Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.dig(:google_id), Rails.application.credentials.dig(:google_key)
end
OmniAuth.config.allowed_request_methods = %i[get]
#OmniAuth.config.allowed_request_methods = [:post, :get]
