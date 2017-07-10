require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_users = users(:archer)
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
