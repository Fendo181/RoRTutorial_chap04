require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout lnks' do
    get root_path
    assert_template 'static_pages/home'
    # Homeページのリンクの個数も調べる
    assert_select "a[href=?]",root_path,count:2
    # "?" をabout_pathに置換しています
    assert_select "a[href=?]",help_path
    assert_select "a[href=?]",about_path
    assert_select "a[href=?]",contact_path
    get contact_path
    assert_select "title",full_title("Contact")
  end
end
