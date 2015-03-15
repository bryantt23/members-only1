class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

def show
  @post=Post.find(params[:id])
end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def index
    @posts=Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title,:body)
  end

end
