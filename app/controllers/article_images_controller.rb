# require 'csv'
class ArticleImagesController < ApplicationController
  def show
    # Controller なくても helper で imge.url を埋め込めば良さそう
    article = Article.accesible?(current_user).find(params[:article_id])
    article_image = article.article_images.find(params[:id])
    redirect_to article_image.image.url
    # data を返す必要はなさそう
    # data = open(article_image.image.url)
    # send_data data.read
  end
end
