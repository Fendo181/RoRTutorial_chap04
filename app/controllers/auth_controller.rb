class AuthController < ApplicationController

  protect_from_forgery with: :null_session

  def login_api
    @user = User.find_by(email: params[:email].downcase)
      if @user && @user.authenticate(params[:password])
        render "authed"
      else
        render "unauthed"
      end
  end
end
