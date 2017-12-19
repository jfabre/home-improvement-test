class Project < ApplicationRecord
  include Commentable
  self.inheritance_column = 'project_type'
  
  enum status: [ :created, :started, :stopped, :completed ]
  enum type: [ :public, :private ], _prefix: :project

  validates_presence_of :name, :type, :estimated_effort_level
end  