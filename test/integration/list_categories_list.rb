
require "test_helper"

class ListCategoriesList < ActionDispatch::IntegrationTest

    def setup
        @categoey1 = Category.create(name: "sports")
        @categoey2 = Category.create(name: "programming")
    end

    test "should show category listing" do
        get categories_path

        assert_template 'categories/index'

        # we want to test all our categories are list it and there are actual link to
        # category show page.
        assert_select 'a[href=?]', category_path(@category1), @category1.name
        assert_select 'a[href=?]', category_path(@category2), @category2.name
    end
end