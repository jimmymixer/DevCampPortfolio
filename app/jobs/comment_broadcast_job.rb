class CommentBroadcastJob < ApplicationJob
  # This is being called in models/comment.rb
  # Comments go into a list queue
  queue_as :default

  # perform is being called in blogs.coffee line: 13
  def perform(comment)
    # This creates a channel
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    # This communicates with the rails app
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }

  end
end
