class ArticlesController < ApplicationController

  def index
    @articles = Article.published.accessible(current_user).order_desc.page(params[:page])
  end

  def show
    @article = Article.published.accessible(current_user).find(params[:id])
  end

end
