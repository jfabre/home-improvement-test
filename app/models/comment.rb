class Comment < ApplicationRecord
  validates_presence_of :body, :user

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end