class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :mypost]
  before_action :set_post, only: [:show, :destroy]
  before_action :authorize_post_owner!, only: [:destroy]

  def index
    @posts = Post.with_attached_image.includes(:user).order(created_at: :desc)
  end

  def show
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "投稿が削除されました"
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
    redirect_to mypost_posts_path
  end

  def mypost
    @posts = current_user.posts.with_attached_image
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    unless @post
      redirect_to root_path, alert: "投稿が見つかりません"
    end
  end

  def authorize_post_owner!
    redirect_to root_path, alert: "権限がありません" if @post.user != current_user
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
