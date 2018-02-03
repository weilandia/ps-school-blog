module LikesHelper
  def post_like_icon_class(post)
    if post.likes.where(user: current_user).present?
      "heart"
    else
      "heart-o"
    end
  end
end
