class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order_desc.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

end
