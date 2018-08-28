class ArticlesController < ApplicationController

  def index
    @articles = Article.published.accessable(current_user).order_desc.page(params[:page])
  end

  def show
    @article = Article.published.accessable(current_user).find(params[:id])
  end

end
