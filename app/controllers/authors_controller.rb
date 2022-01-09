class AuthorsController < ApplicationController
  before_action :set_author, only: %i[edit update destroy]
  # GET /authors/1 or /authors/1.json
  def show
    @author = Author.includes(:posts, :comments).find(params[:id])
    # Number of posts
    # Comments index
    # Posts index paginated
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:body, :user_id, :post_id, :first_name, :last_name, :description)
  end
end
