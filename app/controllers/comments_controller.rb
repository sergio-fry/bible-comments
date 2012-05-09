class CommentsController < InheritedResources::Base
  before_filter :load_comments, :only => :index
  load_and_authorize_resource

  def create
    @comment.user = current_user
    create!
  end

  private

  def load_comments
    if current_user.present?
      @comments ||= Comment.where("(draft = ?) OR (draft = ? AND user_id = ?)", false, true, current_user.id)
    else # for guests
      @comments ||= Comment.where("draft = ?", false)
    end
  end
end
