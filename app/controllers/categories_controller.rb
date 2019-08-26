
class CategoriesController < ApplicationController

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def show
        @category = Category.find(params[:id])
        @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end

    def create
        @category = Category.new(category_params)

        if @category.save 
            flash[:success] = "Category was created successfully"
            redirect_to categories_path
        else
            render 'new'
        end
    end

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            flash[:success] = "Category name was successfully updated"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end
end