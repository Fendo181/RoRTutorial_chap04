class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        #ユーザログイン後にユーザ情報にリダイレクトする。
        log_in user
        params[:session][:remember] == '1' ? remember(user) : forget(user)
        redirect_to user
      else
        flash.now[:danger] = "Invalid email/password combination"
        render 'new'
      end
  end

  def destroy
    #logged_in?がされている場合のみlog_outする。
    log_out if logged_in?
    redirect_to root_url
  end
end
