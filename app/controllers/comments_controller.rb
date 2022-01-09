class CommentsController < ApplicationController
  before_action :set_author, only: %i[create update destroy]
  before_action :set_post, only: %i[create index]
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
    render layout: false
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    # create comment service to pass user_id and post_id
    new_params = comment_params
    new_params[:user_id] = current_user.id
    new_params[:post_id] = params[:post_id].to_i
    @comment = Comment.new(new_params)
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
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
