module SessionsHelper
  #渡されたユーザでログインする。
  def log_in(user)
    session[:user_id] = user.id
  end

  #ユーザを永続的にセッションに記憶する。
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #ユーザーを永続的セッションに記憶する
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #現在ログイン中のユーザを返す(いる場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ユーザがログインしていればtrue、その他ならfalseを返す。
  def logged_in?
    !current_user.nil?
  end
end
