require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invaild signup information" do
    get signup_path
    # 投稿失敗が成功するかを確認するテスト
    assert_no_difference 'User.count' do
        post signup_path, params: { user: { name: "",
                                         email: "user@invauld",
                                         password: "foo",
                                         password_confirmation: "bar"
                                       }
                                }
    end
    assert_template "users/new"
    assert_select 'div.alert'
    assert_select 'div.field_with_errors'
    assert_select 'form[action="/signup"]'
  end
end
