require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  #間違った値を入力してeditが成功しない事を確認するテスト
  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                      email: "foo@invaild",
                                      password: "foo",
                                      password_confirmation: "bar" } }
    #失敗して正常にeditページへリダイレクトする。
    assert_template 'users/edit'
    assert_select "div.alert", 'The form contains 4 errors'
  end

  #値を入力してeditが成功した事を確認するテスト
  test 'successful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    #データベースから最新のユーザー情報を読み込み直して、正しく更新されたかどうかを確認する。
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
