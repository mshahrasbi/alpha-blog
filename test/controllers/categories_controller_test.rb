
require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
#class CategoriesControllerTest < ActionDispatch::IntegrationTest # for Rails 5 and above

    def setup
        @category = Category.create(name: 'sports')
    end

    test "should get categories index" do
        # rails 5
        #get categories_path # for Rails 5 and above
        get :index

        assert_response :success
    end 

    test "should get new" do
        # rails 5
        #get new_category_path # for Rails 5 and above
        get :new

        assert_response :success
    end

    test "should get show" do
        # rails 5
        #get category_path(@category) # for Rails 5 and above
        get :show, params: { 'id' => @category.id }

        assert_response :success
    end


end