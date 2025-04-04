class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :destroy, :mypost]

  def index
    @posts = Post.with_attached_image.includes(:user)
  end

  def show
    @post = Post.includes(:user).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "投稿しました。"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "投稿が削除されました。"
    else
      flash[:alert] = "投稿の削除に失敗しました。"
    end

    redirect_to posts_url
  end

  def mypost
    @posts = current_user.posts.with_attached_image
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
