class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_author, only: %i[show new]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.order(created_at: :desc).page(params[:page] || 1).per(5)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.page(params[:page] || 1).per(5)
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    respond_to do |format|
      format.js
    end
  end

  # GET /posts/1/edit
  def edit
    respond_to do |format|
      format.js
      format.html { head :not_found }
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.js
      else
        format.js { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_author
    @author = current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
