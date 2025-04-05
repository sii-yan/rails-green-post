class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to comment.post
    else
      flash[:comment] = comment
      flash[:alert] = "投稿に失敗しました"
      redirect_back fallback_location: comment.post
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    # コメントしたユーザー本人だけ削除可能にする
    if comment.user == current_user
      comment.destroy
      flash[:notice] = 'コメントが削除されました。'
    else
      flash[:alert] = '削除する権限がありません。'
    end

    redirect_to comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end
end