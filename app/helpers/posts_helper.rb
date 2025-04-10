module PostsHelper
  def post_image(post)
    post.image.attached? ? post.image : "post/default-image.jpg"
  end
end
