class PostsController < ApplicationController
  #before_action의 빈 부분을 작성하시오.
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    #이 부분을 작성하시오.
    @posts = Post.all
  end

  # GET /posts/1
  def show
    #이 부분을 작성하시오.

  end

  # GET /posts/new
  def new
    #이 부분을 작성하시오.
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    #이 부분을 작성하시오.

  end

  # POST /posts
  def create
    #이 부분을 작성하시오.
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    #이 부분을 작성하시오.
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    #이 부분을 작성하시오.
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
