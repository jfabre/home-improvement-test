class Project < ApplicationRecord
  self.inheritance_column = 'project_type'
  
  enum status: [ :created, :started, :stopped, :completed ]
  enum type: [ :public, :private ], _prefix: :project

end  