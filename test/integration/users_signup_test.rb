require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invaild signup information" do
    get signup_path
    # データ投稿後もユーザが変わっていないテスト。 = バリデーションが正しく動いている。
    assert_no_difference 'User.count' do
        post users_path, params: { user: { name: "",
                                         email: "user@invauld",
                                         password: "foo",
                                         password_confirmation: "bar"
                                       }
                                }
    end
    assert_template "users/new"
  end
end
