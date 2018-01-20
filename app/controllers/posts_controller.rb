class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  
  def edit
    @post = current_user.posts.find_by(id: params[:id])
    
    unless @post.present?
      flash[:alert] = "Post not found."
      redirect_to root_path
    end
  end
  
  def update
    @post = current_user.posts.find_by(id: params[:id])
    
    if @post.present?
      if @post.update_attributes(post_params)
        redirect_to post_path(@post)
      else
        flash[:alert] = @post.errors.full_messages
        redirect_to edit_post_path(@post)
      end
    else
      flash[:alert] = "Unauthorized."
      redirect_to root_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = current_user.posts.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end
  
  def destroy
    @post = current_user.posts.find_by(id: params[:id])

    if @post.present?
      @post.destroy
    else
      flash[:alert] = "Unauthorized."
    end
    
    redirect_to root_path
  end
  
  private
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
