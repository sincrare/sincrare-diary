module ArticlesHelper
  def first_image(content)
    content.match("<img(\s)+.+?>")[0]
  end
end
