class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]  
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :require_permission, only: [:edit, :destroy, :update]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:hidden => false).most_recent.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
      redirect_to @post
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    flash[:success] = 'Post was successfully deleted.'
    redirect_to user_path(@post.user.username)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def require_permission
      unless current_user.own?(@post)
        redirect_to root_path
      end   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :banner_image_url, :hidden)
    end
end
