class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new 
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
