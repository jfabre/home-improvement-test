module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, -> { includes :user }, as: :commentable
  end
end