#Applicationヘルパーをテストするファイル

require 'test_helper'
class AppllicationHelperTest < ActionView::TestCase
  #app/helpers/application_helper.rbにfull_titleヘルパーに対する単体テスト
  test "full title helper" do
    assert_equal full_title,"Ruby on Rails Tutorial Sample App"
    assert_equal full_title("Help"),"Help | Ruby on Rails Tutorial Sample App"
  end
end
