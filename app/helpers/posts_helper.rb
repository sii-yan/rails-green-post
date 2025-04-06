module PostsHelper
  def post_image(post)
    post.image.presence || "post/default-image.jpg"
  end
end
