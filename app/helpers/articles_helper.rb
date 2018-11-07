module ArticlesHelper
  def replace_image_tag(article_id, content)
    content.gsub(/\[img:(\d+)\]/) {"<img src='/articles/#{article_id}/article_images/#{$1}'>"}
  end
end
