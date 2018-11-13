class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    # @comment = current_user.comments.new(comment_params)
    @comment = @articles.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@comment.article), notice: 'コメントを投稿しました'
    else
      redirect_to article_path(@comment.article), notice: 'コメントの投稿に失敗しました'
    end
  end

  private

  def set_article
    @article = Article.published.accessible(current_user).find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:article_id, :name, :message)
  end
end
