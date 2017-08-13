require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:michael)
	end

	test "layout_links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2	
		assert_select "a[href=?]", helf_path	
		assert_select "a[href=?]", about_path	
		assert_select "a[href=?]", contact_path	
		get contact_path
		assert_select "title", full_title("Contact")
	end

	test "layout links for non-logged in user" do
		get root_path
		assert_template 'static_pages/home'

		assert_select "a[href=?]", users_path, count: 0
		assert_select "li.dropdown", count: 0
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", helf_path	
	end

	test "layout links for logged in users" do
		# have access to everything else
	end
end
