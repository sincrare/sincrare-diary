class Admin::ArticleImagesController < Admin::ApplicationController
  def create
    @article_image = ArticleImage.new(article_image_params)
    if @article_image.save
      render :json => { article_image_id: @article_image.id }
    else
      head :bad_request
    end
  end

  private

  def article_image_params
    params.require(:article_image).permit(:article_id, :image)
  end
end
