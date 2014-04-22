class ArticlesController < ApplicationController
  # new_article POST /articles(.:format)
  def new
    @article = Article.new
  end

  # article GET /articles/:id(.:format)
  def show
    # Find the article id
    @article = Article.find(params[:id])
  end

  # edit_article GET /articles/:id/edit(.:format)
  def edit
    # Find the article id
    @article = Article.find(params[:id])
  end

  # articles GET /articles(.:format)
  def index
    # Get all articles
    @articles = Article.all
  end

  # articles POST /articles(.:format)
  def create
    # This line below is to inspect submitted parameters
    # render plain: params[:article].inspect

    # Saving article to database
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article has been created."
    else
      render 'new'
    end
  end

  # article PUT /articles/:id(.:format)
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article has been updated."
    else
      render 'edit'
    end
  end

  # article DELETE /articles/:id(.:format)
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article has been deleted."
  end

  private
  # Strong parameters
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
