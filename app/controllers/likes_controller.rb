class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.likes.create(user: current_user)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    like = @post.likes.find_by(user: current_user)
    like&.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
