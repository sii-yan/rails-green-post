class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy, :mypost]

  def index
    @posts = Post.with_attached_image.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @comment = Comment.new(post_id: @post.id)
    @comments = @post.comments.includes(:post).order(created_at: :desc)
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
    @post = current_user.posts.find_by(id: params[:id])

    if @post.nil?
      flash[:alert] = "投稿が見つかりません"
    elsif @post.destroy
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

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
