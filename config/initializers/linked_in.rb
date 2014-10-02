LINKEDIN_CLIENT_ID = ENV['LINKEDIN_CLIENT_ID'] || '75k55hzeq4smvi'
LINKEDIN_CLIENT_SECRET = ENV['LINKEDIN_CLIENT_SECRET'] || 'MeNoNDrWuqf5zKPJ'
LINKEDIN_REDIRECT_URI = ENV['LINKEDIN_REDIRECT_URI'] || 'http://localhost:3000/linkedin/oauth2'

LinkedIn.configure do |config|
  config.client_id     = LINKEDIN_CLIENT_ID
  config.client_secret = LINKEDIN_CLIENT_SECRET

  # This must exactly match the redirect URI you set on your application's
  # settings page. If your redirect_uri is dynamic, pass it into
  # `auth_code_url` instead.
  config.redirect_uri  = LINKEDIN_REDIRECT_URI
end
