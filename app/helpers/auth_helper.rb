module AuthHelper
  def generate_token(user)
    exptime = Time.now.to_i + Rails.application.secrets.api_token_exp
    payload = {iss: "example.com", exp: exptime, user_id: user.id}
    JWT.encode payload, Rails.application.secrets.api_secret_key, 'HS256'
  end
end
