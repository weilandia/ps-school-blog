class PostLikesController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        post_like = post.post_likes.create(user_id: current_user.id)
        
        render json: {
            post_like: post_like,
            post: {
                like_count: post.post_likes.count
            }
        }
    end
end
