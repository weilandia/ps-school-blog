class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.create(user_id: current_user.id)

    render json: {
      like: like.attributes,
      post: {
        like_count: post.likes.count
      }
    }
  end
end
