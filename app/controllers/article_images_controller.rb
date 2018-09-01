class ArticleImagesController < ApplicationController
  def show
    article = Article.find(params[:article_id])
    if article.accesible?(current_user)
      article_image = article.article_images.find(params[:id])
      data = open(article_image.image.url)
      send_data data.read, disposition: 'attachement'
    else
      head :not_found
    end
  end
end
