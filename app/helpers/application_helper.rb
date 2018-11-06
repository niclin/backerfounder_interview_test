module ApplicationHelper
  def render_upvote_link_by_voteable(voteable)
    if user_signed_in?
      link_to "^", upvote_path_by_voteable(voteable), method: :patch unless current_user.upvoted?(voteable)
    else
      link_to "^", new_user_session_path
    end
  end

  def upvote_path_by_voteable(voteable)
    name = voteable.model_name.to_s.downcase
    case name
    when "post"
      upvote_post_path(voteable)
    when "comment"
      upvote_comment_path(voteable)
    end
  end
end
