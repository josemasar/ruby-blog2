class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
      @article.update_visits_count
      @comment = Comment.new
    end

    def new
      @article = Article.new
      @category = Category.all
    end

    def create
      @article = current_user.articles.new(articles_params)
      @article.categories = params[:categories]
      if @article.save
        redirect_to @article
      else
        render :new
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(articles_params)
        redirect_to @article
      else
        render :edit
      end
    end

    private

    def articles_params
      params.require(:article).permit(:title, :body, :categories)
    end

  end