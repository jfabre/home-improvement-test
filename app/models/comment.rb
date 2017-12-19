class Comment < ApplicationRecord
  validates_presence_of :body, :user

  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
  belongs_to :user

  delegate :full_name, :email, :image, to: :user, prefix: true
  delegate :name, to: :commentable, prefix: true
end