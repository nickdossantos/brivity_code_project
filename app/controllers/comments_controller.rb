class CommentsController < ApplicationController
  before_action :set_author, only: %i[create]
  before_action :set_post, only: %i[create index]
  before_action :set_comment, only: %i[show edit]

  # GET /comments or /comments.json
  def index
    @comments = @post.comments.page(params[:page] || 1).per(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /comments/1 or /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_author
    @author = current_user
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, :author_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
