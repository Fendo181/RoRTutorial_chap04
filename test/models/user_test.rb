require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name:"Example user",email:"user@example.com")
  end

  #userオブジェクトが有効かどうか確認する。
  test "should be valid" do
    assert @user.valid?
  end

  #値存在性を確認する。
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
end
