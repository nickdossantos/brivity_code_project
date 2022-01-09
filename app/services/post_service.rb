class PostService
  def self.create_new(author, params)
    params[:user_id] = author.id
    Post.new(params)
  end

  def self.update(post, params)
    post.update(params)
  end
end
