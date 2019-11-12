class ArticleImagesController < ApplicationController
  def show
    article = Article.find(params[:article_id])
    if article.accesible?(current_user)
      article_image = article.article_images.find(params[:id])
      redirect_to article_image.image.url
    end
  end
end
