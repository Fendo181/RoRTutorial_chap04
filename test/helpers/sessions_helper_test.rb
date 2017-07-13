require 'test_helper'
require 'minitest/mock'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  test 'current_user returns right user when session is nil' do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test 'current_user returns nil when remembe digest is wrong' do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

  test 'redirect_back_or session delete succes' do
    session[:forwading_url] = "example.com"
    redirect_back_or @user
    assert_nil session[:forwading_url]
  end

  private
    def redirect_to(default)
    end
end
