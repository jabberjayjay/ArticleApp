class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article created successfully!"
            redirect_to @article
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article updated successfully!"
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id]) # find the article
        @article.destroy                      # destroy the article
        redirect_to articles_path    # redirect to the article list
    end

    

end