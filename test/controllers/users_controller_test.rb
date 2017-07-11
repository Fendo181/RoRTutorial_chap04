require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_users = users(:archer)
  end

  #ログインしてない状態でindexアクションにアクセスするとリダイレクトするを確認するテスト
  test 'should redirect index when not logged in' do
    get users_path
    assert_redirected_to login_url
  end

  #adminの属性の変更が禁止されている事をテストする。
  test 'should not allow the admin attribute to be edited via the web' do
    log_in_as(@other_users)
    assert_not @other_users.admin?
    #adminの属性を変更する。
    patch user_path(@other_users), params: {
                                  user: { password: @other_users.password,
                                          password_confirmation: @other_users.password,
                                          admin: true
                                        }
    }
    #データベースを更新して確認する。
    #@other_users.reload.admin?でfalseが返ってくるという事は変更されてない事を意味する。
    assert_not @other_users.reload.admin?
  end

  test 'should redirect edit whrn logged in as wrong user' do
    #archerでログインする。
    log_in_as(@other_users)
    #なぜかmichaelのページをいじる。
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect edit when logged in as wrong user' do
    log_in_as(@other_users)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end
end
