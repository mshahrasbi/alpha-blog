
class ArticlesController < ApplicationController
    # this line will making sure that before these actions will call set_article and therefor we
    # have set the @article
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new 
        @article = Article.new
    end

    def edit
    end

    def index 
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def show 
    end

    def create
        # render plain: params[:article].inspect
        # here article_params, will cantains the categories array as well and it knows
        # what to do with it, only things we have to do is to make sure we update the 
        # article_params function with category_ids: [] (white list this collection)
        @article = Article.new(article_params)

        @article.user = current_user

        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        if @article.destroy()
            flash[:danger] = "Article was successfully deleted"
            redirect_to articles_path
        else
            flash[:success] = "Article was NOT deleted"
            render 'index'
        end
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :description, category_ids: [])
        end

        def set_article
            @article = Article.find(params[:id])
        end

        def require_same_user
            if current_user != @article.user && !current_user.admin?
                flash[:danger] = "You can only edit or delete your own articles"
                redirect_to root_path
            end
        end
end