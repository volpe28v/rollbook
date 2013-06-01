class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    comment = Comment.new(params[:comment])
    event = Event.find(params[:event_id])
    event.comments << comment
    current_user.comments << comment

    comment.save

#    CommentMailer.sendmail(event.admin_event.user).deliver

    redirect_to event

  end

end
