class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(whitelisted_post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(whitelisted_post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path
  end

  private 

  def whitelisted_post_params
    params.require(:post).permit(:title,:content)
  end
end
