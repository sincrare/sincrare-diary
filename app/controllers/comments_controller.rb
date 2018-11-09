class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to article_path(@comment.article), notice: 'コメントを投稿しました'
    else
      redirect_to article_path(@comment.article), notice: 'コメントの投稿に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:article_id, :name, :message)
  end
end
