module ArticlesHelper
  def replace_image_tag(article_id, content)
    # Controller なくても helper で imge.url を埋め込めば良さそう
    # article = Article.find(article_id)
    # content.gsub(/\[img:(\d+)\]/) do
    #   article_image = article.article_images.find($1)
    #   image_tag article_image.image.url
    # end
    content.gsub(/\[img:(\d+)\]/) {"<img src='/articles/#{article_id}/article_images/#{$1}'>"}
  end
end
