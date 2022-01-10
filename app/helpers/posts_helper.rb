module PostsHelper
  def ensure_post_creator?(post, author)
    author&.id == post&.user_id
  end
end
