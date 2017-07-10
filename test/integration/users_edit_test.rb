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
end
