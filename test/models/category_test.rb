
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    # first test
    test "category should be valid" do
        assert @category.valid?
    end

    # must category has - validates :name, presence: true
    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    # must category has - validate_uniqueness_of :name
    test "name should be unique" do
        @category.save
        category2 = Category.new( name: "sports")

        assert_not category2.valid?
    end

    # must category has - length: { minimum: 3, maximum: 25}
    test "name should not be too long" do
        @category.name = "a" * 80

        assert_not @category.valid?
    end

    # must category has - length: { minimum: 3, maximum: 25}
    test "name should not bo too short" do
        @category.name = "aa"

        assert_not @category.valid?
    end

end