require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'layout lnks' do
    get root_path
    assert_template 'static_pages/home'
    #Homeページのリンクの個数も調べる
    assert_select 'a[href=?]', root_path, count: 2
    #"?" をabout_pathに置換しています
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get contact_path
    assert_select 'title', full_title('Contact')
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

  #ログイン済みのユーザ
  test 'login success layout lnks' do
    log_in_as(@user)
    get root_path
    #index
    assert_select "a[href=?]", users_path
    #show
    assert_select "a[href=?]", user_path(@user)
    #edit
    assert_select "a[href=?]", edit_user_path(@user)
    #logout
    assert_select "a[href=?]", logout_path
  end

  #ログイン済みでないユーザ
  test 'not login success layout lnks' do
    #ログインページへ飛ぶ。
    get login_path
    assert_select "a[href=?]", login_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    #sign up
    assert_select 'a[href=?]', signup_path
    
  end

end
