# Service is a bit overkill for this use case. I wanted to layout a typical
# service class I would create when building an API or background job/worker.
class AuthorDisplayService
  class AuthorDisplayError < StandardError; end

  def initialize(params = {})
    @author_params = params[:author_params]
  end

  def call
    @author = Author.includes(:posts, :comments).find_by(id: @author_params[:id])
    raise AuthorDisplayError, 'User not found' unless @author

    OpenStruct.new({ success?: true, author: @author, latest_posts: author_latest_posts(@author) })
  rescue AuthorDisplayError => e
    OpenStruct.new({ success?: false, message: e.message })
  end

  private

  def author_latest_posts(author)
    author.posts&.take(4) || []
  end
end
