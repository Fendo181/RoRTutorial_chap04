require 'jwt'

class AuthController < ApplicationController

  protect_from_forgery with: :null_session

  def login_api
    @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        #jwt
        issued_at = Time.now
        token = JWT.encode({ id: @user.id, iat: issued_at.to_i },
                Rails.application.secrets.secret_key_base, 'HS256')
        
        render "authed"
      else
        render "unauthed"
      end
  end
end
