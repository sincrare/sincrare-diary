module ArticlesHelper
  def first_image(content)
    image_tags = content.match("<(img|IMG)(\s)+.+?>")
    image_tags[0] if image_tags.present?
  end
end
