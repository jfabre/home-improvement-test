class Project < ApplicationRecord
  include Commentable
  self.inheritance_column = "project_type"
  
  belongs_to :owner, class_name: "User"

  enum status: [ :created, :started, :stopped, :completed ]
  enum type: [ :public, :private ], _suffix: :project

  delegate :full_name, to: :owner, prefix: true

  validates_presence_of :name, :type, :estimated_effort_level
end  