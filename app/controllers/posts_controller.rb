class PostsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      flash[:alert] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end
  
  def show
    # /posts/:id
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to root_path
  end
  
  private
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
