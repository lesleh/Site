class PostsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :set_default_title
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    if params[:year] && params[:month]
      @year = params[:year]
      @month = params[:month]
      @posts = Post.with_year_and_month(@year, @month)
    else
      @posts = Post.order(:created_at => :desc)
    end
  end

  def show
    @page_title = @post.title
    @disqus_shortname = Rails.application.secrets.disqus_shortname
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    flash[:success] = "Post was successfully created." if @post.save
    respond_with(@post)
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was successfully updated.'
    end
    respond_with(@post)
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    respond_with @post
  end

  private
    def set_default_title
      @page_title = "Blog"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
