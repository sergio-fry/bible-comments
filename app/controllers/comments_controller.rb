class CommentsController < InheritedResources::Base
  load_and_authorize_resource

  def create
    @comment.user = current_user
    create!
  end
end
