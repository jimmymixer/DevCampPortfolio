class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }

  # This is being called in jobs/comment_broadcast_jobs.rb
  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
