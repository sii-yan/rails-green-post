class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :authorize_comment_owner!, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: "コメントを投稿しました"
    else
      flash[:alert] = "投稿に失敗しました"
      redirect_back fallback_location: @comment.post
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.post, notice: "コメントが削除されました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment_owner!
    redirect_to @comment.post, alert: "削除する権限がありません。" unless @comment.user == current_user
  end
end
