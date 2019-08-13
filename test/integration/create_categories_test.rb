
require "test_helper"

class CreateCategoriesTest < ActionDispatch::IntegrationTest

    test "get new category form and create category" do
        get new_category_path

        # make sure we have gem 'rails-controller-testing'. if not add it to gemfile 
        # and do bundle install
        assert_template 'categories/new'

        # now we want to display this new category, how we are going to do that
        assert_difference 'Category.count', 1 do
            # the submission of a new form is handled by create action which is HTTP
            # post request, http post request to the categories_path
            # post_via_redirect categories_path, category: {name: "sports"}
            # for Rails 5 and above:
            post categories_path, params: {category: {name: "sports"}}
        end
        # this forces test to follow http 302 redirect
        follow_redirect!

        # after above action, we are sending the user to categories listing page
        assert_template 'categories/index'
        # then we want to verify it. we want to ensure the sports display on browser
        assert_match "sports", response.body
    end

    test "Invalid category submission results in failure" do
        get new_category_path

        assert_template 'categories/new'

        assert_no_difference 'Category.count' do
            post categories_path, params: {category: {name: " "}}
        end
        # this forces test to follow http 302 redirect
        # follow_redirect!

        assert_template 'categories/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end

end