class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy ]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @article.update(article_params)
    if @article.valid?
      @article.save
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end
end

private

def article_params
  params.require(:article).permit(:title, :subtitle, :content)
end

def find_article
  @article = Article.find(params[:id])
end
