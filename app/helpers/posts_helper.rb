module PostsHelper
    def post_like_icon_class(post)
        if post.post_likes.where(user: current_user).present?
            "heart"
        else
            "heart-o"
        end
    end
end
