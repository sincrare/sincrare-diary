class ArticlesController < ApplicationController

  def index
    @articles = Article.published.accessible(current_user).default_order.page(params[:page])
  end

  def show
    @article = Article.published.accessible(current_user).find(params[:id])
  end
end
