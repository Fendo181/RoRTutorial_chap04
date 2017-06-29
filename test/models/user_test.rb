require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Example user",email:"user@example.com")
  end

  # trueであれば成功
  test "should be valid" do
    assert @user.valid?
  end

  #nameが空なら無効としたい = 無効(false)で成功ならassert_notメソッドを使う。
  test "name should be present" do
    @user.name = " 　"
    assert_not @user.valid?
  end

  #emailが空なら無効としたい = 無効(flase)で成功ならassert_notメソッドを使う。
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "naem should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

end
